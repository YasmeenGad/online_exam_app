import 'package:injectable/injectable.dart';
import 'package:online_exam_app/src/features/auth/data/api/models/request/email_verification_model.dart';
import 'package:online_exam_app/src/features/auth/data/api/models/request/forget_password_model.dart';
import 'package:online_exam_app/src/features/auth/data/api/models/request/reset_password_model.dart';
import 'package:online_exam_app/src/features/auth/data/api/models/request/sign_in_model.dart';
import 'package:online_exam_app/src/features/auth/data/api/models/request/sign_up_model.dart';
import 'package:online_exam_app/src/features/auth/data/api/models/response/email_verification_response.dart';
import 'package:online_exam_app/src/features/auth/data/api/models/response/forget_password_response.dart';
import 'package:online_exam_app/src/features/auth/data/api/models/response/reset_password_response.dart';
import 'package:online_exam_app/src/features/auth/data/api/models/response/sign_in_response.dart';
import 'package:online_exam_app/src/features/auth/data/api/models/response/sign_up_response.dart';
import '../../../domain/core/result.dart';
import '../../api/api_manager.dart';
import '../contracts/auth_datasource.dart';

@Injectable(as: AuthDataSource)

class AuthDataSourceImpl implements AuthDataSource {

  ApiManager apiManager;
  AuthDataSourceImpl(this.apiManager);
  @override
  Future<Result<SignInResponse>> login({required SignInModel signInModel})async {
    var response = await apiManager.login(signInModel: signInModel);
    return response;
  }

  @override
  Future<Result<ForgetPasswordResponse>> forgetPassword({required ForgetPasswordModel forgetPasswordModel}) async {
    var response = await apiManager.forgetPassword(forgetPasswordModel: forgetPasswordModel);
    return response;
  }



@override

  Future<Result<SignUpResponse>> signUp({required SignUpModel signUpModel}) async{
    var response = await apiManager.signUp(signUpModel: signUpModel);
    return response;
  }

  @override
  Future<Result<EmailVerificationResponse>> verifyEmail({required EmailVerificationModel emailVerificationModel})async {
    var response = await apiManager.verifyEmail(emailVerificationModel: emailVerificationModel);
    return response;
  }

  @override
  Future<Result<ResetPasswordResponse>> resetPassword({required ResetPasswordModel resetPasswordModel})async {
    var response = await apiManager.resetPassword(resetPasswordModel: resetPasswordModel);
    return response;
  }

}