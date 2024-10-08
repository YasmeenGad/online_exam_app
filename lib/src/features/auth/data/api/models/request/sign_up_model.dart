import 'package:online_exam_app/src/features/auth/domain/entities/sign_up_entity.dart';

class SignUpModel {
  final String? username;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;
  final String? rePassword;
  final String? phone;

  SignUpModel({
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.rePassword,
    this.phone, 
  });

  Map<String, dynamic> toJson() => {
    'username': username,
    'firstName': firstName,
    'lastName': lastName,
    'email': email,
    'password': password,
    'rePassword': rePassword,
    'phone': phone,
  };


  SignUpEntity toEntity() {
    return SignUpEntity(
      username: username,
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
      rePassword: rePassword,
      phone: phone,
    );
  }
}

  
  