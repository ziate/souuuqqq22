import 'package:flutter_sixvalley_ecommerce/helper/parser.dart';

class SocialLoginModel {
  String token;
  String uniqueId;
  String medium;
  String email;

  SocialLoginModel({this.token, this.uniqueId, this.medium, this.email});

  SocialLoginModel.fromJson(Map<String, dynamic> json) {
    token = Parser.parseString(json['token']);
    uniqueId = Parser.parseString(json['unique_id']);
    medium = Parser.parseString(json['medium']);
    email = Parser.parseString(json['email']);

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['unique_id'] = this.uniqueId;
    data['medium'] = this.medium;
    data['email'] = this.email;
    return data;
  }
}
