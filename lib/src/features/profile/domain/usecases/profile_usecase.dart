import 'package:injectable/injectable.dart';
import 'package:online_exam_app/src/features/profile/domain/entities/response/profile_data_response.dart';

import '../contracts/profile_repository.dart';

@injectable
class ProfileUseCase {
  final ProfileRepository _profileRepository;

  @factoryMethod
  ProfileUseCase(this._profileRepository);

  Future<ProfileDataResponse> getProfileData(String token) async {
    return await _profileRepository.getProfileData(token);
  }
}
