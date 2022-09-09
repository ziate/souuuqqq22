import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/category.dart';
import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
import 'package:flutter_sixvalley_ecommerce/provider/category_provider.dart';
import 'package:flutter_sixvalley_ecommerce/provider/theme_provider.dart';
import 'package:flutter_sixvalley_ecommerce/utill/color_resources.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:flutter_sixvalley_ecommerce/view/screen/product/brand_and_category_product_screen.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatelessWidget {
  const CategoryDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer<CategoryProvider>(
            builder: (context, categoryProvider, child) {
              return GridView.builder(
                  padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                  itemCount: categoryProvider
                      .categoryList[categoryProvider.categorySelectedIndex]
                      .subCategories
                      .length +
                      1,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: (0.8 / 0.8),
                  ),
                  itemBuilder: (ctx, index) {
                    SubCategory _subCategory;
                    if (index != 0) {
                      _subCategory = categoryProvider
                          .categoryList[categoryProvider.categorySelectedIndex]
                          .subCategories[index - 1];
                    }
                    if (index == 0) {
                      return Ink(
                        color: Theme.of(context).highlightColor,
                        child: Center(
                          child: ListTile(
                            title: Text(getTranslated('all', context),
                                style: titilliumSemiBold,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis),
                            trailing: Icon(Icons.navigate_next),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => BrandAndCategoryProductScreen(
                                        isBrand: false,
                                        id: categoryProvider
                                            .categoryList[categoryProvider
                                            .categorySelectedIndex]
                                            .id
                                            .toString(),
                                        name: categoryProvider
                                            .categoryList[categoryProvider
                                            .categorySelectedIndex]
                                            .name,
                                      )));
                            },
                          ),
                        ),
                      );
                    } else if (_subCategory.subSubCategories.length != 0) {
                      return Ink(
                        color: Theme.of(context).highlightColor,
                        child: Theme(
                          data: Provider.of<ThemeProvider>(context).darkTheme
                              ? ThemeData.dark()
                              : ThemeData.light(),
                          child: ExpansionTile(
                            key: Key(
                                '${Provider.of<CategoryProvider>(context).categorySelectedIndex}$index'),
                            title: Text(_subCategory.name,
                                style: titilliumSemiBold.copyWith(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .color),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis),
                            children: _getSubSubCategories(context, _subCategory),
                          ),
                        ),
                      );
                    } else {
                      return Ink(
                        color: Theme.of(context).highlightColor,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => BrandAndCategoryProductScreen(
                                      isBrand: false,
                                      id: _subCategory.id.toString(),
                                      name: _subCategory.name,
                                    )));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Theme.of(context).primaryColor.withOpacity(0.3),
                                  width: 1),
                              color: Theme.of(context).highlightColor,
                            ),
                            child: Center(
                              child: Text(_subCategory.name,
                                  style: titilliumSemiBold,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ),
                        ),
                        // trailing: Icon(Icons.navigate_next,
                        //     color: Theme.of(context).textTheme.bodyText1.color),
                        // ListTile(
                        //   title:
                        //   Text(_subCategory.name,
                        //       style: titilliumSemiBold,
                        //       maxLines: 2,
                        //       overflow: TextOverflow.ellipsis),
                        //   trailing: Icon(Icons.navigate_next,
                        //       color: Theme.of(context).textTheme.bodyText1.color),
                        //   onTap: () {
                        //     Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: (_) => BrandAndCategoryProductScreen(
                        //                   isBrand: false,
                        //                   id: _subCategory.id.toString(),
                        //                   name: _subCategory.name,
                        //                 )));
                        //   },
                        // ),
                      );
                    }
                  });
              // SingleChildScrollView(
              // child: Column(
              //   children: [
              // ListTile(
              //   title: Text(getTranslated('all', context),
              //       style: titilliumSemiBold,
              //       maxLines: 2,
              //       overflow: TextOverflow.ellipsis),
              //   trailing: Icon(Icons.navigate_next),
              //   onTap: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (_) => BrandAndCategoryProductScreen(
              //               isBrand: false,
              //               id: categoryProvider
              //                   .categoryList[categoryProvider
              //                   .categorySelectedIndex]
              //                   .id
              //                   .toString(),
              //               name: categoryProvider
              //                   .categoryList[categoryProvider
              //                   .categorySelectedIndex]
              //                   .name,
              //             )));
              //   },
              // ),

              // ListView.builder(
              //   shrinkWrap: true,
              //   physics: ClampingScrollPhysics(),
              //   padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
              //   itemCount: categoryProvider
              //           .categoryList[categoryProvider.categorySelectedIndex]
              //           .subCategories
              //           .length +
              //       1,
              //   itemBuilder: (context, index) {
              //     SubCategory _subCategory;
              //     if (index != 0) {
              //       _subCategory = categoryProvider
              //           .categoryList[categoryProvider.categorySelectedIndex]
              //           .subCategories[index - 1];
              //     }
              //     if (index == 0) {
              //       return Ink(
              //         color: Theme.of(context).highlightColor,
              //         child:
              //         ListTile(
              //           title: Text(getTranslated('all', context),
              //               style: titilliumSemiBold,
              //               maxLines: 2,
              //               overflow: TextOverflow.ellipsis),
              //           trailing: Icon(Icons.navigate_next),
              //           onTap: () {
              //             Navigator.push(
              //                 context,
              //                 MaterialPageRoute(
              //                     builder: (_) => BrandAndCategoryProductScreen(
              //                           isBrand: false,
              //                           id: categoryProvider
              //                               .categoryList[categoryProvider
              //                                   .categorySelectedIndex]
              //                               .id
              //                               .toString(),
              //                           name: categoryProvider
              //                               .categoryList[categoryProvider
              //                                   .categorySelectedIndex]
              //                               .name,
              //                         )));
              //           },
              //         ),
              //       );
              //     } else if (_subCategory.subSubCategories.length != 0) {
              //       return Ink(
              //         color: Theme.of(context).highlightColor,
              //         child: Theme(
              //           data: Provider.of<ThemeProvider>(context).darkTheme
              //               ? ThemeData.dark()
              //               : ThemeData.light(),
              //           child: ExpansionTile(
              //             key: Key(
              //                 '${Provider.of<CategoryProvider>(context).categorySelectedIndex}$index'),
              //             title: Text(_subCategory.name,
              //                 style: titilliumSemiBold.copyWith(
              //                     color: Theme.of(context).textTheme.bodyText1.color),
              //                 maxLines: 2,
              //                 overflow: TextOverflow.ellipsis),
              //             children: _getSubSubCategories(context, _subCategory),
              //           ),
              //         ),
              //       );
              //     } else {
              //       return Ink(
              //         color: Theme.of(context).highlightColor,
              //         child: ListTile(
              //           title: Text(_subCategory.name,
              //               style: titilliumSemiBold,
              //               maxLines: 2,
              //               overflow: TextOverflow.ellipsis),
              //           trailing: Icon(Icons.navigate_next,
              //               color: Theme.of(context).textTheme.bodyText1.color),
              //           onTap: () {
              //             Navigator.push(
              //                 context,
              //                 MaterialPageRoute(
              //                     builder: (_) => BrandAndCategoryProductScreen(
              //                           isBrand: false,
              //                           id: _subCategory.id.toString(),
              //                           name: _subCategory.name,
              //                         )));
              //           },
              //         ),
              //       );
              //     }
              //   },
              // ),
              // ],
              // ),
              // );
            }),
      ),
    );
  }
}

