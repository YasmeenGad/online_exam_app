import 'package:injectable/injectable.dart';
import 'package:online_exam_app/src/features/profile/domain/entities/response/profile_data_response.dart';
import '../../../../core/utils/errors/result.dart';
import '../contracts/profile_repository.dart';
import '../entities/request/change_password_request_entity.dart';
import '../entities/response/change_password_response_entity.dart';
import '../entities/response/edit_profile_response_entity.dart';

@injectable
class ProfileUseCase {
  final ProfileRepository _profileRepository;

  @factoryMethod
  ProfileUseCase(this._profileRepository);

  Future<Result<ProfileDataResponse>> getProfileData(String token) async {
    return await _profileRepository.getProfileData(token);
  }

  Future<Result<ChangePasswordResponseEntity>> changePassword(
      String token, ChangePasswordRequestEntity request) async {
    return await _profileRepository.changePassword(token, request);
  }

  Future<Result<EditProfileResponseEntity>> editProfile(
      String token, Map<String, dynamic> profileData) async {
    return await _profileRepository.editProfile(token, profileData);
  }
}
