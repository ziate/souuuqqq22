import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
import 'package:flutter_sixvalley_ecommerce/provider/search_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/theme_provider.dart';
import 'package:flutter_sixvalley_ecommerce/utill/color_resources.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/no_internet_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/product_shimmer.dart';
import 'package:flutter_sixvalley_ecommerce/view/basewidget/search_widget.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/search/widget/search_product_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<SearchProvider>(context, listen: false).cleanSearchProduct();
    Provider.of<SearchProvider>(context, listen: false).initHistoryList();
    TextEditingController controller = TextEditingController();
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorResources.getIconBg(context),
        resizeToAvoidBottomInset: true,
        body: Column(
          children: [
            // Container(
            //   padding: EdgeInsets.symmetric(
            //       horizontal: Dimensions.HOME_PAGE_PADDING,
            //       vertical: Dimensions.PADDING_SIZE_SMALL),
            //   color: ColorResources.getHomeBg(context),
            //   alignment: Alignment.center,
            //   child: Container(
            //     padding: EdgeInsets.only(
            //       left: Dimensions.HOME_PAGE_PADDING,
            //       right: Dimensions.PADDING_SIZE_EXTRA_SMALL,
            //       top: Dimensions.PADDING_SIZE_EXTRA_SMALL,
            //       bottom: Dimensions.PADDING_SIZE_EXTRA_SMALL,
            //     ),
            //     height: 60,
            //     alignment: Alignment.centerLeft,
            //     decoration: BoxDecoration(
            //       color: Theme.of(context).cardColor,
            //       boxShadow: [
            //         BoxShadow(
            //             color: Colors.grey[
            //                 Provider.of<ThemeProvider>(context).darkTheme
            //                     ? 900
            //                     : 200],
            //             spreadRadius: 1,
            //             blurRadius: 1)
            //       ],
            //       borderRadius: BorderRadius.circular(
            //           Dimensions.PADDING_SIZE_EXTRA_SMALL),
            //     ),
            //     child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           // Text(getTranslated('SEARCH_HINT', context),
            //           //     style: robotoRegular.copyWith(color: Theme.of(context).hintColor)),
            //           Expanded(
            //             child: TextFormField(
            //               controller: controller,
            //               onFieldSubmitted: (query) {
            //                 Provider.of<SearchProvider>(context, listen: false)
            //                     .searchProduct(query, context);
            //                 Provider.of<SearchProvider>(context, listen: false)
            //                     .saveSearchAddress(query);
            //               },
            //               // onChanged: (query) {
            //               //   onTextChanged(query);
            //               // },
            //               textInputAction: TextInputAction.search,
            //               maxLines: 1,
            //               textAlignVertical: TextAlignVertical.center,
            //               decoration: InputDecoration(
            //                 hintText: getTranslated('SEARCH_HINT', context),
            //                 isDense: true,
            //                 hintStyle: robotoRegular.copyWith(
            //                     color: Theme.of(context).hintColor),
            //                 border: InputBorder.none,
            //                 //prefixIcon: Icon(Icons.search, color: ColorResources.getColombiaBlue(context), size: Dimensions.ICON_SIZE_DEFAULT),
            //                 suffixIcon: Provider.of<SearchProvider>(context)
            //                         .searchText
            //                         .isNotEmpty
            //                     ? IconButton(
            //                         icon: Icon(Icons.clear, color: Colors.black),
            //                         onPressed: () {
            //                           Provider.of<SearchProvider>(context,
            //                                   listen: false)
            //                               .cleanSearchProduct();
            //                           controller.clear();
            //                         },
            //                       )
            //                     : controller.text.isNotEmpty
            //                         ? IconButton(
            //                             icon: Icon(Icons.clear,
            //                                 color: ColorResources.getChatIcon(
            //                                     context)),
            //                             onPressed: () {
            //                               Provider.of<SearchProvider>(context,
            //                                       listen: false)
            //                                   .cleanSearchProduct();
            //                             },
            //                           )
            //                         : null,
            //               ),
            //             ),
            //           ),
            //           Container(
            //             width: 40,
            //             height: 40,
            //             decoration: BoxDecoration(
            //                 color: Theme.of(context).primaryColor,
            //                 borderRadius: BorderRadius.all(Radius.circular(
            //                     Dimensions.PADDING_SIZE_EXTRA_SMALL))),
            //             child: Icon(Icons.search,
            //                 color: Theme.of(context).cardColor,
            //                 size: Dimensions.ICON_SIZE_SMALL),
            //           ),
            //         ]),
            //   ),
            // ),
            // for tool bar
            Row(
              children: [
                InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.arrow_back_ios)),

                Expanded(
                  child: Container(
                    child: SearchWidget(
                      hintText: getTranslated('SEARCH_HINT', context),
                      onSubmit: (String text) {
                        Provider.of<SearchProvider>(context, listen: false)
                            .searchProduct(text, context);
                        Provider.of<SearchProvider>(context, listen: false)
                            .saveSearchAddress(text);
                      },
                      onClearPressed: () {
                        Provider.of<SearchProvider>(context, listen: false)
                            .cleanSearchProduct();
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Dimensions.PADDING_SIZE_DEFAULT,
            ),

            Consumer<SearchProvider>(
              builder: (context, searchProvider, child) {
                return !searchProvider.isClear
                    ? searchProvider.searchProductList != null
                    ? searchProvider.searchProductList.length > 0
                    ? Expanded(
                    child: SearchProductWidget(
                        products: searchProvider.searchProductList,
                        isViewScrollable: true))
                    : Expanded(
                    child:
                    NoInternetOrDataScreen(isNoInternet: false))
                    : Expanded(
                    child: ProductShimmer(
                        isHomePage: false,
                        isEnabled: Provider.of<SearchProvider>(context)
                            .searchProductList ==
                            null))
                    : Expanded(
                  flex: 4,
                  child: Container(
                    padding:
                    EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Consumer<SearchProvider>(
                          builder: (context, searchProvider, child) =>
                              StaggeredGridView.countBuilder(
                                crossAxisCount: 2,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: searchProvider.historyList.length,
                                itemBuilder: (context, index) => Container(
                                    alignment: Alignment.center,
                                    child: InkWell(
                                      onTap: () {
                                        Provider.of<SearchProvider>(context,
                                            listen: false)
                                            .searchProduct(
                                            searchProvider
                                                .historyList[index],
                                            context);
                                      },
                                      borderRadius: BorderRadius.circular(5),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 10),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(16),
                                            color: ColorResources.getGrey(
                                                context)),
                                        width: double.infinity,
                                        child: Center(
                                          child: Text(
                                            Provider.of<SearchProvider>(
                                                context,
                                                listen: false)
                                                .historyList[index] ??
                                                "",
                                            style: titilliumItalic.copyWith(
                                                fontSize: Dimensions
                                                    .FONT_SIZE_DEFAULT),
                                          ),
                                        ),
                                      ),
                                    )),
                                staggeredTileBuilder: (int index) =>
                                new StaggeredTile.fit(1),
                                mainAxisSpacing: 4.0,
                                crossAxisSpacing: 4.0,
                              ),
                        ),
                        Positioned(
                          top: -40,
                          left: 0,
                          right: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    getTranslated(
                                        'SEARCH_HISTORY', context),
                                    style: robotoBold),
                                // InkWell(
                                //     borderRadius:
                                //         BorderRadius.circular(10),
                                //     onTap: () {
                                //       Provider.of<SearchProvider>(context,
                                //               listen: false)
                                //           .clearSearchAddress();
                                //     },
                                //     child: Container(
                                //         padding: EdgeInsets.symmetric(
                                //             horizontal: Dimensions
                                //                 .PADDING_SIZE_DEFAULT,
                                //             vertical: Dimensions
                                //                 .PADDING_SIZE_LARGE),
                                //         child: Row(
                                //           children: [
                                //             Icon(Icons.clear,
                                //                 color: Theme.of(context)
                                //                     .primaryColor),
                                //             Text(
                                //               getTranslated(
                                //                   'REMOVE', context),
                                //               style: titilliumRegular
                                //                   .copyWith(
                                //                       fontSize: Dimensions
                                //                           .FONT_SIZE_SMALL,
                                //                       color: Theme.of(
                                //                               context)
                                //                           .primaryColor),
                                //             ),
                                //           ],
                                //         )))

                                TextButton(
                                    style: TextButton.styleFrom(
                                        backgroundColor: Theme.of(context)
                                            .primaryColor),
                                    onPressed: () {
                                      Provider.of<SearchProvider>(context,
                                          listen: false)
                                          .clearSearchAddress();
                                    },
                                    child: Icon(Icons.clear,
                                        color:
                                        Theme.of(context).cardColor)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}