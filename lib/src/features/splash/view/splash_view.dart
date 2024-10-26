import 'dart:async';
import 'package:flutter/material.dart';
import 'package:online_exam_app/src/core/constants/assets.dart';
import 'package:online_exam_app/src/core/styles/app_colors.dart';
import 'package:online_exam_app/src/core/styles/app_styles.dart';
import '../../auth/data/datasources/contracts/offline_auth_datasource.dart';
import '../../../core/routes/routes_name.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SplashView extends StatefulWidget {
  final OfflineAuthDataSource offlineAuthDataSource;

  const SplashView({super.key, required this.offlineAuthDataSource});

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with TickerProviderStateMixin {
  double _fontSize = 2;
  double _containerSize = 1.5;
  double _textOpacity = 0.0;
  double _containerOpacity = 0.0;

  late AnimationController _controller;
  late Animation<double> animation1;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));

    animation1 = Tween<double>(begin: 40, end: 20).animate(CurvedAnimation(
        parent: _controller, curve: Curves.fastLinearToSlowEaseIn))
      ..addListener(() {
        setState(() {
          _textOpacity = 1.0;
        });
      });

    _controller.forward();

    Timer(Duration(seconds: 2), () {
      setState(() {
        _fontSize = 1.06;
      });
    });

    Timer(Duration(seconds: 2), () {
      setState(() {
        _containerSize = 2;
        _containerOpacity = 1;
      });
    });

    Timer(Duration(seconds: 3), () {
      setState(() async{

        final token = await widget.offlineAuthDataSource.getToken();
        bool isLogged = token != null && token.isNotEmpty;
        if (isLogged) {
          Navigator.pushReplacementNamed(
              context, RoutesName.bottomNavigationBar);
        } else {
          Navigator.pushReplacementNamed(context, RoutesName.welcomeView);
        }

      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.sizeOf(context).width;
    double _height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: AppColors.babyBlue,
      body: Stack(
        children: [
          Column(
            children: [
              AnimatedContainer(
                  duration: Duration(milliseconds: 2000),
                  curve: Curves.fastLinearToSlowEaseIn,
                  height: _height / _fontSize),
              AnimatedOpacity(
                duration: Duration(milliseconds: 1000),
                opacity: _textOpacity,
                child:
                            Text("${AppLocalizations.of(context)?.examApp}",
                style: AppStyles.styleMedium30(context)
                    .copyWith(color: Colors.white,fontSize: animation1.value),)

              ),
            ],
          ),
          Center(
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 2000),
              curve: Curves.fastLinearToSlowEaseIn,
              opacity: _containerOpacity,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 2000),
                curve: Curves.fastLinearToSlowEaseIn,
                height: _width / _containerSize,
                width: _width / _containerSize,
                alignment: Alignment.center,
                child:   Image.asset(Assets.imagesSplash,
                width: double.infinity, height: 400, fit: BoxFit.fitWidth),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



