import 'package:injectable/injectable.dart';
import 'package:online_exam_app/src/features/profile/data/api/profile_retrofit_client.dart';
import 'package:online_exam_app/src/features/profile/data/datasources/contracts/online_datasource/profile_datasource.dart';
import 'package:online_exam_app/src/features/profile/domain/entities/response/profile_data_response.dart';

@Injectable(as: OnlineProfileDataSource)
class ProfileDataSourceImpl implements OnlineProfileDataSource {
  final ProfileRetrofitClient _profileRetrofitClient;

  @factoryMethod
  ProfileDataSourceImpl(this._profileRetrofitClient);

  @override
  Future<ProfileDataResponse> getProfileData(String token) async {
    try {
      var response = await _profileRetrofitClient.getProfileData(token);
      return response.toDomain();
    } catch (e) {
      rethrow;
    }
  }
}
