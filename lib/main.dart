import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:online_exam_app/src/core/di/di.dart';
import 'package:online_exam_app/src/core/global/splash.dart';
import 'package:online_exam_app/src/core/dependency%20injection/di.dart';
import 'package:online_exam_app/src/core/routes/routes_name.dart';
import 'package:online_exam_app/src/features/splash/view/splash_view.dart';
import 'package:online_exam_app/src/core/provider/language_provider.dart';
import 'package:online_exam_app/src/core/routes/app_routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:online_exam_app/src/features/auth/data/datasources/contracts/offline_auth_datasource.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('userToken');
  await Hive.openBox<String>('imageCache');
  configureDependencies();
  runApp(
    DevicePreview(
      enabled: kReleaseMode,
      builder: (context) => OnlineExamApp(), // Wrap your app
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
              initialRoute: RoutesName.splashView,
              routes: AppRoutes.getRoutes(),
            );
          },
        ));
  }
}

