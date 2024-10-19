import 'package:flutter/cupertino.dart';
import 'package:online_exam_app/src/features/profile/domain/entities/response/profile_data_response.dart';

sealed class ProfileActions {}

class GetProfileData extends ProfileActions {
  final String token;
  BuildContext context;

  GetProfileData({required this.token, required this.context});
}