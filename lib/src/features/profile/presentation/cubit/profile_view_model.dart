import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/src/features/auth/data/datasources/contracts/offline_auth_datasource.dart';
import 'package:online_exam_app/src/features/auth/domain/core/AppExceptions.dart';
import 'package:online_exam_app/src/features/profile/domain/entities/response/edit_profile_response_entity.dart';
import 'package:online_exam_app/src/features/profile/domain/entities/response/profile_data_response.dart';
import 'package:online_exam_app/src/features/profile/domain/usecases/profile_usecase.dart';
import 'package:online_exam_app/src/features/profile/presentation/cubit/profile_actions.dart';
import 'package:online_exam_app/src/features/profile/presentation/cubit/profile_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../core/di/di.dart';
import '../../../../core/utils/errors/result.dart';
import '../../data/datasources/contracts/offline_datasource/offline_profile_datasource.dart';
import '../../domain/entities/request/change_password_request_entity.dart';
import '../../domain/entities/response/change_password_response_entity.dart';

@injectable
class ProfileViewModel extends Cubit<ProfileState> {
  final ProfileUseCase _profileUseCase;
  var offlineAuthDataSource = getIt<OfflineAuthDataSource>();
  var offlineProfileDataSource = getIt<OfflineProfileDataSource>();

  ProfileViewModel(this._profileUseCase) : super(ProfileInitial());

  void doAction(ProfileActions action) async {
    switch (action) {
      case GetProfileData():
        {
          _getProfileData(action.context);
          break;
        }
      case ChangePassword():
        {
          _changePassword(action.context, action.request);
          break;
        }
      case EditProfile():
        {
          _editProfile(action.context, action.profileData);
          break;
        }
      case CacheProfileImage():
        {
          _cacheImage(action.imageFile);
          break;
        }
      case GetCachedProfileImage():
        {
          _loadCachedImage();
          break;
        }
    }
  }

  void _getProfileData(BuildContext context) async {
    emit(ProfileDataLoading());
    String? token = await offlineAuthDataSource.getToken();
    var result = await _profileUseCase.getProfileData(token!);
    switch (result) {
      case Success<ProfileDataResponse>():
        {
          emit(ProfileDataSuccess(result.data!));
          await offlineProfileDataSource.cacheProfileData(result.data!);
          break;
        }
      case Failure<ProfileDataResponse>():
        {
          final exception = result.exception;
          String message;
          if (exception is NoInternetException) {
            message = "${AppLocalizations.of(context)?.noInternetException}";
            emit(ProfileDataError(exception: message));
          } else if (exception is ServerError) {
            message = "${AppLocalizations.of(context)?.serverErrorException}";
            emit(ProfileDataError(exception: message));
          } else if (exception is UnauthorizedException) {
            message = "${AppLocalizations.of(context)?.unauthorizedException}";
            emit(ProfileDataError(exception: message));
          } else {
            message = "${AppLocalizations.of(context)?.unknownErrorException}";
            emit(ProfileDataError(exception: message));
          }
          break;
        }
    }
  }

  void _changePassword(
      BuildContext context, ChangePasswordRequestEntity request) async {
    emit(ChangePasswordLoading());
    String? token = await offlineAuthDataSource.getToken();
    var result = await _profileUseCase.changePassword(token!, request);
    switch (result) {
      case Success<ChangePasswordResponseEntity>():
        {
          emit(ChangePasswordSuccess(result.data!));
          await offlineAuthDataSource.saveToken(result.data!.token);
          break;
        }
      case Failure<ChangePasswordResponseEntity>():
        {
          final exception = result.exception;
          String message;
          if (exception is NoInternetException) {
            message = "${AppLocalizations.of(context)?.noInternetException}";
            emit(ChangePasswordError(exception: message));
          } else if (exception is ServerError) {
            message = "${AppLocalizations.of(context)?.serverErrorException}";
            emit(ChangePasswordError(exception: message));
          } else if (exception is UnauthorizedException) {
            message = exception.message ?? "";
            emit(ChangePasswordError(exception: message));
          } else {
            message = "${AppLocalizations.of(context)?.unknownErrorException}";
            emit(ChangePasswordError(exception: message));
          }
          break;
        }
    }
  }

  void _editProfile(BuildContext context, Map<String, dynamic> data) async {
    emit(EditProfileLoading());
    String? token = await offlineAuthDataSource.getToken();
    var result = await _profileUseCase.editProfile(token!, data);
    switch (result) {
      case Success<EditProfileResponseEntity>():
        {
          emit(EditProfileSuccess(result.data!));
          await offlineProfileDataSource.cacheProfileData(result.data!);
          break;
        }
      case Failure<EditProfileResponseEntity>():
        {
          final exception = result.exception;
          String message;
          if (exception is NoInternetException) {
            message = "${AppLocalizations.of(context)?.noInternetException}";
            emit(EditProfileError(exception: message));
          } else if (exception is ServerError) {
            message = "${AppLocalizations.of(context)?.serverErrorException}";
            emit(EditProfileError(exception: message));
          } else if (exception is UnauthorizedException) {
            message = exception.message ?? "";
            emit(EditProfileError(exception: message));
          } else {
            message = "${AppLocalizations.of(context)?.unknownErrorException}";
            emit(EditProfileError(exception: message));
          }
          break;
        }
    }
  }

  Future<void> _cacheImage(File imageFile) async {
    final box = Hive.box<String>('imageCache');
    await box.put('profileImage', imageFile.path);
    print("Image cached at path: ${imageFile.path}");
  }

  Future<void> _loadCachedImage() async {
    final box = Hive.box<String>('imageCache');
    final cachedPath = await box.get('profileImage');
    if (cachedPath != null) {
      emit(CachedProfileImageLoadedState(File(cachedPath)));
    }
  }
}
