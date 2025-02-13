import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:online_exam_app/src/core/di/di.dart';
import 'package:online_exam_app/src/core/provider/language_provider.dart';
import 'package:online_exam_app/src/core/routes/app_routes.dart';
import 'package:online_exam_app/src/core/routes/routes_name.dart';
import 'package:online_exam_app/src/features/auth/data/data_sources/contracts/offline_auth_datasource.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox('userToken');
  await Hive.openBox<String>('imageCache');

  configureDependencies();



  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => OnlineExamApp( offlineAuthDataSource: getIt<OfflineAuthDataSource>(),),
    ),
  );
}

class OnlineExamApp extends StatelessWidget {
 final OfflineAuthDataSource offlineAuthDataSource;

  const OnlineExamApp({super.key , required this.offlineAuthDataSource});

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
            initialRoute:offlineAuthDataSource.getToken() != null ? RoutesName.bottomNavigationBar : RoutesName.welcomeView,
            routes: AppRoutes.getRoutes(),
          );
        },
      ),
    );
  }
}