List<Widget> _getSubSubCategories(
    BuildContext context, SubCategory subCategory) {
  List<Widget> _subSubCategories = [];
  _subSubCategories.add(Container(
    color: ColorResources.getIconBg(context),
    margin:
    EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL),
    child: Flexible(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => BrandAndCategoryProductScreen(
                      isBrand: false,
                      id: subCategory.id.toString(),
                      name: subCategory.name,
                    )));
          },
          child: Text(
            getTranslated('all', context),
            style: titilliumSemiBold.copyWith(
                color: Theme.of(context).textTheme.bodyText1.color),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        )),
    // ListTile(
    //   title: Row(
    //     children: [
    //       Container(
    //         height: 7,
    //         width: 7,
    //         decoration: BoxDecoration(
    //             color: ColorResources.getPrimary(context),
    //             shape: BoxShape.circle),
    //       ),
    //       SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
    //       Flexible(
    //           child: Text(
    //         getTranslated('all', context),
    //         style: titilliumSemiBold.copyWith(
    //             color: Theme.of(context).textTheme.bodyText1.color),
    //         maxLines: 2,
    //         overflow: TextOverflow.ellipsis,
    //       )),
    //     ],
    //   ),
    //   onTap: () {
    //     Navigator.push(
    //         context,
    //         MaterialPageRoute(
    //             builder: (_) => BrandAndCategoryProductScreen(
    //                   isBrand: false,
    //                   id: subCategory.id.toString(),
    //                   name: subCategory.name,
    //                 )));
    //   },
    // ),
  ));
  for (int index = 0; index < subCategory.subSubCategories.length; index++) {
    _subSubCategories.add(Container(
      color: ColorResources.getIconBg(context),
      margin:
      EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_EXTRA_SMALL),
      child: Flexible(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => BrandAndCategoryProductScreen(
                        isBrand: false,
                        id: subCategory.subSubCategories[index].id.toString(),
                        name: subCategory.subSubCategories[index].name,
                      )));
            },
            child: Text(
              subCategory.subSubCategories[index].name,
              style: titilliumSemiBold.copyWith(
                  color: Theme.of(context).textTheme.bodyText1.color),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          )),
      // ListTile(
      //   title: Row(
      //     children: [
      //       Container(
      //         height: 7,
      //         width: 7,
      //         decoration: BoxDecoration(
      //             color: ColorResources.getPrimary(context),
      //             shape: BoxShape.circle),
      //       ),
      //       SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
      //       Flexible(
      //           child: Text(
      //         subCategory.subSubCategories[index].name,
      //         style: titilliumSemiBold.copyWith(
      //             color: Theme.of(context).textTheme.bodyText1.color),
      //         maxLines: 2,
      //         overflow: TextOverflow.ellipsis,
      //       )),
      //     ],
      //   ),
      //   onTap: () {
      //     Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //             builder: (_) => BrandAndCategoryProductScreen(
      //                   isBrand: false,
      //                   id: subCategory.subSubCategories[index].id.toString(),
      //                   name: subCategory.subSubCategories[index].name,
      //                 )));
      //   },
      // ),
    ));
  }
  return _subSubCategories;
}