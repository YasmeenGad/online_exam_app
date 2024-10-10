import 'package:online_exam_app/src/features/auth/data/api/models/response/sign_up_response.dart';
import 'package:online_exam_app/src/features/auth/domain/entities/sign_up_entity.dart';
import 'package:online_exam_app/src/features/auth/domain/model/user_model.dart';
import '../../core/result.dart';
import '../../model/password_model.dart';

abstract class AuthRepo {
  Future<Result<AppUser?>> login(String email, String password);

  Future<Result<Password?>> forgetPassword(String email);
  Future<Result<SignUpResponse>> signUp({required SignUpEntity signUpEntity});
}
