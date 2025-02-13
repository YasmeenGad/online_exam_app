import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:online_exam_app/src/core/utils/errors/result.dart';
import '../../../../../core/di/di.dart';
import '../../../../../core/utils/errors/app_exception.dart';
import '../../../../auth/data/data_sources/contracts/offline_auth_datasource.dart';
import '../../../data/data_sources/contracts/exam_offline_datasource.dart';
import '../../../domain/entities/exams_entity.dart';
import '../../../domain/use_case/exam_use_case.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'exam_state.dart';

@injectable
class ExamCubit extends Cubit<ExamState> {
  final ExamUseCase _examUseCase;

  ExamCubit(this._examUseCase) : super(ExamInitial());

  var offlineAuthDataSource = getIt<OfflineAuthDataSource>();
  var examOfflineDataSource = getIt<ExamOfflineDatasource>();

  static ExamCubit get(context) => BlocProvider.of(context);
  void doAction(examAction action) {
    switch (action) {
      case getExamBySubject():
        {
          _getExamBySubject(action.subjectId , action.context);
          break;
        }
      case getExamDetails():
        {
          _getExamDetails(action.examId , action.context);
          break;
        }
    }

  }

  void _getExamBySubject(String subjectId , BuildContext context) async {
    emit(ExamLoading());
    String? token = await offlineAuthDataSource.getToken();
    final result = await _examUseCase.getExamsById( subjectId ,token!);

    switch (result) {
      case Success():
        emit(ExamSuccess(result.data!));
         examOfflineDataSource.cacheExams(result.data!, subjectId);
        break;
      case Failure():
        final exception = result.exception;
        final String massage;
        {
          if (exception is NoInternetException) {
            massage = "${AppLocalizations.of(context)?.noInternetException}";
            emit(ExamError(massage));
          } else if (exception is ServerError) {
            massage = "${AppLocalizations.of(context)?.serverErrorException}";
            emit(ExamError(massage));
          } else {
            massage = "${AppLocalizations.of(context)?.unknownErrorException}";
            emit(ExamError(massage));
          }
          break;
        }
    }
  }


  void _getExamDetails(String examId , BuildContext context) async {
    emit(ExamDetailsLoading());
    String? token = await offlineAuthDataSource.getToken();
    final result = await _examUseCase.getExamDetails(examId, token!);

    switch (result) {
      case Success():
        emit(ExamDetailsSuccess(result.data!));
        await examOfflineDataSource.cacheExam(result.data!, examId);
        break;
      case Failure():
          final exception = result.exception;
        final String massage;
        {
          if (exception is NoInternetException) {
            massage = "${AppLocalizations.of(context)?.noInternetException}";
            emit(ExamDetailsError(massage));
          } else if (exception is ServerError) {
            massage = "${AppLocalizations.of(context)?.serverErrorException}";
            emit(ExamDetailsError(massage));
          } else {
            massage = "${AppLocalizations.of(context)?.unknownErrorException}";
            emit(ExamDetailsError(massage));
          }
          break;
        }
    }
  }
}
