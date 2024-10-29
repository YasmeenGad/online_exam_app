import 'package:injectable/injectable.dart';
import 'package:online_exam_app/src/features/profile/data/datasources/contracts/offline_datasource/offline_profile_datasource.dart';
import 'package:online_exam_app/src/features/profile/data/datasources/contracts/online_datasource/online_profile_datasource.dart';
import 'package:online_exam_app/src/features/profile/domain/entities/request/change_password_request_entity.dart';
import 'package:online_exam_app/src/features/profile/domain/entities/response/change_password_response_entity.dart';
import 'package:online_exam_app/src/features/profile/domain/entities/response/edit_profile_response_entity.dart';
import 'package:online_exam_app/src/features/profile/domain/entities/response/profile_data_response.dart';

import '../../../../core/utils/errors/result.dart';
import '../../domain/contracts/profile_repository.dart';

@Injectable(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  final OnlineProfileDataSource _profileDataSource;
  final OfflineProfileDataSource _offlineProfileDataSource;

  @factoryMethod
  ProfileRepositoryImpl(
      this._profileDataSource, this._offlineProfileDataSource);

  @override
  Future<Result<ProfileDataResponse>> getProfileData(String token) async {
    final cachedProfile =
        await _offlineProfileDataSource.getCachedProfileData();
    if (cachedProfile != null) {
      return Success(data: cachedProfile);
    }
    var response = await _profileDataSource.getProfileData(token);
    return response;
  }

  @override
  Future<Result<ChangePasswordResponseEntity>> changePassword(
      String token, ChangePasswordRequestEntity request) async {
    var response = await _profileDataSource.changePassword(token, request);
    return response;
  }

  @override
  Future<Result<EditProfileResponseEntity>> editProfile(
      String token, Map<String, dynamic> profileData) async {
    var response = await _profileDataSource.editProfile(token, profileData);
    return response;
  }
}
