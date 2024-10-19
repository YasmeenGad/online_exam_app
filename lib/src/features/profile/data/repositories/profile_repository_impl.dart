import 'package:injectable/injectable.dart';
import 'package:online_exam_app/src/features/profile/data/datasources/contracts/online_datasource/profile_datasource.dart';
import 'package:online_exam_app/src/features/profile/domain/entities/response/profile_data_response.dart';

import '../../domain/contracts/profile_repository.dart';

@Injectable(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  final OnlineProfileDataSource _profileDataSource;

  @factoryMethod
  ProfileRepositoryImpl(this._profileDataSource);

  @override
  Future<ProfileDataResponse> getProfileData(String token) async {
    var response = await _profileDataSource.getProfileData(token);
    return response;
  }
}
