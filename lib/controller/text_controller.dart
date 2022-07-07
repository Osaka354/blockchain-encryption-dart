
import 'package:blockchian/api/api.dart';
import 'package:blockchian/blockchian.dart';
import 'package:blockchian/model/model.dart';
import 'dart:io';

class TextController {
  final _textApi = TextApi();

  Future showAllText() async {
    print("\nLoading...\n");

    var response = await _textApi.getTexts();

    if (response.isSuccess) {
      _printData(
        response,
        printPlantText: (List<TextModel> p) {
          print("-----------------------------------------------------\n");
          print("List of Content:\n");
          for (var text in p) {
            _printText(text);
          }
        },
      );
    } else {
      print("Error: ${response.message}");
    }
  }

  Future uploadData() async {
    stdout.write("\nEnter some text: ");
    String? plaintText = stdin.readLineSync();

    String cipher = encrypt(plaintText ?? "");

    var data = BaseResponseModel(plaintText: plaintText, chipherText: cipher);

    print("\nData for upload: \n");

    await _printData(
      data,
      printPlantText: (_) async {},
    );

    await _uploadToApi(cipher);
  }

  Future _uploadToApi(String cipher) async {
    print("Uploading...");

    var response = await _textApi.uploadText(cipher);

    if (response.isSuccess) {
      print("Uploaded successfuly.\n");
      _printData(
        response,
        printPlantText: (TextModel text) {
          print("-----------------------------------------------------\n");
          print("Uploaded Content:\n");
          _printText(text);
        },
      );
    } else {
      print("Error: ${response.message}");
    }
  }

  Future _printData<T>(
    BaseResponseModel data, {
    required void Function(T plaint) printPlantText,
  }) async {
    print("\nCipher Text:\n${data.chipherText}\n");
    print("Plaint Text:\n${data.plaintText}\n");
    printPlantText(data.data);
  }

  void _printText(TextModel text) {
    print("ID: ${text.id}");
    print("Content: ${text.content}");
    print("Create At: ${text.createdAt.toString()}");
    print("Update At: ${text.updatedAt.toString()}\n");
  }
}
