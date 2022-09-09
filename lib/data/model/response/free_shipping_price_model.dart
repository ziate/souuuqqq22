import '../../../helper/parser.dart';

class FreeShippingPriceModel {
  double minPrice;

  // FreeShippingPriceModel({minPrice});

  FreeShippingPriceModel.fromJson(Map<String, dynamic> json) {
    minPrice = Parser.parseDouble(json['number']);
  }
}