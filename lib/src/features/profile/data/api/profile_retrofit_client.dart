import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/src/features/profile/domain/core/profile_%20result.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/constants/app_apis.dart';
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
}
