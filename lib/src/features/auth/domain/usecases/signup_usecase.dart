import 'package:injectable/injectable.dart';
import 'package:online_exam_app/src/features/auth/data/api/models/response/sign_up_response.dart';
import 'package:online_exam_app/src/features/auth/domain/contracts/repositories/auth_repo.dart';
import 'package:online_exam_app/src/features/auth/domain/core/result.dart';
import 'package:online_exam_app/src/features/auth/domain/entities/sign_up_entity.dart';

@Injectable()
class SignupUsecase {
  AuthRepo authRepo;

  @FactoryMethod()
  SignupUsecase(this.authRepo);

  Future<Result<SignUpResponse>> signUp({required SignUpEntity signUpEntity}) async {
    return await authRepo.signUp(signUpEntity: signUpEntity);
}
}
