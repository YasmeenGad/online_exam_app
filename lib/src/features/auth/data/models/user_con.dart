import 'package:online_exam_app/src/features/auth/domain/model/user_model.dart';

/// _id : "6702ad39e77d68595a291e8b"
/// username : "elevate123"
/// firstName : "Elevate"
/// lastName : "Tech"
/// email : "admin123@elevate.com"
/// phone : "01094155711"
/// role : "user"
/// isVerified : false
/// createdAt : "2024-10-06T15:31:05.209Z"
/// token : ""



class UserCon {
  UserCon({
    this.email,
    this.token,
    this.password,
    this.message,
  });

  UserCon.fromJson(dynamic json) {
    email = json['email'];
    token = json['token'];
    password = json['password'];
    message = json['message'];
  }

  String? email;
  String? token;
  String? password;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['token'] = token;
    map['password'] = password;
    map['message'] = message;
    return map;
  }

  AppUser toUser() {
    return AppUser(
      password: password,
      email: email,
      token: token,
      message: message,
    );
  }


}




