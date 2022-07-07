import 'package:http/http.dart' as http;

import '../model/model.dart';

import 'dart:async';

import 'dart:io';

final _myBaseUrl = "https://encryption-lab.herokuapp.com/api";

class BaseRequestApi {
  Uri _uri(String path) => Uri.parse(_myBaseUrl + path);

  Future<BaseResponseModel<T>> get<T>(
    String path, {
    required T Function(dynamic json) fromJsonT,
  }) async {
    try {
      final response = await http.get(
        _uri(path),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return BaseResponseModel<T>.fromJson(
          response.body,
          (json) => fromJsonT(json),
        );
      }
      return BaseResponseModel<T>(
        isSuccess: false,
        message: "Somthing when wrong!",
      );
    } on SocketException {
      return BaseResponseModel<T>(
        isSuccess: false,
        message: 'Problem Internet Connection',
      );
    } on TimeoutException {
      return BaseResponseModel(
        isSuccess: false,
        message: 'Request time out.',
      );
    } on HttpException {
      return BaseResponseModel<T>(
        isSuccess: false,
        message: 'Not Found',
      );
    } on FormatException catch (e) {
      return BaseResponseModel<T>(
        isSuccess: false,
        message: e.message,
      );
    } on Exception catch (e) {
      return BaseResponseModel<T>(
        isSuccess: false,
        message: e.toString(),
      );
    }
  }

  Future<BaseResponseModel<T>> post<T>(
    String path, {
    required T Function(dynamic json) fromJsonT,
    Object? body,
  }) async {
    try {
      final response = await http.post(
        _uri(path),
        body: body,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return BaseResponseModel<T>.fromJson(
          response.body,
          (json) => fromJsonT(json),
        );
      }
      return BaseResponseModel<T>(
          isSuccess: false, message: "Somthing when wrong!");
    } on SocketException {
      return BaseResponseModel<T>(
        isSuccess: false,
        message: 'Problem Internet Connection',
      );
    } on TimeoutException {
      return BaseResponseModel(
        isSuccess: false,
        message: 'Request time out.',
      );
    } on HttpException {
      return BaseResponseModel<T>(
        isSuccess: false,
        message: 'Not Found',
      );
    } on FormatException catch (e) {
      return BaseResponseModel<T>(
        isSuccess: false,
        message: e.message,
      );
    } on Exception catch (e) {
      return BaseResponseModel<T>(
        isSuccess: false,
        message: e.toString(),
      );
    }
  }
}
