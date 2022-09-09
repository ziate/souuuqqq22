import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
import 'package:flutter_sixvalley_ecommerce/provider/order_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/profile_provider.dart';
import 'package:flutter_sixvalley_ecommerce/utill/color_resources.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/no_internet_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/address/widget/address_list_screen.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import 'add_new_address_screen.dart';
import 'select_location_screen.dart';

class SavedAddressListScreen extends StatefulWidget {
  SavedAddressListScreen({Key key}) : super(key: key);

  @override
  State<SavedAddressListScreen> createState() => _SavedAddressListScreenState();
}

class _SavedAddressListScreenState extends State<SavedAddressListScreen> {
  // GoogleMapController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.of(context).push(MaterialPageRoute(
      //         builder: (BuildContext context) => SelectLocationScreen()));
      //   },
      //   child: Icon(Icons.add, color: Theme.of(context).highlightColor),
      //   backgroundColor: ColorResources.getPrimary(context),
      // ),
      appBar: AppBar(
        title: Text(getTranslated('SHIPPING_ADDRESS_LIST', context)),
      ),
      body: SafeArea(child: Consumer<ProfileProvider>(
        builder: (context, profile, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                profile.addressList != null
                    ? profile.addressList.length != 0
                        ? SizedBox(
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: profile.addressList.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Provider.of<OrderProvider>(context,
                                            listen: false)
                                        .setAddressIndex(index);
                                    Navigator.pop(context);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal:
                                            Dimensions.PADDING_SIZE_DEFAULT),
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          top: Dimensions.PADDING_SIZE_SMALL),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color:
                                            ColorResources.getIconBg(context),
                                        border: index ==
                                                Provider.of<OrderProvider>(
                                                        context)
                                                    .addressIndex
                                            ? Border.all(
                                                width: 2,
                                                color: Theme.of(context)
                                                    .primaryColor)
                                            : null,
                                      ),
                                      child: AddressListPage(
                                          address: profile.addressList[index]),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        : Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(
                                bottom: Dimensions.PADDING_SIZE_LARGE),
                            child: NoInternetOrDataScreen(isNoInternet: false))
                    : Center(
                        child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Theme.of(context).primaryColor))),
              ],
            ),
          );
        },
      )),
      bottomNavigationBar: InkWell(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => SelectLocationScreen(),
          ),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          padding: EdgeInsets.all(8),
          height: 50,
          child: Center(
            child: Text(
              "أضغط هنا لإضافة عنوان".tr,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}
