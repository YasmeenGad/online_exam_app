import 'package:online_exam_app/src/features/profile/domain/entities/response/profile_data_response.dart';
import '../../../../core/utils/errors/result.dart';
import '../entities/request/change_password_request_entity.dart';
import '../entities/response/change_password_response_entity.dart';
import '../entities/response/edit_profile_response_entity.dart';

abstract class ProfileRepository {
  Future<Result<ProfileDataResponse>> getProfileData(String token);

  Future<Result<ChangePasswordResponseEntity>> changePassword(
      String token, ChangePasswordRequestEntity request);

  Future<Result<EditProfileResponseEntity>> editProfile(
      String token, Map<String, dynamic> profileData);
}
