import 'package:flutter/material.dart';
import 'package:online_exam_app/src/core/global/custom_appbar.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import 'package:online_exam_app/src/features/exam/presentation/widgets/shadow_container_widget.dart';
import '../../../../core/routes/routes_name.dart';
import '../../../../core/styles/app_colors.dart';
import '../../../../core/styles/app_styles.dart';
import '../../../exam/presentation/widgets/cached_network_widget.dart';

class ResultView extends StatelessWidget {
  const ResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CustomAppBar(appBarTxt: '${AppLocalizations.of(context)?.results}')
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 35),
            Text(
              '${AppLocalizations.of(context)?.language}',
              style: AppStyles.styleMedium20(context) ,
            ),
            SizedBox(height: 30),
            ListView.separated(
              separatorBuilder:(context, index) => SizedBox(height: 15),
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index){
                return  InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RoutesName.answerView,
                        arguments: (){
                          Navigator.pop(context);
                        });

                      },
                      child: shadowContainer(
                          width: 0.5,
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                          child: Row(
                            children: [
                              CachedNetworkWidget(
                                width: 60,
                                height: 71,
                                imageUrl: 'https://cdn-icons-png.flaticon.com/512/149/149071.png',
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                         'Flutter',
                                          style: AppStyles.styleMedium16(context),
                                        ),
                                        Expanded(
                                          child: Align(
                                            alignment: Alignment.topRight,
                                            child: Text(
                                              '30 ${AppLocalizations.of(context)?.minutes}',
                                              style: AppStyles.styleRegular13(context)

                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "20 ${AppLocalizations.of(context)?.question}",
                                      style: AppStyles.styleRegular13(context)
                                          .copyWith(color: AppColors.grayColor),
                                    ),
                                    SizedBox(height: 10),
                                    Flexible(
                                      child: Text('18 corrected answers in 25 min.',
                                          style: AppStyles.styleMedium13(context).copyWith(
                                            color: AppColors.blueBaseColor
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    );

              },
            )
          ],
        ),
      ),

    );
  }
}

