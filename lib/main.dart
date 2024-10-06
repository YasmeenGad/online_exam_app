import 'package:flutter/material.dart';
import 'package:online_exam_app/src/core/dependency%20injection/di.dart';
import 'package:online_exam_app/src/core/routes/app_routes.dart';
import 'package:online_exam_app/src/core/routes/routes_name.dart';

void main() {
  configureDependencies(); 
  runApp(const OnlineExamApp());
}

class OnlineExamApp extends StatelessWidget {
  const OnlineExamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesName.loginView,
      routes: AppRoutes.getRoutes(),
    );
  }
}