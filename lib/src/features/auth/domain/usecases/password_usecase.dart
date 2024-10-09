import 'package:injectable/injectable.dart';

import '../contracts/repositories/auth_repo.dart';
import '../core/result.dart';
import '../model/password_model.dart';

@injectable
class PasswordUseCase {
  AuthRepo authRepo;
  PasswordUseCase(this.authRepo);
  Future<Result<Password?>> invoke(String email) {
    return authRepo.forgetPassword(email);
  }
}