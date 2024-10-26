import '../../../../domain/entities/response/profile_data_response.dart';

abstract class OfflineProfileDataSource {
  Future<void> cacheProfileData(ProfileDataResponse profileData);

  Future<ProfileDataResponse?> getCachedProfileData();
}
