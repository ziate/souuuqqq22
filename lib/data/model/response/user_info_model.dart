import 'package:flutter_sixvalley_ecommerce/helper/parser.dart';

class UserInfoModel {
  int id;
  String name;
  String method;
  String fName;
  String lName;
  String phone;
  String image;
  String email;
  String emailVerifiedAt;
  String createdAt;
  String updatedAt;

  UserInfoModel(
      {this.id, this.name, this.method, this.fName, this.lName, this.phone, this.image, this.email, this.emailVerifiedAt, this.createdAt, this.updatedAt});

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    id = Parser.parseInt(json['id']);
    name = Parser.parseString(json['name']);
    method = Parser.parseString(json['_method']);
    fName = Parser.parseString(json['f_name']);
    lName = Parser.parseString(json['l_name']);
    phone = Parser.parseString(json['phone']);
    image = Parser.parseString(json['image']);
    email = Parser.parseString(json['email']);
    emailVerifiedAt = Parser.parseString(json['email_verified_at']);
    createdAt = Parser.parseString(json['created_at']);
    updatedAt = Parser.parseString(json['updated_at']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['_method'] = this.method;
    data['f_name'] = this.fName;
    data['l_name'] = this.lName;
    data['phone'] = this.phone;
    data['image'] = this.image;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
