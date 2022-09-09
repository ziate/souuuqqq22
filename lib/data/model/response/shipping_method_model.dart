import 'package:flutter_sixvalley_ecommerce/helper/parser.dart';

class ShippingMethodModel {
  int id;
  int creatorId;
  String creatorType;
  String title;
  double cost;
  String duration;
  int status;
  String createdAt;
  String updatedAt;

  ShippingMethodModel(
      {int id,
        int creatorId,
        String creatorType,
        String title,
        double cost,
        String duration,
        int status,
        String createdAt,
        String updatedAt}) {
    this.id = id;
    this.creatorId = creatorId;
    this.creatorType = creatorType;
    this.title = title;
    this.cost = cost;
    this.duration = duration;
    this.status = status;
    this.createdAt = createdAt;
    this.updatedAt = updatedAt;
  }



  ShippingMethodModel.fromJson(Map<String, dynamic> json) {
    id = Parser.parseInt(json['id']);
    creatorId = Parser.parseInt(json['creator_id']);
    creatorType = Parser.parseString(json['creator_type']);
    title = Parser.parseString(json['title']);
    cost = json['cost'].toDouble();
    duration = Parser.parseString(json['duration']);
    status = Parser.parseInt(json['status']);
    createdAt = Parser.parseString(json['created_at']);
    updatedAt = Parser.parseString(json['updated_at']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['creator_id'] = this.creatorId;
    data['creator_type'] = this.creatorType;
    data['title'] = this.title;
    data['cost'] = this.cost;
    data['duration'] = this.duration;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
