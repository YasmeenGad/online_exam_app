import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/src/core/global/custom_appbar.dart';
import 'package:online_exam_app/src/features/exam/presentation/manager/exam/exam_cubit.dart';
import 'package:online_exam_app/src/features/exam/presentation/widgets/exam_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../core/dependency injection/di.dart';
import '../../../../core/global/dialog.dart';

class ExamView extends StatelessWidget {
  const ExamView({super.key, required this.subjectId});

  final String subjectId;

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
            CustomAppBar(appBarTxt: '${AppLocalizations.of(context)?.exams}', showArrow: true),
            SizedBox(height: 15),
            BlocProvider(
              create: (context) =>
                  getIt<ExamCubit>()..getExamBySubject(subjectId),
              child: BlocBuilder<ExamCubit, ExamState>(
                builder: (context, state) {
                  if (state is ExamLoading) {
                    return loadingIndicator();
                  } else if (state is ExamError) {
                    return Center(
                      child: Text(state.exception.toString()),
                    );
                  } else if (state is ExamSuccess) {
                    return ExamItem(exams: state.exams);
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