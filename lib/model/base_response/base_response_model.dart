import 'package:blockchian/blockchian.dart';

import 'meta_data_model.dart';

import 'dart:convert';

class BaseResponseModel<T> {
  BaseResponseModel({
    this.chipherText,
    this.plaintText,
    this.data,
    this.links,
    this.isSuccess = false,
    this.message,
    this.currentPage,
    this.lastPage,
  });

  T? data;
  final LinksModel? links;
  final bool isSuccess;
  final String? message;
  final String? chipherText;
  final String? plaintText;
  int? currentPage;
  int? lastPage;

  factory BaseResponseModel.fromJson(
    String chipherText,
    T Function(dynamic) fromJsonT,
  ) {
    var plaintText = decrypt(chipherText);
    var map = json.decode(plaintText);

    return BaseResponseModel(
      plaintText: plaintText,
      chipherText: chipherText,
      data: map['data'] == null ? null : fromJsonT(map['data']),
      links: map['links'] == null ? null : LinksModel.fromJson(map['links']),
      isSuccess: true,
      message: map['message'],
      lastPage: map['last_page'],
      currentPage: map['current_page'],
    );
  }
}
