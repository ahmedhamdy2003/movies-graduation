class SignInResponse {
  SignInResponse({
    this.message,
    this.token,
  });

  String? message;
  String? token;

  SignInResponse.fromJson(dynamic json) {
    message = json['message'];
    token = json['data'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['data'] = token;
    return map;
  }
}
