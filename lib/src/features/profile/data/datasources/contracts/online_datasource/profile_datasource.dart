import 'package:online_exam_app/src/features/profile/domain/core/profile_%20result.dart';

import '../../../../domain/entities/response/profile_data_response.dart';

abstract class OnlineProfileDataSource {
  Future<ProfileResult<ProfileDataResponse>> getProfileData(String token);
}
