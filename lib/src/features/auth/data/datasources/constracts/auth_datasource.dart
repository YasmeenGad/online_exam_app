
import 'package:online_exam_app/src/features/auth/data/api/models/request/sign_up_model.dart';
import 'package:online_exam_app/src/features/auth/data/api/models/response/sign_up_response.dart';

import '../../../domain/core/result.dart';
import '../../../domain/model/password_model.dart';
import '../../../domain/model/user_model.dart';

abstract class AuthDataSource{
  Future<Result<AppUser?>> login(String email,String password, );
  Future<Result<Password?>> forgetPassword(String email);
  Future<Result<SignUpResponse>> signUp({required SignUpModel signUpModel});

}