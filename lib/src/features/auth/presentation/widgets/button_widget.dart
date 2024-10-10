import 'package:flutter/material.dart';
import 'package:online_exam_app/src/core/styles/app_colors.dart';
import '../../../../core/styles/app_styles.dart';



class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    this.onPressed,
    this.color,
    this.text,
    this.textColor = Colors.white,
    this.width,
    this.child,
    this.borderColor,
    this.loading = false,
    this.loadingColor,
    this.fontStyle,
    this.margin,
    this.padding,
  }) : assert(child != null || text != null);
  final Function()? onPressed;
  final Color? color;
  final String? text;
  final double? width;
  final Widget? child;
  final Color? borderColor;
  final Color textColor;
  final bool loading;
  final Color? loadingColor;
  final TextStyle? fontStyle;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: MaterialButton(
        elevation: 2,
        onPressed: onPressed,
        color: loading ? AppColors.blueBaseColor : color ?? AppColors.blueBaseColor,
        disabledTextColor: Colors.red,

        disabledColor: color ?? AppColors.blueBaseColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15 ),
          side: borderColor != null
              ? BorderSide(
            color: borderColor!,
          )
              : BorderSide.none,
        ),
        splashColor: color,
        focusColor: color,
        highlightColor: color,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: loading
            ? SizedBox(
          height: 48,
          child: Center(
            child: CircularProgressIndicator(
              color: loadingColor ?? Colors.white,
            ),
          ),
        )
            : text != null
            ? Center(
          child: Text(
            text!,
            style: fontStyle ??
                AppStyles.styleMedium16(context).copyWith(
                  color: Colors.white,
                ),
          ),
        )
            : child,
      ),
    );
  }
}