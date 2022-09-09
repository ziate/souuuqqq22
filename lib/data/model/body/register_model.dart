import 'package:flutter_sixvalley_ecommerce/helper/parser.dart';

class RegisterModel {
  String email;
  String password;
  String fName;
  String lName;
  String phone;
  String socialId;
  String loginMedium;

  RegisterModel({this.email, this.password, this.fName, this.lName, this.socialId,this.loginMedium});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    email = Parser.parseString(json['email']);
    password = Parser.parseString(json['password']);
    fName = Parser.parseString(json['f_name']);
    lName = Parser.parseString(json['l_name']);
    phone = Parser.parseString(json['phone']);
    socialId = Parser.parseString(json['social_id']);
    loginMedium = Parser.parseString(json['login_medium']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['f_name'] = this.fName;
    data['l_name'] = this.lName;
    data['phone'] = this.phone;
    data['social_id'] = this.socialId;
    data['login_medium'] = this.loginMedium;
    return data;
  }
}
