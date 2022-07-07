import 'package:blockchian/blockchian.dart';
import 'dart:convert';

class TextModel {
  TextModel({
    required this.id,
    this.content = "",
    required this.createdAt,
    this.updatedAt,
  });

  int id;
  String content;
  DateTime createdAt;
  DateTime? updatedAt;

  factory TextModel.fromChiperText(String chipher) {
    String plantText = decrypt(chipher);

    Map<String, dynamic> map = json.decode(plantText);

    return TextModel.fromJson(map);
  }

  factory TextModel.fromJson(Map<String, dynamic> map) => TextModel(
        id: map["id"],
        content: map["content"],
        createdAt: DateTime.parse(map["created_at"]),
        updatedAt: map["updated_at"] == null
            ? null
            : DateTime.parse(
                map["updated_at"],
              ),
      );
}
