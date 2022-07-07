import 'package:blockchian/api/base_request_api.dart';
import 'package:blockchian/model/model.dart';
import 'dart:convert';

class TextApi extends BaseRequestApi {
  Future<BaseResponseModel<TextModel>> uploadText(String content) {
    return post(
      "/des/store",
      fromJsonT: (map) => TextModel.fromJson(map),
      body: json.encode({
        "content": content,
      }),
    );
  }

  Future<BaseResponseModel<List<TextModel>>> getTexts() async {
    return get(
      "/des",
      fromJsonT: (map) => List<TextModel>.from(
        map.map(
          (x) => TextModel.fromJson(x),
        ),
      ),
    );
  }
}
