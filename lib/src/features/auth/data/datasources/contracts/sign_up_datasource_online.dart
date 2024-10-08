import 'package:online_exam_app/src/features/auth/data/api/models/request/sign_up_model.dart';
import 'package:online_exam_app/src/features/auth/data/api/models/response/sign_up_response.dart';

abstract class SignUpDatasourceOnline {

  Future<SignUpResponse> signUp({required SignUpModel signUpModel});
}