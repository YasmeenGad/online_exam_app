import 'package:flutter/material.dart';
import 'package:online_exam_app/src/core/constants/assets.dart';
import 'package:online_exam_app/src/core/styles/app_colors.dart';
import 'package:online_exam_app/src/core/styles/app_styles.dart';

import '../../features/auth/data/datasources/contracts/offline_auth_datasource.dart';
import '../routes/routes_name.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key, required this.offlineAuthDataSource});

  final OfflineAuthDataSource offlineAuthDataSource;

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 3),
      () async {
        final token = await offlineAuthDataSource.getToken();
        bool isLogged = token != null && token.isNotEmpty;
        if (isLogged) {
          Navigator.pushReplacementNamed(
              context, RoutesName.bottomNavigationBar);
        } else {
          Navigator.pushReplacementNamed(context, RoutesName.welcomeView);
        }
      },
    );
    return Scaffold(
      backgroundColor: AppColors.babyBlue,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(Assets.imagesSplash,
                width: double.infinity, height: 400, fit: BoxFit.fitWidth),
            const SizedBox(height: 50),
            Text("${AppLocalizations.of(context)?.examApp}",
                style: AppStyles.styleMedium30(context)
                    .copyWith(color: Colors.white))
          ]),
    );
  }
}

