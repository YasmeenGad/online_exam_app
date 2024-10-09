import 'package:online_exam_app/src/features/auth/domain/model/user_model.dart';
import '../../core/result.dart';
import '../../model/password_model.dart';

abstract class AuthRepo {
  Future<Result<AppUser?>> login(String email, String password);

  Future<Result<Password?>> forgetPassword(String email);
}
