import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/src/core/styles/app_styles.dart';
import 'package:online_exam_app/src/features/exam/presentation/widgets/search_field.dart';
import 'package:online_exam_app/src/features/exam/presentation/widgets/subject_list.dart';
import '../../../../core/dependency injection/di.dart';
import '../../../../core/global/dialog.dart';
import '../../../../core/styles/app_colors.dart';
import '../../domain/entities/subject_entity.dart';
import '../manager/subject/subject_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SubjectsView extends StatelessWidget {
  const SubjectsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: BlocProvider(
          create: (context) =>
              getIt<SubjectCubit>()..doAction(SubjectActions.GetAllSubjects),
          child: BlocBuilder<SubjectCubit, SubjectState>(
            builder: (context, state) {
              if (state is SubjectLoading) {
                return loadingIndicator();
              } else if (state is SubjectError) {
                return Center(child: Text(state.exception.toString()));
              } else if (state is SubjectSuccess) {
                return _buildSuccess(context, state.subjects);
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }


  Widget _buildSuccess(BuildContext context, List<Subject> subjects) {
    final localizations = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 60),
        Text(
          '${localizations?.survey}',
          style: AppStyles.styleMedium20(context)
              .copyWith(color: AppColors.blueBaseColor),
        ),
        SizedBox(height: 20),
        SearchField(cubit: SubjectCubit.get(context)),
        SizedBox(height: 30),
        subjects.isEmpty
            ? Center(
                child: Text(
                  '${localizations?.noSubjectsFound}',
                  style: AppStyles.styleMedium16(context),
                ),
              )
            : Text(
                '${localizations?.browseBySubject}',
                style: AppStyles.styleMedium18(context),
              ),
        SizedBox(height: 15),
        SubjectList(subjects: subjects),
      ],
    );
  }
}
