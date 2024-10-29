import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/src/features/exam/presentation/widgets/build_success_widget.dart';
import '../../../../core/di/di.dart';
import '../manager/subject/subject_cubit.dart';
import '../widgets/subject_loading.dart';


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
                return SubjectLoadingWidget();
              } else if (state is SubjectError) {
                return Center(child: Text(state.exception.toString()));
              } else if (state is SubjectSuccess) {
                return BuildSuccessWidget(subjects: state.subjects);
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }

}
