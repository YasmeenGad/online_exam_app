import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/src/features/profile/domain/entities/response/profile_data_response.dart';
import '../contracts/offline_datasource/offline_profile_datasource.dart';

@Injectable(as: OfflineProfileDataSource)
class OfflineProfileDataSourceImpl implements OfflineProfileDataSource {
  static const String _boxName = 'profileBox';
  static const String _profileDataKey = 'profileData';

  @FactoryMethod()
  OfflineProfileDataSourceImpl() {
    Hive.openBox(_boxName);
  }

  @override
  Future<void> cacheProfileData(dynamic profileData) async {
    final box = await Hive.openBox(_boxName);
    await box.put(_profileDataKey, profileData.toJson());
  }

  @override
  Future<dynamic> getCachedProfileData() async {
    final box = await Hive.openBox(_boxName);
    final data = box.get(_profileDataKey);
    if (data != null) {
      return ProfileDataResponse.fromJson(Map<String, dynamic>.from(data));
    }
    return null;
  }
}
