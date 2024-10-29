abstract class OfflineProfileDataSource {
  Future<void> cacheProfileData(dynamic profileData);

  Future<dynamic> getCachedProfileData();
}
