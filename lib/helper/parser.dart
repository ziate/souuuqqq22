class Parser {
  static int parseInt(dynamic json) {
    if (json == null) return null;
    if (json.runtimeType.toString() == 'String') return int.parse(json);
    if (json.runtimeType.toString() == 'double') return json.toInt();

    return json;
  }

  static String parseString(dynamic json) {
    if (json == null) return null;
    if (json.runtimeType.toString() == 'int') return json.toString();
    if (json.runtimeType.toString() == 'double') return json.toString();

    return json;
  }

  static double parseDouble(dynamic json) {
    if (json == null) return null;
    if (json.runtimeType.toString() == 'String') return double.parse(json);
    if (json.runtimeType.toString() == 'int') return json.toDouble();

    return json;
  }

  static bool parseBool(dynamic json) {
    if (json == null) return false;

    return json;
  }

  static dynamic parseObject(dynamic json, dynamic type) {
    if (json == null) return null;
    return type.fromJson(json);
  }
}
