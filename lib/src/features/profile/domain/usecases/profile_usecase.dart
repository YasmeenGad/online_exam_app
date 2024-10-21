import 'package:injectable/injectable.dart';
import 'package:online_exam_app/src/features/profile/domain/core/profile_%20result.dart';
import 'package:online_exam_app/src/features/profile/domain/entities/response/profile_data_response.dart';

import '../contracts/profile_repository.dart';
import '../entities/request/change_password_request_entity.dart';
import '../entities/response/change_password_response_entity.dart';

@injectable
class ProfileUseCase {
  final ProfileRepository _profileRepository;

  @factoryMethod
  ProfileUseCase(this._profileRepository);

  Future<ProfileResult<ProfileDataResponse>> getProfileData(
      String token) async {
    return await _profileRepository.getProfileData(token);
  }

  Future<ProfileResult<ChangePasswordResponseEntity>> changePassword(
      String token, ChangePasswordRequestEntity request) async {
    return await _profileRepository.changePassword(token, request);
  }
}
