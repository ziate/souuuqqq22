import 'package:flutter_sixvalley_ecommerce/helper/parser.dart';

class SupportTicketModel {
  int _id;
  int _customerId;
  String _subject;
  String _type;
  String _priority;
  String _description;
  String _reply;
  String _status;
  String _createdAt;
  String _updatedAt;

  SupportTicketModel(
      {int id,
        int customerId,
        String subject,
        String type,
        String priority,
        String description,
        String reply,
        String status,
        String createdAt,
        String updatedAt}) {
    this._id = id;
    this._customerId = customerId;
    this._subject = subject;
    this._type = type;
    this._priority = priority;
    this._description = description;
    this._reply = reply;
    this._status = status;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
  }

  int get id => _id;
  int get customerId => _customerId;
  String get subject => _subject;
  String get type => _type;
  String get priority => _priority;
  String get description => _description;
  String get reply => _reply;
  String get status => _status;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;

  SupportTicketModel.fromJson(Map<String, dynamic> json) {
    _id = Parser.parseInt(json['id']);
    _customerId = Parser.parseInt(json['customer_id']);
    _subject = Parser.parseString(json['subject']);
    _type = Parser.parseString(json['type']);
    _priority = Parser.parseString(json['priority']);
    _description = Parser.parseString(json['description']);
    _reply = Parser.parseString(json['reply']);
    _status = Parser.parseString(json['status']);
    _createdAt = Parser.parseString(json['created_at']);
    _updatedAt = Parser.parseString(json['updated_at']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['customer_id'] = this._customerId;
    data['subject'] = this._subject;
    data['type'] = this._type;
    data['priority'] = this._priority;
    data['description'] = this._description;
    data['reply'] = this._reply;
    data['status'] = this._status;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}
