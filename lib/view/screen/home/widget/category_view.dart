import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
import 'package:flutter_sixvalley_ecommerce/provider/category_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/splash_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/theme_provider.dart';
import 'package:flutter_sixvalley_ecommerce/utill/color_resources.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:flutter_sixvalley_ecommerce/utill/images.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/category/all_category_screen.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/category_details/category_details.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/product/brand_and_category_product_screen.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class CategoryView extends StatelessWidget {
  final bool isHomePage;

  CategoryView({@required this.isHomePage});

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(
      builder: (context, categoryProvider, child) {
        return categoryProvider.categoryList.length != 0
            ? GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 15,
            mainAxisSpacing: 5,
            childAspectRatio: (1 / 1.3),
          ),
          itemCount: isHomePage
              ? categoryProvider.categoryList.length > 8
              ? 8
              : categoryProvider.categoryList.length
              : categoryProvider.categoryList.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: ()  {
                Provider.of<CategoryProvider>(context, listen: false)
                    .changeSelectedIndex(index);

                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => CategoryDetails()));
              },
              child: Column(children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context)
                              .primaryColor
                              .withOpacity(.2)),
                      borderRadius: BorderRadius.circular(
                          Dimensions.PADDING_SIZE_SMALL),
                      color: Theme.of(context).highlightColor,
                      // boxShadow: [BoxShadow(
                      //   color: Colors.grey.withOpacity(0.3),
                      //   spreadRadius: 1,
                      //   blurRadius: 3,
                      //   offset: Offset(0, 3), // changes position of shadow
                      // )],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          Dimensions.PADDING_SIZE_SMALL),
                      child: FadeInImage.assetNetwork(
                        fit: BoxFit.cover,
                        placeholder: Images.placeholder,
                        image:
                        '${Provider.of<SplashProvider>(context, listen: false).baseUrls.categoryImageUrl}'
                            '/${categoryProvider.categoryList[index].icon}',
                        imageErrorBuilder: (c, o, s) => Image.asset(
                          Images.placeholder,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                FittedBox(
                  child: Center(
                    child: Text(
                      categoryProvider.categoryList.length != 0
                          ? categoryProvider.categoryList[index].name
                          : getTranslated('CATEGORY', context),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: titilliumRegular.copyWith(
                          fontSize: Dimensions.FONT_SIZE_SMALL,
                          color: ColorResources.getTextTitle(context)),
                    ),
                  ),
                ),
              ]),
            );
          },
        )
            : CategoryShimmer();
      },
    );
  }
}

class CategoryShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: (1 / 1),
      ),
      itemCount: 8,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.grey[
                Provider.of<ThemeProvider>(context).darkTheme ? 700 : 200],
                spreadRadius: 2,
                blurRadius: 5)
          ]),
          margin: EdgeInsets.all(3),
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Expanded(
              flex: 7,
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300],
                highlightColor: Colors.grey[100],
                enabled: Provider.of<CategoryProvider>(context)
                    .categoryList
                    .length ==
                    0,
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                    )),
              ),
            ),
            Expanded(
                flex: 3,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: ColorResources.getTextBg(context),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                  ),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[300],
                    highlightColor: Colors.grey[100],
                    enabled: Provider.of<CategoryProvider>(context)
                        .categoryList
                        .length ==
                        0,
                    child: Container(
                        height: 10,
                        color: Colors.white,
                        margin: EdgeInsets.only(left: 15, right: 15)),
                  ),
                )),
          ]),
        );
      },
    );
  }
}