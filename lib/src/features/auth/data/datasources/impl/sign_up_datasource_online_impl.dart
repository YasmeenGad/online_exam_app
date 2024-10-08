
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/src/features/auth/data/datasources/contracts/sign_up_datasource_online.dart';
import 'package:online_exam_app/src/features/auth/data/models/sign_up_model.dart';
import 'package:online_exam_app/src/features/auth/domain/entities/sign_up_response.dart';

@Injectable(as: SignUpDatasourceOnline)
class SignUpDatasourceOnlineImpl implements SignUpDatasourceOnline {
  @override
  Future<SignUpResponse> signUp({required SignUpModel signUpEntity}) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}