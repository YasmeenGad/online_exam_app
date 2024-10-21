import 'package:online_exam_app/src/features/profile/domain/entities/response/profile_data_response.dart';

import '../../domain/entities/response/change_password_response_entity.dart';
import '../../domain/entities/response/edit_profile_response_entity.dart';

sealed class ProfileState {}

class ProfileInitial extends ProfileState {}

/* Profile Data States */
class ProfileDataLoading extends ProfileState {}

class ProfileDataSuccess extends ProfileState {
  final ProfileDataResponse profileDataResponse;

  ProfileDataSuccess(this.profileDataResponse);
}

class ProfileDataError extends ProfileState {
  final String exception;

  ProfileDataError({required this.exception});
}

/* profile change password */

class ChangePasswordLoading extends ProfileState {}

class ChangePasswordSuccess extends ProfileState {
  final ChangePasswordResponseEntity response;

  ChangePasswordSuccess(this.response);
}

class ChangePasswordError extends ProfileState {
  final String exception;

  ChangePasswordError({required this.exception});
}

/*  edit profile  */

class EditProfileLoading extends ProfileState {}

class EditProfileSuccess extends ProfileState {
  final EditProfileResponseEntity response;

  EditProfileSuccess(this.response);
}

class EditProfileError extends ProfileState {
  final String? exception;

  EditProfileError({this.exception});
}
