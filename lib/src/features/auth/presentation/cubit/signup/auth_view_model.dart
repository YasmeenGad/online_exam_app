import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/src/features/auth/data/api/models/response/sign_up_response.dart';
import 'package:online_exam_app/src/features/auth/domain/core/result.dart';
import 'package:online_exam_app/src/features/auth/domain/entities/sign_up_entity.dart';
import 'package:online_exam_app/src/features/auth/domain/usecases/signup_usecase.dart';
import 'package:online_exam_app/src/features/auth/presentation/cubit/signup/auth_states.dart';

@Injectable()
class AuthViewModel extends Cubit<AuthState> {
  SignupUsecase signupUsecase;
  @FactoryMethod()
  AuthViewModel(this.signupUsecase) : super(AuthInitialState());

  void signUp(SignUpEntity signUpEntity) async {
    emit(AuthLoadingState());
    var result = await signupUsecase.signUp(signUpEntity: signUpEntity);
    switch (result) {
      case Success<SignUpResponse>():
        {
          emit(AuthSuccessState(signUpResponse: result.data));
          break;
        }

      case Fail<SignUpResponse>():
        {
          emit(AuthErrorState(exception: result.exception));
          break;
        }
    }
  }
}
