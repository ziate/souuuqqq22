import 'package:flutter_sixvalley_ecommerce/helper/parser.dart';

class SupportTicketBody {
  String _type;
  String _subject;
  String _description;

  SupportTicketBody(String type, String subject, String description) {
    this._type = type;
    this._subject = subject;
    this._description = description;
  }

  String get type => _type;
  String get subject => _subject;
  String get description => _description;

  SupportTicketBody.fromJson(Map<String, dynamic> json) {
    _type = Parser.parseString(json['type']);
    _subject = Parser.parseString(json['subject']);
    _description = Parser.parseString(json['description']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this._type;
    data['subject'] = this._subject;
    data['description'] = this._description;
    return data;
  }
}
