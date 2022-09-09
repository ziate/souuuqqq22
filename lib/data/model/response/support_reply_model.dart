import 'package:flutter_sixvalley_ecommerce/helper/parser.dart';

class SupportReplyModel {
  int id;
  String customerMessage;
  String adminMessage;
  String createdAt;
  String updatedAt;

  SupportReplyModel(
      {this.id,
        this.customerMessage,
        this.adminMessage,
        this.createdAt,
        this.updatedAt});

  SupportReplyModel.fromJson(Map<String, dynamic> json) {
    id = Parser.parseInt(json['id']);
    customerMessage = Parser.parseString(json['customer_message']);
    adminMessage = Parser.parseString(json['admin_message']);
    createdAt = Parser.parseString(json['created_at']);
    updatedAt = Parser.parseString(json['updated_at']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_message'] = this.customerMessage;
    data['admin_message'] = this.adminMessage;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
