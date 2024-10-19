import 'package:injectable/injectable.dart';

import '../../../domain/core/profile_ result.dart';
import '../../../domain/entities/response/profile_data_response.dart';
import '../../api/profile_retrofit_client.dart';
import '../../core/profile_api_excution.dart';
import '../contracts/online_datasource/profile_datasource.dart';

@Injectable(as: OnlineProfileDataSource)
class ProfileDataSourceImpl implements OnlineProfileDataSource {
  final ProfileRetrofitClient _profileRetrofitClient;

  @factoryMethod
  ProfileDataSourceImpl(this._profileRetrofitClient);

  @override
  Future<ProfileResult<ProfileDataResponse>> getProfileData(
      String token) async {
    return await apiExecute(
      () => _profileRetrofitClient.getProfileData(token),
      (response) => response.toDomain(),
    );
  }
}
