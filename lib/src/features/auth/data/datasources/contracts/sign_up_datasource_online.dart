import 'package:online_exam_app/src/features/auth/domain/entities/sign_up_entity.dart';
import 'package:online_exam_app/src/features/auth/domain/entities/sign_up_response.dart';

abstract class SignUpDatasourceOnline {

  Future<SignUpResponse> signUp({required SignUpEntity signUpEntity});
}