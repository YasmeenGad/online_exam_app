import 'package:online_exam_app/src/features/auth/data/api/models/response/email_verification_response.dart';
import 'package:online_exam_app/src/features/auth/data/api/models/response/forget_password_response.dart';
import 'package:online_exam_app/src/features/auth/data/api/models/response/reset_password_response.dart';
import 'package:online_exam_app/src/features/auth/data/api/models/response/sign_in_response.dart';
import 'package:online_exam_app/src/features/auth/data/api/models/response/sign_up_response.dart';
import 'package:online_exam_app/src/features/auth/domain/entities/forget_password_entity.dart';
import 'package:online_exam_app/src/features/auth/domain/entities/reset_password_entity.dart';
import 'package:online_exam_app/src/features/auth/domain/entities/sign_in_entity.dart';
import 'package:online_exam_app/src/features/auth/domain/entities/sign_up_entity.dart';
import '../core/result.dart';
import '../entities/email_verification_entity.dart';

abstract class AuthRepo {
  Future<Result<SignInResponse>> login({required SignInEntity signInEntity});
  Future<Result<ForgetPasswordResponse>> forgetPassword({required ForgetPasswordEntity forgetPasswordEntity});
  Future<Result<SignUpResponse>> signUp({required SignUpEntity signUpEntity});
  Future<Result<EmailVerificationResponse>> verifyEmail({required EmailVerificationEntity emailVerificationEntity});
  Future<Result<ResetPasswordResponse>> resetPassword({required ResetPasswordEntity resetPasswordEntity});
}
