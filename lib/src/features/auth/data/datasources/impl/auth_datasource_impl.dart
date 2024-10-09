import 'package:injectable/injectable.dart';
import 'package:online_exam_app/src/features/auth/data/api/api_extention.dart';
import '../../../domain/core/result.dart';
import '../../../domain/model/password_model.dart';
import '../../../domain/model/user_model.dart';
import '../../api/api_manager.dart';
import '../../models/user_con.dart';
import '../constracts/auth_datasource.dart';

@Injectable(as: AuthDataSource)

class AuthDataSourceImpl implements AuthDataSource {

  ApiManager apiManager;
  AuthDataSourceImpl(this.apiManager);
  @override
  Future<Result<AppUser?>> login(String email, String password)async {

    return executeApi<AppUser>(()async{
      var authResponse = await apiManager.login(email, password);
      var userDto = UserCon(token: authResponse.token,message:authResponse.message);
      return userDto.toUser();

    },);
  }

  @override
  Future<Result<Password?>> forgetPassword(String email) {

    return executeApi<Password>(()async{
      var forgetPasswordResponse = await apiManager.forgetPassword(email);
      return forgetPasswordResponse!.toPassword( );

    },);
  }





}