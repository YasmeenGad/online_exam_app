import 'package:flutter/cupertino.dart';
import 'package:online_exam_app/src/features/profile/domain/entities/response/profile_data_response.dart';

sealed class ProfileActions {}

class GetProfileData extends ProfileActions {
  BuildContext context;

  GetProfileData({required this.context});
}