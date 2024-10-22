import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/src/features/auth/data/api/models/request/sign_up_model.dart';
import 'package:online_exam_app/src/features/profile/data/api/models/response/edit_profile_response_dto.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/constants/app_apis.dart';
import 'models/request/change_password_request_dto.dart';
import 'models/response/change_password_response_dto.dart';
import 'models/response/profile_data_response_dto.dart';
part 'profile_retrofit_client.g.dart';
@Singleton()
@Injectable()
@RestApi(baseUrl: AppApis.baseUrl)
abstract class ProfileRetrofitClient{

  @factoryMethod
  factory ProfileRetrofitClient(Dio dio) = _ProfileRetrofitClient;

  @GET(AppApis.profileData)
  Future<ProfileDataResponseDto> getProfileData(@Header("token") String token);

  @PATCH(AppApis.changePassword)
  Future<ChangePasswordResponseDto> changePassword(
      @Header("token") String token,
      @Body() ChangePasswordRequestDto changePasswordRequestDto);

  @PUT(AppApis.editProfile)
  Future<EditProfileResponseDto> editProfile(
      @Header("token") String token, @Body() Map<String, dynamic> body);
}
