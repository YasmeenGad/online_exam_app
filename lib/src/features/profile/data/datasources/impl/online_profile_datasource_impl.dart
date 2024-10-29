import 'package:injectable/injectable.dart';
import 'package:online_exam_app/src/features/profile/domain/entities/request/change_password_request_entity.dart';
import 'package:online_exam_app/src/features/profile/domain/entities/response/change_password_response_entity.dart';
import 'package:online_exam_app/src/features/profile/domain/entities/response/edit_profile_response_entity.dart';
import '../../../../../core/utils/errors/result.dart';
import '../../../../../core/utils/api/api_execution.dart';
import '../../../domain/entities/response/profile_data_response.dart';
import '../../api/profile_retrofit_client.dart';
import '../contracts/online_datasource/online_profile_datasource.dart';

@Injectable(as: OnlineProfileDataSource)
class ProfileDataSourceImpl implements OnlineProfileDataSource {
  final ProfileRetrofitClient _profileRetrofitClient;

  @factoryMethod
  ProfileDataSourceImpl(this._profileRetrofitClient);

  @override
  Future<Result<ProfileDataResponse>> getProfileData(String token) async {
    return await apiExecute(
      tryCode: () => _profileRetrofitClient.getProfileData(token),
      domainMapper: (response) => response.toDomain(),
    );
  }

  @override
  Future<Result<ChangePasswordResponseEntity>> changePassword(
      String token, ChangePasswordRequestEntity request) async {
    return await apiExecute(
      tryCode: () =>
          _profileRetrofitClient.changePassword(token, request.toDto()),
      domainMapper: (response) => response.toEntity(),
    );
  }

  @override
  Future<Result<EditProfileResponseEntity>> editProfile(
      String token, Map<String, dynamic> profileData) async {
    return await apiExecute(
      tryCode: () => _profileRetrofitClient.editProfile(token, profileData),
      domainMapper: (response) => response.toEntity(),
    );
  }
}
