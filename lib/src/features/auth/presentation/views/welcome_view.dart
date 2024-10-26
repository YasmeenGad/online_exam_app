import 'package:flutter/material.dart';
import 'package:online_exam_app/src/core/constants/assets.dart';
import 'package:online_exam_app/src/core/global/custom_button.dart';
import 'package:online_exam_app/src/core/models/language.dart';
import 'package:online_exam_app/src/core/provider/language_provider.dart';
import 'package:online_exam_app/src/core/routes/routes_name.dart';
import 'package:online_exam_app/src/core/styles/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:online_exam_app/src/core/styles/app_styles.dart';
import 'package:online_exam_app/src/features/auth/presentation/views/login_view.dart';
import 'package:page_animation_transition/animations/scale_animation_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
import 'package:provider/provider.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  _WelcomeViewState createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  String? _selectedLanguage;

  @override
  void initState() {
    super.initState();
    final languageProvider =
        Provider.of<LanguageProvider>(context, listen: false);
    _selectedLanguage = languageProvider.selectedLanguage.name;
  }

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);

    List<String> languages = [
      'العربيه',
      'English (US)',
      'Français',
      'Deutsch',
      'Türkçe'
    ];
    List<Language> languageCodes = [
      Language(code: 'ar', name: 'العربيه'),
      Language(code: 'en', name: 'English (US)'),
      Language(code: 'fr', name: 'French'),
      Language(code: 'de', name: 'German'),
      Language(code: 'tr', name: 'Türkçe'),
    ];

    List<Widget> images = [
      Image.asset(Assets.imagesEgypt, height: 28, width: 28),
      Image.asset(Assets.imagesUS, height: 28, width: 28),
      Image.asset(Assets.imagesFrench, height: 28, width: 28),
      Image.asset(Assets.imagesGerman, height: 28, width: 28),
      Image.asset(Assets.imagesTurkey, height: 28, width: 28),
    ];

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.lightBlue.withOpacity(0.8),
              AppColors.whiteColor
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Row(
                  children: [
                    Icon(Icons.language,
                        size: 20, color: AppColors.blackBaseColor),
                    SizedBox(width: 8),
                    Text(
                      AppLocalizations.of(context)!.languages,
                      style: AppStyles.styleMedium20(context).copyWith(
                        color: AppColors.blackBaseColor,
                      ),
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 32),
              ),
              SliverToBoxAdapter(
                child: Text(
                  AppLocalizations.of(context)!.selectLanguage,
                  style: AppStyles.styleMedium16(context).copyWith(
                    color: AppColors.blackBaseColor,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 16),
              ),
              SliverList.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      height: 70,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: _selectedLanguage == languages[index]
                            ? AppColors.blueBaseColor.withOpacity(0.2)
                            : AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Center(
                        child: ListTile(
                          leading: images[index],
                          title: Text(
                            languages[index],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: _selectedLanguage == languages[index]
                                  ? AppColors.blueBaseColor
                                  : AppColors.blackBaseColor,
                            ),
                          ),
                          trailing: Radio<String>(
                            activeColor: AppColors.blueBaseColor,
                            value: languages[index],
                            groupValue: _selectedLanguage,
                            onChanged: (value) {
                              setState(() {
                                _selectedLanguage = value;
                                languageProvider
                                    .changeLanguage(languageCodes[index]);
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: languages.length,
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 20),
              ),
              if (_selectedLanguage !=
                  null) // Only show button if language is selected
                SliverToBoxAdapter(
                  child: GestureDetector(
                    onTap: () {
                      // Navigator.pushReplacementNamed(
                      //     context, RoutesName.loginView);
                      Navigator.of(context).push(PageAnimationTransition(
                          page: const LoginView(),
                          pageAnimationType: ScaleAnimationTransition()));
                    },
                    child: FractionallySizedBox(
                      widthFactor: 0.5,
                      child: CustomButton(
                        txt: AppLocalizations.of(context)!.labelContinue,
                      ),
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
