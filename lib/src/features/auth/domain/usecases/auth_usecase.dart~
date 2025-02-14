import 'package:injectable/injectable.dart';
import 'package:online_exam_app/src/features/auth/data/api/models/response/forget_password_response.dart';
import 'package:online_exam_app/src/features/auth/data/api/models/response/reset_password_response.dart';
import 'package:online_exam_app/src/features/auth/data/api/models/response/sign_in_response.dart';
import 'package:online_exam_app/src/features/auth/data/api/models/response/sign_up_response.dart';
import 'package:online_exam_app/src/features/auth/domain/contracts/auth_repo.dart';
import 'package:online_exam_app/src/core/network/result.dart';
import 'package:online_exam_app/src/features/auth/domain/entities/forget_password_entity.dart';
import 'package:online_exam_app/src/features/auth/domain/entities/sign_in_entity.dart';
import 'package:online_exam_app/src/features/auth/domain/entities/sign_up_entity.dart';

import '../../data/api/models/response/email_verification_response.dart';
import '../entities/email_verification_entity.dart';
import '../entities/reset_password_entity.dart';

@Injectable()
class AuthUsecase {
  final AuthRepo authRepo;
  @FactoryMethod()
  AuthUsecase({required this.authRepo});

  Future<Result<SignInResponse>> login(
      {required SignInEntity signInEntity}) async {
    return await authRepo.login(signInEntity: signInEntity);
  }

  Future<Result<ForgetPasswordResponse>> forgetPassword(
      {required ForgetPasswordEntity forgetPasswordEntity}) async {
    return await authRepo.forgetPassword(
        forgetPasswordEntity: forgetPasswordEntity);
  }

  Future<Result<SignUpResponse>> signUp(
      {required SignUpEntity signUpEntity}) async {
    return await authRepo.signUp(signUpEntity: signUpEntity);
  }

  Future<Result<EmailVerificationResponse>> verifyEmail({required EmailVerificationEntity emailVerificationEntity}) async {
    return await authRepo.verifyEmail(emailVerificationEntity: emailVerificationEntity);
  }

  Future<Result<ResetPasswordResponse>> resetPassword({required ResetPasswordEntity resetPasswordEntity})async{
    return await authRepo.resetPassword(resetPasswordEntity: resetPasswordEntity);
  }
}
