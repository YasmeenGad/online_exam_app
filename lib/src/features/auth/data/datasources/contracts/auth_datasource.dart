
import 'package:online_exam_app/src/features/auth/data/api/models/request/forget_password_model.dart';
import 'package:online_exam_app/src/features/auth/data/api/models/request/sign_in_model.dart';
import 'package:online_exam_app/src/features/auth/data/api/models/request/sign_up_model.dart';
import 'package:online_exam_app/src/features/auth/data/api/models/response/email_verification_response.dart';
import 'package:online_exam_app/src/features/auth/data/api/models/response/forget_password_response.dart';
import 'package:online_exam_app/src/features/auth/data/api/models/response/sign_in_response.dart';
import 'package:online_exam_app/src/features/auth/data/api/models/response/sign_up_response.dart';
import '../../../domain/core/result.dart';
import '../../api/models/request/email_verification_model.dart';

abstract class AuthDataSource{
  Future<Result<SignInResponse>> login({required SignInModel signInModel});
  Future<Result<ForgetPasswordResponse>> forgetPassword({required ForgetPasswordModel forgetPasswordModel});
  Future<Result<SignUpResponse>> signUp({required SignUpModel signUpModel});
  Future<Result<EmailVerificationResponse>> verifyEmail({required EmailVerificationModel emailVerificationModel});
}