import '../../domain/model/user_model.dart';

/// message : "success"
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3MDQxODMwZTc3ZDY4NTk1YTI5MWYwZSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzI4MzIxOTkyfQ.fsyc1swSRZSRghIoV0SWregYcGbxOT9p1ZpbOwlsXXY"

class LoginModel {
  LoginModel({
    this.stack,
    this.message,
    this.token,
  });

  LoginModel.fromJson(Map<String, dynamic> json){

  message = json['message'];
    token = json['token'];
    stack = json['stack'];
  }

  String? message;
  String? token;
  String? stack;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['token'] = token;
    map['stack'] = stack;
    return map;
  }


  AppUser toUserLogin(String? email, String? password) {
    return AppUser(
      email: email,
      password: password,
      token: token,
      message: message,
    );
  }
}

