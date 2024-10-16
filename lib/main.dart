import 'package:flutter/material.dart';
import 'package:online_exam_app/src/core/dependency%20injection/di.dart';
import 'package:online_exam_app/src/core/provider/language_provider.dart';
import 'package:online_exam_app/src/core/routes/app_routes.dart';
import 'package:online_exam_app/src/core/routes/routes_name.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  configureDependencies();
  runApp(const OnlineExamApp());
}

class OnlineExamApp extends StatelessWidget {
  const OnlineExamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => getIt<LanguageProvider>()..loadSelectedLanguage(),
        child: Consumer<LanguageProvider>(
          builder: (context, languageProvider, _) {
            return MaterialApp(
              supportedLocales: AppLocalizations.supportedLocales,
              locale: Locale(languageProvider.selectedLanguage.code),
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              debugShowCheckedModeBanner: false,
              initialRoute: RoutesName.welcomeView,
              routes: AppRoutes.getRoutes(),
            );
          },
        ));
  }
}
