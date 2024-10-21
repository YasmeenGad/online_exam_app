import 'package:online_exam_app/src/features/auth/domain/core/result.dart';
import 'package:online_exam_app/src/features/profile/domain/core/profile_%20result.dart';
import 'package:online_exam_app/src/features/profile/domain/entities/response/profile_data_response.dart';

import '../entities/request/change_password_request_entity.dart';
import '../entities/response/change_password_response_entity.dart';

abstract class ProfileRepository {
  Future<ProfileResult<ProfileDataResponse>> getProfileData(String token);

  Future<ProfileResult<ChangePasswordResponseEntity>> changePassword(
      String token, ChangePasswordRequestEntity request);
}
