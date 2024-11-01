import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/src/core/styles/app_colors.dart';
import 'package:online_exam_app/src/core/styles/app_styles.dart';
import 'package:online_exam_app/src/features/exam/presentation/manager/exam/exam_cubit.dart';
import '../../../../core/di/di.dart';
import '../widgets/cached_network_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../widgets/custom_divider.dart';
import 'exam_loading.dart';

class ExamDetailsItem extends StatelessWidget {
  const ExamDetailsItem({super.key, required this.examId, required this.subjectImage});
  final String examId;
  final String subjectImage;

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<ExamCubit, ExamState>(
      bloc: getIt<ExamCubit>().. doAction(getExamDetails(examId)),
      builder: (context, state) {
        if (state is ExamDetailsLoading) {
          return ExamLoadingData();
        } else if (state is ExamDetailsSuccess) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CachedNetworkWidget(
                            height: 47,
                            width: 42,
                            imageUrl: subjectImage,
                          ),
                          SizedBox(width: 7),
                          Text(
                            '${AppLocalizations.of(context)?.exams}',
                            style: AppStyles.styleMedium20(context),
                          ),
                          Spacer(),
                          Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              '${state.exam.duration} ${AppLocalizations.of(context)?.minutes}',
                              style: AppStyles.styleRegular13(context)
                                  .copyWith(
                                  color: AppColors.blueBaseColor),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            '${state.exam.title}',
                            style: AppStyles.styleMedium18(context),
                          ),
                          SizedBox(width: 10),
                          customDivider(),
                          SizedBox(width: 10),
                          Text(
                            " ${state.exam.numberOfQuestions} ${AppLocalizations.of(context)?.question}",
                            style: AppStyles.styleRegular16(context)
                                .copyWith(color: AppColors.grayColor),
                          ),
                        ],
                      ),
                    ]),
              ],
            ),
          );
        } else if (state is ExamDetailsError) {
          return Text(state.exception.toString());
        }
        return Container();
      },
    );

  }
}
