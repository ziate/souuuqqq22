import 'package:flutter_sixvalley_ecommerce/data/model/response/product_model.dart';

import 'package:flutter_sixvalley_ecommerce/helper/parser.dart';

class WishListModel {
  int id;
  int customerId;
  int productId;
  String createdAt;
  String updatedAt;
  Product product;

  WishListModel({this.id, this.customerId, this.productId, this.createdAt, this.updatedAt, this.product});

  WishListModel.fromJson(Map<String, dynamic> json) {
    id = Parser.parseInt(json['id']);
    customerId = Parser.parseInt(json['customer_id']);
    productId = Parser.parseInt(json['product_id']);
    createdAt = Parser.parseString(json['created_at']);
    updatedAt = Parser.parseString(json['updated_at']);
    product = json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_id'] = this.customerId;
    data['product_id'] = this.productId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.product != null) {
      data['product'] = this.product.toJson();
    }
    return data;
  }
}
