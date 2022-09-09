import 'dart:convert';

import 'package:flutter_sixvalley_ecommerce/utill/app_constants.dart';

import '../api.dart';

Future<int> getFreeShippingPrice() async {
  String url = AppConstants.FREE_SHIPPING_PRICE_URI;
  // 'https://souqadam.com/api/v1/free-shipping-min';
  API _api = API();
  print('------------- from getter----------');
  Map dataReturned = await _api
      .getRequest(url: url, headers: {"Content-Type": "application/json"});
  int freeShippingPrice = dataReturned['number'];
  return freeShippingPrice;
}