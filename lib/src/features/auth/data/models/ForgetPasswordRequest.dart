import 'package:online_exam_app/src/features/auth/domain/core/result.dart';
import 'package:online_exam_app/src/features/auth/domain/model/password_model.dart';

import '../../domain/core/result.dart';

/// message : "success"
/// info : "OTP sent to your email"

class ForgetPasswordRequest {
  ForgetPasswordRequest({
      this.message, 
      this.info,

  });

  ForgetPasswordRequest.fromJson(dynamic json) {
    message = json['message'];
    info = json['info'];
  }
  String? message;
  String? info;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['info'] = info;
    return map;
  }

  Password toPassword() {
    return Password(
      message: message,
      info: info,
    );
  }

}