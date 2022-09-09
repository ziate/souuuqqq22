import 'package:flutter_sixvalley_ecommerce/helper/parser.dart';

class AddressModel {
  int id;
  int customerId;
  String contactPersonName;
  String addressType;
  String address;
  String city;
  String zip;
  String phone;
  String createdAt;
  String updatedAt;
  String state;
  String country;
  String latitude;
  String longitude;
  int isBilling;

  AddressModel(
      {this.id,
      this.customerId,
      this.contactPersonName,
      this.addressType,
      this.address,
      this.city,
      this.zip = '',
      this.phone,
      this.createdAt,
      this.updatedAt,
      this.state,
      this.country,
      this.latitude,
      this.longitude,
      this.isBilling});

  AddressModel.fromJson(Map<String, dynamic> json) {
    id = Parser.parseInt(json['id']);
    customerId = Parser.parseInt(json['customer_id']);
    contactPersonName = Parser.parseString(json['contact_person_name']);
    addressType = Parser.parseString(json['address_type']);
    address = Parser.parseString(json['address']);
    city = Parser.parseString(json['city']);
    zip = Parser.parseString(json['zip']);
    phone = Parser.parseString(json['phone']);
    createdAt = Parser.parseString(json['created_at']);
    updatedAt = Parser.parseString(json['updated_at']);
    state = Parser.parseString(json['state']);
    country = Parser.parseString(json['country']);
    latitude = Parser.parseString(json['latitude']);
    longitude = Parser.parseString(json['longitude']);
    isBilling = Parser.parseInt(json['is_billing']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_id'] = this.customerId;
    data['contact_person_name'] = this.contactPersonName;
    data['address_type'] = this.addressType;
    data['address'] = this.address;
    data['city'] = this.city;
    data['zip'] = this.zip;
    data['phone'] = this.phone;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['state'] = this.state;
    data['country'] = this.country;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['is_billing'] = this.isBilling;
    return data;
  }
}
