import 'package:flutter/material.dart';
import 'package:online_exam_app/src/core/constants/assets.dart';
import 'package:online_exam_app/src/core/global/custom_button.dart';
import 'package:online_exam_app/src/core/models/language.dart';
import 'package:online_exam_app/src/core/provider/language_provider.dart';
import 'package:online_exam_app/src/core/routes/routes_name.dart';
import 'package:online_exam_app/src/core/styles/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:online_exam_app/src/core/styles/app_styles.dart';
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
      'Türkçe',
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
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding:
            const EdgeInsets.only(top: 56, left: 16, right: 16, bottom: 16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Row(
                children: [
                  Icon(
                    Icons.language,
                    size: 20,
                    color: AppColors.blackBaseColor,
                  ),
                  SizedBox(width: 8),
                  Text(
                    '${AppLocalizations.of(context)!.languages}',
                    style: AppStyles.styleMedium20(context)
                        .copyWith(color: AppColors.blackBaseColor),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 32),
            ),
            SliverToBoxAdapter(
              child: Text(
                '${AppLocalizations.of(context)!.selectLanguage}',
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
                  child: Container(
                    height: 70,
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                      color: AppColors.lightBlue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: ListTile(
                        leading: images[index],
                        title: Text(languages[index]),
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
            SliverToBoxAdapter(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, RoutesName.loginView);
                },
                child: CustomButton(
                  txt: "${AppLocalizations.of(context)!.labelContinue}",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
