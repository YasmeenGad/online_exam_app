import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppStyles {
static TextStyle styleMedium20(BuildContext context) {
  return GoogleFonts.inter(
    //  height: 24.2, // line height
    fontSize: getResponsiveFontSize(context, fontSize: 20),
    fontWeight: FontWeight.w500,
  );
}

static TextStyle styleRegular12(context) {
  return GoogleFonts.roboto(
    // height: 16,
    fontSize: getResponsiveFontSize(context, fontSize: 12),
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
  );
}

static TextStyle styleRegular14(context) {
  return GoogleFonts.roboto(
    // height: 24,
    fontSize: getResponsiveFontSize(context, fontSize: 14),
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
  );
}

static TextStyle styleRegular13(context) {
  return GoogleFonts.inter(
    // height: 15.73,
    fontSize: getResponsiveFontSize(context, fontSize: 13),
    fontWeight: FontWeight.w400,
  );
}

static TextStyle styleMedium16(BuildContext context) {
  return GoogleFonts.roboto(
    //  height: 20, 
    fontSize: getResponsiveFontSize(context, fontSize: 16),
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1
  );
}

static TextStyle styleRegular16(context) {
  return GoogleFonts.inter(
    // height: 19.36,
    fontSize: getResponsiveFontSize(context, fontSize: 16),
    fontWeight: FontWeight.w400,
  );
}

}

// sacleFactor
// responsive font size
// (min , max) fontsize
double getResponsiveFontSize(context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context) {
  double width = MediaQuery.sizeOf(context).width;

  if (width < 360) {
    return width / 360;  // Slight scaling for small devices like iPhone SE, older Android phones.
  } else if (width >= 360 && width < 480) {
    return width / 400;  // Moderate scaling for standard mobile phones.
  } else if (width >= 480 && width < 600) {
    return width / 450;  // Larger phones/phablets scaling.
  } else {
    return width / 600;  // Minimal scaling for tablets or very large devices.
  }
}

