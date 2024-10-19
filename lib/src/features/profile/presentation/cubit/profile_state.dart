import 'package:online_exam_app/src/features/profile/domain/entities/response/profile_data_response.dart';

sealed class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileDataLoading extends ProfileState {}

class ProfileDataSuccess extends ProfileState {
  final ProfileDataResponse profileDataResponse;

  ProfileDataSuccess(this.profileDataResponse);
}

class ProfileDataError extends ProfileState {
  final String exception;

  ProfileDataError({required this.exception});
}
