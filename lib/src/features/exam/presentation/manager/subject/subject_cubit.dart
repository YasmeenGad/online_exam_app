import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/src/core/utils/errors/result.dart';
import 'package:online_exam_app/src/features/exam/domain/entities/subject_entity.dart';
import 'package:online_exam_app/src/features/exam/domain/use_case/exam_use_case.dart';

import '../../../../../core/di/di.dart';
import '../../../../auth/data/datasources/contracts/offline_auth_datasource.dart';

part 'subject_state.dart';

@injectable
class SubjectCubit extends Cubit<SubjectState> {
  final ExamUseCase _examUseCase;

  SubjectCubit(this._examUseCase) : super(SubjectInitial());
  var offlineAuthDataSource = getIt<OfflineAuthDataSource>();
  List<Subject> allSubjects = [];

  static SubjectCubit get(context) => BlocProvider.of(context);
  TextEditingController searchController = TextEditingController();

  void doAction(SubjectActions action) async {
    switch (action) {
      case SubjectActions.GetAllSubjects:
        {
          _getAllSubjects();
          break;
        }
      case SubjectActions.SearchByName:
        {
          _searchByName(searchController.text);
          break;
        }
    }
  }

  void _getAllSubjects() async {
    emit(SubjectLoading());
    String? token = await offlineAuthDataSource.getToken();
    final result = await _examUseCase.getSubjects(token!);

    switch (result) {
      case Success():
        allSubjects = result.data!;
        emit(SubjectSuccess(allSubjects));
        break;
      case Failure():
        emit(SubjectError(result.exception!));
        break;
    }
  }

  void _searchByName(String query) {
    if (query.isEmpty) {
      emit(SubjectSuccess(allSubjects));
    } else {
      final filteredSubjects = allSubjects.where((subject) {
        return subject.name!.toLowerCase().contains(query.toLowerCase());
      }).toList();
      emit(SubjectSuccess(filteredSubjects));
    }
  }
}
