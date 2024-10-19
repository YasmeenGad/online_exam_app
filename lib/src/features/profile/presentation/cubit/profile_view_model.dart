import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/src/features/auth/domain/core/AppExceptions.dart';
import 'package:online_exam_app/src/features/profile/domain/core/profile_%20result.dart';
import 'package:online_exam_app/src/features/profile/domain/entities/response/profile_data_response.dart';
import 'package:online_exam_app/src/features/profile/domain/usecases/profile_usecase.dart';
import 'package:online_exam_app/src/features/profile/presentation/cubit/profile_actions.dart';
import 'package:online_exam_app/src/features/profile/presentation/cubit/profile_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileViewModel extends Cubit<ProfileState> {
  final ProfileUseCase _profileUseCase;

  ProfileViewModel(this._profileUseCase) : super(ProfileInitial());

  void doAction(ProfileActions action) async {
    switch (action) {
      case GetProfileData():
        {
          _getProfileData(action.token, action.context);
          break;
        }
    }
  }

  void _getProfileData(String token, BuildContext context) async {
    emit(ProfileDataLoading());
    var result = await _profileUseCase.getProfileData(token);
    switch (result) {
      case Success<ProfileDataResponse>():
        {
          emit(ProfileDataSuccess(result.data!));
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
}