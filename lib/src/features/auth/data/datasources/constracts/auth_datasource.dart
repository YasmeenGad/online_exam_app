
import '../../../domain/core/result.dart';
import '../../../domain/model/password_model.dart';
import '../../../domain/model/user_model.dart';

abstract class AuthDataSource{
  Future<Result<AppUser?>> login(String email,String password, );
  Future<Result<Password?>> forgetPassword(String email);

}