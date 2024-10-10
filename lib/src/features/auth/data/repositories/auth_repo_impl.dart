import 'package:injectable/injectable.dart';
import 'package:online_exam_app/src/features/auth/data/api/models/response/sign_up_response.dart';
import 'package:online_exam_app/src/features/auth/data/datasources/constracts/auth_datasource.dart';
import 'package:online_exam_app/src/features/auth/domain/core/result.dart';
import 'package:online_exam_app/src/features/auth/domain/entities/sign_up_entity.dart';
import 'package:online_exam_app/src/features/auth/domain/model/user_model.dart';

import '../../domain/contracts/repositories/auth_repo.dart';
import '../../domain/model/password_model.dart';

@Injectable(as: AuthRepo)
class AuthRepositoryImpl implements AuthRepo{

  AuthDataSource authDataSource;

  @factoryMethod
  AuthRepositoryImpl( this.authDataSource);

  @override
  Future<Result<AppUser?>> login(String email, String password) {
    return authDataSource.login(email, password);
  }

  @override
  Future<Result<Password?>> forgetPassword(String email) {
    return authDataSource.forgetPassword(email);
  }

  Future<Result<SignUpResponse>> signUp({required SignUpEntity signUpEntity}) async {
    return await authDataSource.signUp(signUpModel: signUpEntity.toModel());
  }



}