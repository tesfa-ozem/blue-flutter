import 'dart:convert';

class ResponseModel {
  String error;
  int errorCode;
  String message;

  ResponseModel({this.error, this.errorCode, this.message});

  ResponseModel.fromJson(Map<String, dynamic> json) {

    error = json['error'];
    errorCode = json['error_code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['error_code'] = this.errorCode;
    data['message'] = this.message;
    return data;
  }
}

class TokenResponseModel {
  String token;

  TokenResponseModel({this.token});

  TokenResponseModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    return data;
  }
}