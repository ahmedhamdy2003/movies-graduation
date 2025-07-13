import 'Data.dart';

class SignInResponse {
  final String? message;
  final String? token;
  final Data? data;

  SignInResponse({
    this.message,
    this.token,
    this.data,
  });

  factory SignInResponse.fromJson(Map<String, dynamic> json) {
    return SignInResponse(
      message: json['message'],
      token: json['token'],
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }
}
