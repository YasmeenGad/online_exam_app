import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:online_exam_app/src/features/auth/data/data_sources/contracts/offline_auth_datasource.dart';
import '../../../../core/di/di.dart';
import '../../../../core/global/custom_button.dart';
import '../../../../core/global/custom_toast.dart';
import '../../../../core/routes/routes_name.dart';
import '../../../../core/styles/app_colors.dart';
import '../../../../core/styles/app_styles.dart';

void showLogoutDialog(BuildContext context) {
  final OfflineAuthDataSource offlineAuthDataSource = getIt<OfflineAuthDataSource>();
  showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: SizedBox(
            width: 800,
            height: 260,
            child: AlertDialog(
              content: Column(
                children: [
                  Text(
                    AppLocalizations.of(context)!.logout,
                    style: AppStyles.styleMedium16(context).copyWith(
                      color: AppColors.blackBaseColor,
                    ),
                  ),
                  SizedBox(height: 25),
                  Text(
                    AppLocalizations.of(context)!.logoutDesc,
                    style: AppStyles.styleRegular14(context)
                        .copyWith(color: AppColors.blackBaseColor),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 100,
                        height: 50,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: CustomButton(
                            txt: AppLocalizations.of(context)!.cancel,
                            color: AppColors.whiteColor,
                            textColor: AppColors.blueBaseColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        height: 50,
                        child: GestureDetector(
                          onTap: () async {
                            await offlineAuthDataSource.deleteToken();
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              RoutesName.loginView,
                                  (route) => false,
                            );
                            debugPrint(offlineAuthDataSource.getToken().toString());
                            CustomToast.showLoadingToast(
                                message: "${AppLocalizations.of(context)!.success}");
                          },
                          child: CustomButton(
                            txt: AppLocalizations.of(context)!.logout,
                            color: AppColors.blueBaseColor,
                            textColor: AppColors.whiteColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      });
}