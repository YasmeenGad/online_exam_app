import 'package:flutter/material.dart';
import 'package:online_exam_app/src/core/styles/app_styles.dart';

import '../../../../core/styles/app_colors.dart';

class SubjectsView extends StatelessWidget {
  const SubjectsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Survey',style: AppStyles.styleMedium20(context)
            .copyWith(color: AppColors.blueBaseColor),),
      ),

    );
  }
}
