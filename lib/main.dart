import 'package:flutter/material.dart';
import 'package:online_exam_app/src/core/dependency%20injection/di.dart';
import 'package:online_exam_app/src/core/routes/app_routes.dart';
import 'package:online_exam_app/src/core/routes/routes_name.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
void main() {
  configureDependencies(); 
  runApp(const OnlineExamApp());
}

class OnlineExamApp extends StatelessWidget {
  const OnlineExamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: [
        Locale("en"),
        Locale("ar")
      ],
      locale: const Locale("ar"),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],

      
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesName.loginView,
      routes: AppRoutes.getRoutes(),
    );
  }
}