import 'package:flutter_sixvalley_ecommerce/helper/parser.dart';

class ResponseModel {
  String _message;
  bool _isSuccess;

  ResponseModel(this._message, this._isSuccess);

  bool get isSuccess => _isSuccess;
  String get message => _message;
}