import 'package:flutter_sixvalley_ecommerce/helper/parser.dart';

class NotificationModel {
  int _id;
  String _title;
  String _description;
  String _image;
  int _status;
  String _createdAt;
  String _updatedAt;

  NotificationModel(
      {int id,
        String title,
        String description,
        String image,
        int status,
        String createdAt,
        String updatedAt}) {
    this._id = id;
    this._title = title;
    this._description = description;
    this._image = image;
    this._status = status;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
  }

  int get id => _id;
  String get title => _title;
  String get description => _description;
  String get image => _image;
  int get status => _status;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;

  NotificationModel.fromJson(Map<String, dynamic> json) {
    _id = Parser.parseInt(json['id']);
    _title = Parser.parseString(json['title']);
    _description = Parser.parseString(json['description']);
    _image = Parser.parseString(json['image']);
    _status = Parser.parseInt(json['status']);
    _createdAt = Parser.parseString(json['created_at']);
    _updatedAt = Parser.parseString(json['updated_at']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['title'] = this._title;
    data['description'] = this._description;
    data['image'] = this._image;
    data['status'] = this._status;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}
