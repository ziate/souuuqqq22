import 'dart:developer';

import 'package:flutter_sixvalley_ecommerce/data/model/response/product_model.dart';

import 'package:flutter_sixvalley_ecommerce/helper/parser.dart';

class OrderDetailsModel {
  int _id;
  int _orderId;
  int _productId;
  int _sellerId;
  Product _productDetails;
  int _qty;
  int _count_piece_in_kr;
  double _price;
  double _tax;
  double _discount;
  String _deliveryStatus;
  String _paymentStatus;
  String _createdAt;
  String _updatedAt;
  int _shippingMethodId;
  String _variant;
  int _refundReq;
  bool _isPiece;
  //List<Variation> _variation;

  OrderDetailsModel(
      {int id,
        int orderId,
        int productId,
        int sellerId,
        Product productDetails,
        int qty,
        double price,
        double tax,
        double discount,
        String deliveryStatus,
        String paymentStatus,
        String createdAt,
        String updatedAt,
        int shippingMethodId,
        String variant,
        int refundReq,
        bool isPiece

        //List<Variation> variation
      }) {
    this._id = id;
    this._orderId = orderId;
    this._productId = productId;
    this._sellerId = sellerId;
    this._productDetails = productDetails;
    this._qty = qty;
    this._count_piece_in_kr = count_piece_in_kr;
    this._price = price;
    this._tax = tax;
    this._discount = discount;
    this._deliveryStatus = deliveryStatus;
    this._paymentStatus = paymentStatus;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
    this._shippingMethodId = shippingMethodId;
    this._variant = variant;
    this._refundReq = refundReq;
    this._isPiece = isPiece;
    //this._variation = variation;
  }
  bool get isPiece => _isPiece;
  int get id => _id;
  int get orderId => _orderId;
  int get productId => _productId;
  int get sellerId => _sellerId;
  Product get productDetails => _productDetails;
  int get qty => _qty;
  int get count_piece_in_kr => _count_piece_in_kr;
  double get price => _price;
  double get total_price {
    if (_count_piece_in_kr != null && _count_piece_in_kr != 0 && !_isPiece) {
      return _price * (_qty / _count_piece_in_kr);
    } else {
      return _price * (_qty);
    }
  }

  int get total_qty {
    if (_count_piece_in_kr != null && _count_piece_in_kr != 0 && !_isPiece) {
      return (_qty / _count_piece_in_kr).toInt();
    } else {
      return _qty;
    }
  }

  double get tax => _tax;
  double get discount => _discount;
  String get deliveryStatus => _deliveryStatus;
  String get paymentStatus => _paymentStatus;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;
  int get shippingMethodId => _shippingMethodId;
  String get variant => _variant;
  int get refundReq => _refundReq;

  OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    _id = Parser.parseInt(json['id']);
    _orderId = Parser.parseInt(json['order_id']);
    _productId = Parser.parseInt(json['product_id']);
    _sellerId = Parser.parseInt(json['seller_id']);
    if (json['product_details'] != null) {
      _productDetails = Product.fromJson(json['product_details']);
    }
    _qty = Parser.parseInt(json['qty']);
    _count_piece_in_kr = Parser.parseInt(json['count_piece_in_kr']);
    _price = json['price'].toDouble();
    _tax = json['tax'].toDouble();
    _discount = json['discount'].toDouble();
    _deliveryStatus = Parser.parseString(json['delivery_status']);
    _paymentStatus = Parser.parseString(json['payment_status']);
    _createdAt = Parser.parseString(json['created_at']);
    _updatedAt = Parser.parseString(json['updated_at']);
    _shippingMethodId = Parser.parseInt(json['shipping_method_id']);
    _variant = Parser.parseString(json['variant']);
    _refundReq = Parser.parseInt(json['refund_request']);
    _isPiece = Parser.parseInt(json['is_piece']) == 0 ? false : true;
    log(_isPiece.toString());
    /*if (json['variation'] != null) {
      _variation = [];
      json['variation'].forEach((v) {
        _variation.add(new Variation.fromJson(v));
      });
    }*/
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['order_id'] = this._orderId;
    data['product_id'] = this._productId;
    data['seller_id'] = this._sellerId;
    if (this._productDetails != null) {
      data['product_details'] = this._productDetails.toJson();
    }
    data['qty'] = this._qty;
    data['count_piece_in_kr'] = this._count_piece_in_kr;
    data['price'] = this._price;
    data['tax'] = this._tax;
    data['discount'] = this._discount;
    data['delivery_status'] = this._deliveryStatus;
    data['payment_status'] = this._paymentStatus;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    data['shipping_method_id'] = this._shippingMethodId;
    data['variant'] = this._variant;
    data['refund_request'] = this._refundReq;
    data['is_piece'] = this.isPiece ? 1 : 0;
    /*if (this._variation != null) {
      data['variation'] = this._variation.map((v) => v.toJson()).toList();
    }*/
    return data;
  }
}