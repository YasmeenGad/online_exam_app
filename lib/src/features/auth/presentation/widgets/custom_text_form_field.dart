import 'package:flutter/material.dart';
import 'package:online_exam_app/src/core/styles/app_colors.dart';
import 'package:online_exam_app/src/core/styles/app_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, this.hintText, this.labelText});
  final String? hintText;
  final String? labelText;

  @override
  Widget build(BuildContext context) {
    return Form(child: TextFormField(
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: '${labelText ?? ''}',
                      labelStyle: AppStyles.styleRegular12(context).copyWith(color: AppColors.grayColor),
                      hintText: '${hintText ?? ''}',
                      hintStyle: AppStyles.styleRegular14(context).copyWith(color: AppColors.placeHolderColor),
                      border: OutlineInputBorder(),
                    ),
                  ));
  }
}