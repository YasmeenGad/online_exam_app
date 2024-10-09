import 'package:online_exam_app/src/features/auth/domain/model/user_model.dart';
import '../../core/result.dart';

abstract class AuthRepo {
  Future<Result<AppUser?>> login(String email, String password);


}