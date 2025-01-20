import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:online_exam_app/src/core/di/di.dart';
import 'package:online_exam_app/src/core/routes/routes_name.dart';
import 'package:online_exam_app/src/core/provider/language_provider.dart';
import 'package:online_exam_app/src/core/routes/app_routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:online_exam_app/src/features/questions/domain/entities/response/check_question_response_entity.dart';
import 'package:online_exam_app/src/features/questions/domain/entities/response/question_response_entity.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await Hive.initFlutter();
  await Hive.openBox('userToken');
  await Hive.openBox<String>('imageCache');
  configureDependencies();
  runApp(
    DevicePreview(
      //enabled: kReleaseMode,
      enabled: false,
      builder: (context) => OnlineExamApp(),
    ),
  );
}

class OnlineExamApp extends StatelessWidget {
  final String? token;

  const OnlineExamApp({super.key, this.token});

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
              useInheritedMediaQuery: true,
              builder: DevicePreview.appBuilder,
              debugShowCheckedModeBanner: false,
              initialRoute: RoutesName.welcomeView,
              routes: AppRoutes.getRoutes(),
            );
          },
        ));
  }
}

