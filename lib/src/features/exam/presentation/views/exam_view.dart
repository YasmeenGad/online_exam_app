import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/src/core/global/custom_appbar.dart';
import 'package:online_exam_app/src/features/exam/presentation/manager/exam/exam_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../core/constants/assets.dart';
import 'package:online_exam_app/src/features/exam/presentation/widgets/exam_item_loading.dart';
import '../../../../core/dependency injection/di.dart';
import '../widgets/build_empty_data_widget.dart';
import '../widgets/exam_list.dart';

class ExamView extends StatelessWidget {
  const ExamView({super.key, required this.subjectId, required this.subjectImage});

  final String subjectId;
  final String subjectImage;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60),
            CustomAppBar(
                appBarTxt: '${AppLocalizations.of(context)?.exams}',
                showArrow: true),
            SizedBox(height: 15),
            BlocProvider(
              create: (context) =>
                  getIt<ExamCubit>()..getExamBySubject(subjectId),
              child: BlocBuilder<ExamCubit, ExamState>(
                builder: (context, state) {
                  if (state is ExamLoading) {
                    return ExamItemLoading();
                  } else if (state is ExamError) {
                    return Text(state.exception.toString());
                  } else if (state is ExamSuccess) {
                    if (state.exams.isEmpty) {
                      return EmptyDataWidget(
                        title: AppLocalizations.of(context)!.noExamsAvailable,
                        imageUrl: Assets.imagesNoData,
                      );
                    }
                    return ExamList(exams: state.exams, subjectImage: subjectImage);
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
