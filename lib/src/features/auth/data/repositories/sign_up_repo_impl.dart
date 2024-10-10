import 'package:injectable/injectable.dart';
import 'package:online_exam_app/src/features/auth/data/datasources/contracts/sign_up_datasource_online.dart';
import 'package:online_exam_app/src/features/auth/domain/contracts/repositories/sign_up_repo.dart';
import 'package:online_exam_app/src/features/auth/domain/core/result.dart';
import 'package:online_exam_app/src/features/auth/domain/entities/sign_up_entity.dart';
import 'package:online_exam_app/src/features/auth/data/api/models/response/sign_up_response.dart';

@Injectable(as: SignUpRepository)
class SignUpRepositoryImpl implements SignUpRepository{

   SignUpDatasourceOnline signUpDatasourceOnline;

   @FactoryMethod()
   SignUpRepositoryImpl(this.signUpDatasourceOnline);
  @override
  Future<Result<SignUpResponse>> signUp({required SignUpEntity signUpEntity}) async {
    return await signUpDatasourceOnline.signUp(signUpModel: signUpEntity.toModel());
  }
}