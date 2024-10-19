import 'package:online_exam_app/src/features/auth/domain/core/result.dart';
import 'package:online_exam_app/src/features/profile/domain/core/profile_%20result.dart';
import 'package:online_exam_app/src/features/profile/domain/entities/response/profile_data_response.dart';

abstract class ProfileRepository {
  Future<ProfileResult<ProfileDataResponse>> getProfileData(String token);
}
