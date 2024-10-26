import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:online_exam_app/src/features/profile/domain/entities/response/profile_data_response.dart';

import '../../domain/entities/request/change_password_request_entity.dart';

sealed class ProfileActions {}

class GetProfileData extends ProfileActions {
  BuildContext context;

  GetProfileData({required this.context});
}

class ChangePassword extends ProfileActions {
  BuildContext context;
  ChangePasswordRequestEntity request;

  ChangePassword({required this.context, required this.request});
}

class EditProfile extends ProfileActions {
  BuildContext context;
  Map<String, dynamic> profileData;

  EditProfile({required this.context, required this.profileData});
}

class CacheProfileImage extends ProfileActions {
  File imageFile;

  CacheProfileImage({required this.imageFile});
}

class GetCachedProfileImage extends ProfileActions {}