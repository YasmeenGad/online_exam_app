import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/src/features/splash/view_model/splash_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../generated/assets.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_styles.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..startSplash(context),
      child: BlocBuilder<SplashCubit, SplashState>(
        builder: (context, state) {
          final double _width = MediaQuery.of(context).size.width;
          return Scaffold(
            backgroundColor: AppColors.babyBlue,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (state is SplashShowFirstText) ...[
                    AnimatedOpacity(
                      duration: Duration(milliseconds: 1000),
                      opacity: 1.0,
                      child: Text(
                        "${AppLocalizations.of(context)?.examApp}",
                        style: AppStyles.styleMedium30(context).copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                  if (state is SplashShowImageAndSecondText) ...[
                    Spacer(),
                    AnimatedOpacity(
                      duration: Duration(milliseconds: 1000),
                      opacity: 1.0,
                      curve: Curves.fastLinearToSlowEaseIn,
                      child: Image.asset(
                        Assets.imagesSplash,
                        width: _width,
                        height: 400,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Spacer(),
                    AnimatedOpacity(
                      duration: Duration(milliseconds: 1000),
                      opacity: 1.0,
                      curve: Curves.fastLinearToSlowEaseIn,
                      child: Text(
                        "${AppLocalizations.of(context)?.examApp}",
                        style: AppStyles.styleMedium20(context).copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
