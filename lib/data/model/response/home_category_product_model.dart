import 'package:flutter_sixvalley_ecommerce/data/model/response/product_model.dart';
import 'package:flutter_sixvalley_ecommerce/helper/parser.dart';

class HomeCategoryProduct {
  int id;
  String name;
  String slug;
  String icon;
  int parentId;
  int position;
  String createdAt;
  String updatedAt;
  List<Product> products;
  List<dynamic> translations;

  HomeCategoryProduct(
      {this.id,
        this.name,
        this.slug,
        this.icon,
        this.parentId,
        this.position,
        this.createdAt,
        this.updatedAt,
        this.products,
        this.translations});

  HomeCategoryProduct.fromJson(Map<String, dynamic> json) {
    id = Parser.parseInt(json['id']);
    name = Parser.parseString(json['name']);
    slug = Parser.parseString(json['slug']);
    icon = Parser.parseString(json['icon']);
    parentId = Parser.parseInt(json['parent_id']);
    position = Parser.parseInt(json['position']);
    createdAt = Parser.parseString(json['created_at']);
    updatedAt = Parser.parseString(json['updated_at']);
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) { products.add(new Product.fromJson(v)); });
    }

    if (json['translations'] != null) {
      translations = [];
      translations = List<dynamic>.from(translations.map((x) => x));
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['icon'] = this.icon;
    data['parent_id'] = this.parentId;
    data['position'] = this.position;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }

    if (this.translations != null) {
      data['translations'] = this.translations.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
