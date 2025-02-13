import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/src/core/utils/errors/result.dart';
import 'package:online_exam_app/src/features/exam/data/data_sources/contracts/exam_offline_datasource.dart';
import 'package:online_exam_app/src/features/exam/domain/entities/subject_entity.dart';
import 'package:online_exam_app/src/features/exam/domain/use_case/exam_use_case.dart';
import '../../../../../core/di/di.dart';
import '../../../../../core/utils/errors/app_exception.dart';
import '../../../../auth/data/data_sources/contracts/offline_auth_datasource.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'subject_state.dart';

@injectable
class SubjectCubit extends Cubit<SubjectState> {
  final ExamUseCase _examUseCase;

  SubjectCubit(this._examUseCase) : super(SubjectInitial());
  var offlineAuthDataSource = getIt<OfflineAuthDataSource>();
  var examOfflineDataSource = getIt<ExamOfflineDatasource>();
  List<Subject> allSubjects = [];

  static SubjectCubit get(context) => BlocProvider.of(context);
  TextEditingController searchController = TextEditingController();

  void doAction(SubjectActions action) {
    switch (action) {
      case GetAllSubjects():
        {
          _getAllSubjects(action.context);
          break;
        }
      case SearchByName():
        {
          _searchByName(searchController.text);
          break;
        }
    }
  }

  void _getAllSubjects(BuildContext context) async {
    emit(SubjectLoading());
    String? token = await offlineAuthDataSource.getToken();
    final result = await _examUseCase.getSubjects(token!);

    switch (result) {
      case Success<List<Subject>>():
        allSubjects = result.data!;
        emit(SubjectSuccess(allSubjects));
       await examOfflineDataSource.cacheSubjects(allSubjects);
        break;
      case Failure<List<Subject>>():
        final exception = result.exception;
        final String massage;
        {
          if (exception is NoInternetException) {
            massage = "${AppLocalizations.of(context)?.noInternetException}";
            emit(SubjectError(massage));
          } else if (exception is ServerError) {
            massage = "${AppLocalizations.of(context)?.serverErrorException}";
            emit(SubjectError(massage));
          } else {
           massage = "${AppLocalizations.of(context)?.unknownErrorException}";
            emit(SubjectError(massage));
          }
          break;
        }
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
