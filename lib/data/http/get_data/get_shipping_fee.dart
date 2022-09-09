import 'package:flutter_sixvalley_ecommerce/utill/app_constants.dart';

import '../api.dart';

Future<int> getShippingFee() async {
  String url = AppConstants.SHIPPING_FEE;
  // 'https://souqadam.com/api/v1/free-shipping-min';
  API _api = API();
  print('------------- from getter----------');
  Map dataReturned = await _api
      .getRequest(url: url, headers: {"Content-Type": "application/json"});
  int freeShippingPrice = dataReturned['number'];
  return freeShippingPrice;
}