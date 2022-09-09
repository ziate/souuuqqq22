import 'package:flutter_sixvalley_ecommerce/helper/parser.dart';

class ChatModel {
  int _id;
  int _userId;
  int _sellerId;
  String _message;
  int _sentByCustomer;
  int _sentBySeller;
  int _seenByCustomer;
  int _seenBySeller;
  int _status;
  String _createdAt;
  String _updatedAt;
  int _shopId;

  ChatModel(
      {int id,
        int userId,
        int sellerId,
        String message,
        int sentByCustomer,
        int sentBySeller,
        int seenByCustomer,
        int seenBySeller,
        int status,
        String createdAt,
        String updatedAt,
        int shopId}) {
    this._id = id;
    this._userId = userId;
    this._sellerId = sellerId;
    this._message = message;
    this._sentByCustomer = sentByCustomer;
    this._sentBySeller = sentBySeller;
    this._seenByCustomer = seenByCustomer;
    this._seenBySeller = seenBySeller;
    this._status = status;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
    this._shopId = shopId;
  }

  int get id => _id;
  int get userId => _userId;
  int get sellerId => _sellerId;
  String get message => _message;
  int get sentByCustomer => _sentByCustomer;
  int get sentBySeller => _sentBySeller;
  int get seenByCustomer => _seenByCustomer;
  int get seenBySeller => _seenBySeller;
  int get status => _status;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;
  int get shopId => _shopId;

  ChatModel.fromJson(Map<String, dynamic> json) {
    _id = Parser.parseInt(json['id']);
    _userId = Parser.parseInt(json['user_id']);
    _sellerId = Parser.parseInt(json['seller_id']);
    _message = Parser.parseString(json['message']);
    _sentByCustomer = Parser.parseInt(json['sent_by_customer']);
    _sentBySeller = Parser.parseInt(json['sent_by_seller']);
    _seenByCustomer = Parser.parseInt(json['seen_by_customer']);
    _seenBySeller = Parser.parseInt(json['seen_by_seller']);
    _status = Parser.parseInt(json['status']);
    _createdAt = Parser.parseString(json['created_at']);
    _updatedAt = Parser.parseString(json['updated_at']);
    _shopId = Parser.parseInt(json['shop_id']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['user_id'] = this._userId;
    data['seller_id'] = this._sellerId;
    data['message'] = this._message;
    data['sent_by_customer'] = this._sentByCustomer;
    data['sent_by_seller'] = this._sentBySeller;
    data['seen_by_customer'] = this._seenByCustomer;
    data['seen_by_seller'] = this._seenBySeller;
    data['status'] = this._status;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    data['shop_id'] = this._shopId;
    return data;
  }
}

class SellerInfo {
  int _id;
  String _fName;
  String _lName;
  String _phone;
  String _image;
  String _email;

  SellerInfo(
      {int id,
        String fName,
        String lName,
        String phone,
        String image,
        String email,
       }) {
    if (id != null) {
      this._id = id;
    }
    if (fName != null) {
      this._fName = fName;
    }
    if (lName != null) {
      this._lName = lName;
    }
    if (phone != null) {
      this._phone = phone;
    }
    if (image != null) {
      this._image = image;
    }
    if (email != null) {
      this._email = email;
    }

  }

  int get id => _id;
  String get fName => _fName;
  String get lName => _lName;
  String get phone => _phone;
  String get image => _image;
  String get email => _email;



  SellerInfo.fromJson(Map<String, dynamic> json) {
    _id = Parser.parseInt(json['id']);
    _fName = Parser.parseString(json['f_name']);
    _lName = Parser.parseString(json['l_name']);
    _phone = Parser.parseString(json['phone']);
    _image = Parser.parseString(json['image']);
    _email = Parser.parseString(json['email']);

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['f_name'] = this._fName;
    data['l_name'] = this._lName;
    data['phone'] = this._phone;
    data['image'] = this._image;
    data['email'] = this._email;

    return data;
  }
}

