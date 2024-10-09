import 'package:injectable/injectable.dart';
import 'package:online_exam_app/src/features/auth/domain/model/user_model.dart';
import '../contracts/repositories/auth_repo.dart';
import '../core/result.dart';

@injectable

class LoginUseCase {
  AuthRepo authRepo;
  LoginUseCase(this.authRepo);
  Future<Result<AppUser?>> invoke(String email, String password) {
    return authRepo.login(email, password);


  }
}