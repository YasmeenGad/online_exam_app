import 'package:online_exam_app/src/features/profile/domain/entities/response/profile_data_response.dart';

abstract class ProfileRepository {
  Future<ProfileDataResponse> getProfileData(String token);
}
