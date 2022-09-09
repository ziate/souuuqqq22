import 'package:flutter_sixvalley_ecommerce/helper/parser.dart';

class UpdateUserInfoModel {
  String fName;
  String lName;
  String phone;

  UpdateUserInfoModel({
    this.fName,
    this.lName,
    this.phone,
  });

  UpdateUserInfoModel.fromJson(Map<String, dynamic> json) {
    fName = Parser.parseString(json['f_name']);
    lName = Parser.parseString(json['l_name']);
    phone = Parser.parseString(json['phone']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['f_name'] = this.fName;
    data['l_name'] = this.lName;
    data['phone'] = this.phone;
    return data;
  }
}
