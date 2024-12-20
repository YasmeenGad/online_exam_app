import 'package:flutter/material.dart';
import 'package:online_exam_app/src/core/styles/app_colors.dart';
import '../../../../core/styles/app_styles.dart';



class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({super.key,required this.controller, required this.validator , required this.keyboardType, this.labelText, this.hintText, this.suffixIcon, this.prefixIcon, this.onChanged, this.textInputAction, this.borderRadius, this.label,  this.obsecureText = false });
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final String? labelText , hintText;
  final Widget? suffixIcon , prefixIcon;
  final void Function(String)? onChanged;
  final TextInputAction? textInputAction;
  final double? borderRadius;
  final String? label;
  final bool obsecureText ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Column(
        children: [
          Expanded(
            child: TextFormField(
              controller: controller,
              validator: validator,
              keyboardType: keyboardType,
              onChanged: onChanged,
              textInputAction: textInputAction,
              obscureText: obsecureText,
              decoration: InputDecoration(
                fillColor: AppColors.whiteColor,
                alignLabelWithHint: true,
                labelText: labelText,
                labelStyle: AppStyles.styleRegular14(context).copyWith(color: AppColors.grayColor),
                hintText: hintText,
                hintStyle: AppStyles.styleRegular14(context).copyWith(color: AppColors.placeHolderColor),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.grayColor,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.grayColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.grayColor,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.grayColor,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.red,
                  ),
                ),
                errorStyle: const TextStyle(color: Colors.red),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.red,
                  ),
                ),
                suffixIcon: suffixIcon,
                prefixIcon: prefixIcon,
                errorMaxLines: 2,
              ),
            ),
          ),
        ],
      ),
    );

  }
}
