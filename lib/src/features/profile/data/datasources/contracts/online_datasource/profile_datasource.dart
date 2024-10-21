import 'package:online_exam_app/src/features/profile/domain/core/profile_%20result.dart';
import 'package:online_exam_app/src/features/profile/domain/entities/request/change_password_request_entity.dart';
import 'package:online_exam_app/src/features/profile/domain/entities/response/change_password_response_entity.dart';

import '../../../../domain/entities/response/profile_data_response.dart';

abstract class OnlineProfileDataSource {
  Future<ProfileResult<ProfileDataResponse>> getProfileData(String token);

  Future<ProfileResult<ChangePasswordResponseEntity>> changePassword(
      String token, ChangePasswordRequestEntity request);
}
