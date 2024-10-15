import 'package:injectable/injectable.dart';
import 'package:online_exam_app/src/features/auth/data/api/models/response/email_verification_response.dart';
import 'package:online_exam_app/src/features/auth/data/api/models/response/forget_password_response.dart';
import 'package:online_exam_app/src/features/auth/data/api/models/response/reset_password_response.dart';
import 'package:online_exam_app/src/features/auth/data/api/models/response/sign_in_response.dart';
import 'package:online_exam_app/src/features/auth/data/api/models/response/sign_up_response.dart';
import 'package:online_exam_app/src/features/auth/data/datasources/contracts/auth_datasource.dart';
import 'package:online_exam_app/src/features/auth/domain/core/result.dart';
import 'package:online_exam_app/src/features/auth/domain/entities/email_verification_entity.dart';
import 'package:online_exam_app/src/features/auth/domain/entities/forget_password_entity.dart';
import 'package:online_exam_app/src/features/auth/domain/entities/reset_password_entity.dart';
import 'package:online_exam_app/src/features/auth/domain/entities/sign_in_entity.dart';
import 'package:online_exam_app/src/features/auth/domain/entities/sign_up_entity.dart';
import '../../domain/contracts/auth_repo.dart';
@Injectable(as: AuthRepo)
class AuthRepositoryImpl implements AuthRepo {
  AuthDataSource authDataSource;

  @factoryMethod
  AuthRepositoryImpl(this.authDataSource);

  @override
  Future<Result<SignInResponse>> login({required SignInEntity signInEntity}) {
    return authDataSource.login(signInModel: signInEntity.toModel());
  }

  @override
  Future<Result<ForgetPasswordResponse>> forgetPassword({required ForgetPasswordEntity forgetPasswordEntity}) {
    return authDataSource.forgetPassword(forgetPasswordModel: forgetPasswordEntity.toModel());
  }

  @override
  Future<Result<SignUpResponse>> signUp(
      {required SignUpEntity signUpEntity}) async {
    return await authDataSource.signUp(signUpModel: signUpEntity.toModel());
  }

  @override
  Future<Result<EmailVerificationResponse>> verifyEmail({required EmailVerificationEntity emailVerificationEntity})async {
    return await authDataSource.verifyEmail(emailVerificationModel: emailVerificationEntity.toModel());
  }

  @override
  Future<Result<ResetPasswordResponse>> resetPassword({required ResetPasswordEntity resetPasswordEntity})async {
   return await authDataSource.resetPassword(resetPasswordModel: resetPasswordEntity.toModel());
  }
}
