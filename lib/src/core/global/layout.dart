import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_exam_app/src/core/styles/app_colors.dart';
import 'package:online_exam_app/src/core/styles/app_styles.dart';
import 'package:online_exam_app/src/features/exam/presentation/views/subjects_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../constants/assets.dart';

class Layout extends StatefulWidget {
  @override
  LayoutState createState() => LayoutState();
}

class LayoutState extends State<Layout> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<String> listOfIcons = [
      Assets.imageHome,
      Assets.imageResult,
      Assets.imageProfile,
    ];

    List<String> listOfTitles = [
      AppLocalizations.of(context)!.home,
      AppLocalizations.of(context)!.result,
      AppLocalizations.of(context)!.profile,
    ];

    final List<Widget> _pages = [
      const SubjectsView(),
      const SubjectsView(),
      const SubjectsView(),
    ];
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        height: screenWidth * .170,
        color: AppColors.lightGray,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            3,
            (index) => Expanded(
              child: InkWell(
                onTap: () {
                  setState(() {
                    _currentIndex = index;
                    HapticFeedback.lightImpact();
                  });
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn,
                          height: index == _currentIndex ? 34 : 0,
                          width: index == _currentIndex ? 66 : 0,
                          decoration: BoxDecoration(
                              color: index == _currentIndex
                                  ? AppColors.lightBlue
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(50)),
                        ),
                        Container(
                          width: 70,
                          height: 34,
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            listOfIcons[index],
                            color: index == _currentIndex
                                ? AppColors.blueBaseColor
                                : AppColors.black30Color,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      listOfTitles[index],
                      style: AppStyles.styleMedium12(context).copyWith(
                        color: index == _currentIndex
                            ? AppColors.blueBaseColor
                            : AppColors.black30Color,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
