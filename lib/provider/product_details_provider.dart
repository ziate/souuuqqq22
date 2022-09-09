import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/body/review_body.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/base/api_response.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/product_model.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/response_model.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/response/review_model.dart';
import 'package:flutter_sixvalley_ecommerce/data/repository/product_details_repo.dart';
import 'package:flutter_sixvalley_ecommerce/helper/api_checker.dart';
import 'package:flutter_sixvalley_ecommerce/provider/banner_provider.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ProductDetailsProvider extends ChangeNotifier {
  final ProductDetailsRepo productDetailsRepo;

  ProductDetailsProvider({@required this.productDetailsRepo});

  List<ReviewModel> _reviewList;
  int _imageSliderIndex;
  bool _wish = false;
  int _quantity = 1;
  int _theChoiceQuantity = 1;
  int _variantIndex;
  List<int> _variationIndex;
  int _rating = 0;
  bool _isLoading = false;
  int _orderCount;
  int _wishCount;
  String _sharableLink;
  String _errorText;
  bool _hasConnection = true;
  bool _check = false;
  double _price = 0.0;
  bool _isPiece = true;

  //int checkValue=0;

  List<ReviewModel> get reviewList => _reviewList;

  int get imageSliderIndex => _imageSliderIndex;

  bool get isWished => _wish;

  int get quantity => _quantity;

  int get theChoiceQuantity => _theChoiceQuantity;

  int get variantIndex => _variantIndex;

  List<int> get variationIndex => _variationIndex;

  int get rating => _rating;

  bool get isLoading => _isLoading;

  int get orderCount => _orderCount;

  int get wishCount => _wishCount;

  String get sharableLink => _sharableLink;

  String get errorText => _errorText;

  bool get hasConnection => _hasConnection;

  bool get check => _check;

  double get price => _price;

  bool get isPiece => _isPiece;

  Future<void> initProduct(Product product, BuildContext context) async {
    _hasConnection = true;
    _variantIndex = 0;
    ApiResponse reviewResponse =
    await productDetailsRepo.getReviews(product.id.toString());
    if (reviewResponse.response != null &&
        reviewResponse.response.statusCode == 200) {
      Provider.of<BannerProvider>(context, listen: false)
          .getProductDetails(context, product.slug.toString());
      _reviewList = [];
      reviewResponse.response.data.forEach(
              (reviewModel) => _reviewList.add(ReviewModel.fromJson(reviewModel)));
      _imageSliderIndex = 0;
      _quantity = 1;
    } else {
      ApiChecker.checkApi(context, reviewResponse);
      if (reviewResponse.error.toString() ==
          'Connection to API server failed due to internet connection') {
        _hasConnection = false;
      }
    }
    notifyListeners();
  }

  void setIsPiece(bool isPiece) {
    _isPiece = isPiece;
    notifyListeners();
  }

  // void setCheck(int check) {
  //   checkValue = check;
  //   notifyListeners();
  // }

  void initData(Product product) {
    _variantIndex = 0;
    _quantity = 1;
    _isPiece = true;
    _theChoiceQuantity = 1;
    _variationIndex = [];
    product.choiceOptions.forEach((element) => _variationIndex.add(0));
  }

  void removePrevReview() {
    _reviewList = null;
    _sharableLink = null;
  }

  void setTheChoiceQuantity(int count) {
    _theChoiceQuantity = count;
    notifyListeners();
  }

  void getCount(String productID, BuildContext context) async {
    ApiResponse apiResponse = await productDetailsRepo.getCount(productID);
    if (apiResponse.response != null &&
        apiResponse.response.statusCode == 200) {
      _orderCount = apiResponse.response.data['order_count'];
      _wishCount = apiResponse.response.data['wishlist_count'];
    } else {
      ApiChecker.checkApi(context, apiResponse);
    }
    notifyListeners();
  }

  void getSharableLink(String productID, BuildContext context) async {
    ApiResponse apiResponse =
    await productDetailsRepo.getSharableLink(productID);
    if (apiResponse.response != null &&
        apiResponse.response.statusCode == 200) {
      _sharableLink = apiResponse.response.data;
    } else {
      ApiChecker.checkApi(context, apiResponse);
    }
  }

  void setErrorText(String error) {
    _errorText = error;
    notifyListeners();
  }

  void addPrice(
      double price,
      ) {
    _price = price;
    _quantity = 1;
    notifyListeners();
  }

  void removeData() {
    _errorText = null;
    _rating = 0;
    notifyListeners();
  }

  void changeFun() {
    _check = !_check;
    notifyListeners();
  }

  void setImageSliderSelectedIndex(int selectedIndex) {
    _imageSliderIndex = selectedIndex;
    notifyListeners();
  }

  void changeWish() {
    _wish = !_wish;
    notifyListeners();
  }

  void setQuantity(int value) {
    _quantity = value;
    notifyListeners();
  }

  void setCartVariantIndex(int index) {
    _variantIndex = index;
    _quantity = 1;
    notifyListeners();
  }

  void setCartVariationIndex(int index, int i) {
    _variationIndex[index] = i;
    _quantity = 1;
    notifyListeners();
  }

  void setRating(int rate) {
    _rating = rate;
    notifyListeners();
  }

  Future<ResponseModel> submitReview(
      ReviewBody reviewBody, List<File> files, String token) async {
    _isLoading = true;
    notifyListeners();

    http.StreamedResponse response =
    await productDetailsRepo.submitReview(reviewBody, files, token);
    ResponseModel responseModel;
    if (response.statusCode == 200) {
      _rating = 0;
      responseModel = ResponseModel('Review submitted successfully', true);
      _errorText = null;
      notifyListeners();
    } else {
      print('${response.statusCode} ${response.reasonPhrase}');
      responseModel = ResponseModel(
          '${response.statusCode} ${response.reasonPhrase}', false);
    }
    _isLoading = false;
    notifyListeners();
    return responseModel;
  }
}