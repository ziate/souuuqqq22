import 'package:flutter_sixvalley_ecommerce/data/model/response/product_model.dart';
import 'package:flutter_sixvalley_ecommerce/helper/parser.dart';

import 'package:flutter_sixvalley_ecommerce/helper/parser.dart';

class BannerModel {
  int id;
  String photo;
  String bannerType;
  int published;
  String createdAt;
  String updatedAt;
  String url;
  String resourceType;
  int resourceId;
  Product product;

  BannerModel(
      {this.id,
        this.photo,
        this.bannerType,
        this.published,
        this.createdAt,
        this.updatedAt,
        this.url,
        this.resourceType,
        this.resourceId,
        this.product
      });

  BannerModel.fromJson(Map<String, dynamic> json) {
    id = Parser.parseInt(json['id']);
    photo = Parser.parseString(json['photo']);
    bannerType = Parser.parseString(json['banner_type']);
    published = Parser.parseInt(json['published']);
    createdAt = Parser.parseString(json['created_at']);
    updatedAt = Parser.parseString(json['updated_at']);
    url = Parser.parseString(json['url']);
    resourceType = Parser.parseString(json['resource_type']);
    resourceId = Parser.parseInt(json['resource_id']);
    product = json['product'] != null && json['banner_type']=='product'? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['photo'] = this.photo;
    data['banner_type'] = this.bannerType;
    data['published'] = this.published;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['url'] = this.url;
    data['resource_type'] = this.resourceType;
    data['resource_id'] = this.resourceId;
    if (this.product != null) {
      data['product'] = this.product.toJson();
    }
    return data;
  }
}
