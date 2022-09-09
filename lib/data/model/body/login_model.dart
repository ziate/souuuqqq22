import 'package:flutter_sixvalley_ecommerce/helper/parser.dart';

class LoginModel {
  String email;
  String password;

  LoginModel({this.email, this.password});

  LoginModel.fromJson(Map<String, dynamic> json) {
    email = Parser.parseString(json['email']);
    password = Parser.parseString(json['password']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}
