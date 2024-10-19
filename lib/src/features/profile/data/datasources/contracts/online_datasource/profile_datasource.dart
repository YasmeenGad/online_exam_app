import 'package:retrofit/http.dart';

import '../../../../domain/entities/response/profile_data_response.dart';

abstract class OnlineProfileDataSource {
  Future<ProfileDataResponse> getProfileData(String token);
}
