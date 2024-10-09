import 'package:fluttertoast/fluttertoast.dart';

import '../../../../core/constants/app_colors.dart';

showToast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColors.blueBaseColor,
      textColor: AppColors.whiteColor,
      fontSize: 16.0
  );
}
