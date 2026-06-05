import 'dart:convert';
import 'package:floor/floor.dart';

class StrListConverter extends TypeConverter<List<String>?, String?> {

  @override
  List<String>? decode(String? databaseValue) {
    if (databaseValue == null) return null;
    return (jsonDecode(databaseValue) as List<dynamic>).map((e) => e as String).toList();
  }

  @override
  String? encode(List<String>? value) {
    if (value == null) return null;
    return jsonEncode(value);
  }
}