abstract class OfflineAuthDataSource {
  Future<String> getToken();
  Future<void> saveToken(String? token);
}