import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:online_exam_app/src/core/di/di.dart';
import '../../../core/routes/routes_name.dart';
import '../../auth/data/data_sources/contracts/offline_auth_datasource.dart';

part 'splash_state.dart';



class SplashCubit extends Cubit<SplashState> {
  var offlineAuthDataSource = getIt<OfflineAuthDataSource>();

  SplashCubit() : super(SplashInitial());

  void startSplash( BuildContext context) {
    emit(SplashShowFirstText());

    Future.delayed(Duration(seconds: 2), () async {
      emit(SplashShowImageAndSecondText());

      Future.delayed(Duration(seconds: 2), () async {
        emit(SplashShowImageAndSecondText());
        final token = await offlineAuthDataSource.getToken();
      bool isLogged = token != null && token.isNotEmpty;

      if (isLogged) {
        Navigator.pushReplacementNamed(context, RoutesName.bottomNavigationBar);
      } else {
        Navigator.pushReplacementNamed(context, RoutesName.welcomeView);
      }
      });
    });
  }
}
