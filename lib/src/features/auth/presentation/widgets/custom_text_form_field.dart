import 'package:flutter/material.dart';
import 'package:online_exam_app/src/core/styles/app_colors.dart';
import 'package:online_exam_app/src/core/styles/app_styles.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({super.key, this.hintText, this.labelText, this.controller});
  final String? hintText;
  final String? labelText;
  final dynamic controller;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
          controller: widget.controller,
          decoration: InputDecoration(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    labelText: '${widget.labelText ?? ''}',
    labelStyle: AppStyles.styleRegular12(context)
        .copyWith(color: AppColors.grayColor),
    hintText: '${widget.hintText ?? ''}',
    hintStyle: AppStyles.styleRegular14(context)
        .copyWith(color: AppColors.placeHolderColor),
    border: OutlineInputBorder(),
          ),
        );
  }
}
