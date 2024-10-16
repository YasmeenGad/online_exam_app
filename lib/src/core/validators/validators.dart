import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Validators {
  static String? validateUserName(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return '${AppLocalizations.of(context)!.invalidUserName}';
    }
    if (value.length < 3) {
      return '${AppLocalizations.of(context)!.userNameLength}';
    }
    return null;
  }

  static String? validateFirstName(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return '${AppLocalizations.of(context)!.enterFirstName}';
    }
    return null;
  }

  static String? validateLastName(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return '${AppLocalizations.of(context)!.enterLastName}';
    }
    return null;
  }

  static String? validateEmail(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return '${AppLocalizations.of(context)!.enterEmail}';
    }
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return '${AppLocalizations.of(context)!.invalidEmail}';
    }
    return null;
  }

  static String? validatePassword(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return '${AppLocalizations.of(context)!.enterPassword}';
    }
    final passwordRegExp = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$');
    if (!passwordRegExp.hasMatch(value)) {
      return '${AppLocalizations.of(context)!.passwordComplexity}';
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String? password, BuildContext context) {
    if (value == null || value.isEmpty) {
      return '${AppLocalizations.of(context)!.confirmPassword}';
    }
    if (value != password) {
      return '${AppLocalizations.of(context)!.passwordMismatch}';
    }
    return null;
  }

  static String? validatePhoneNumber(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return '${AppLocalizations.of(context)!.enterPhoneNumber}';
    }
    final phoneRegExp = RegExp(r'^\d{10,15}$');
    if (!phoneRegExp.hasMatch(value)) {
      return '${AppLocalizations.of(context)!.invalidPhoneNumber}';
    }
    return null;
  }
}
