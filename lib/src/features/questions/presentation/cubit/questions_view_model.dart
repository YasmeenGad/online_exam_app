import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/src/core/utils/errors/result.dart';
import 'package:online_exam_app/src/features/questions/data/datasource/contracts/offline_datasource/question_offline_data_source.dart';
import 'package:online_exam_app/src/features/questions/domain/entities/request/check_question_request_entity.dart';
import 'package:online_exam_app/src/features/questions/domain/entities/response/check_question_response_entity.dart';
import 'package:online_exam_app/src/features/questions/domain/entities/response/question_response_entity.dart';
import 'package:online_exam_app/src/features/questions/domain/usecase/questions_usecase.dart';
import 'package:online_exam_app/src/features/questions/presentation/cubit/questions_action.dart';
import 'package:online_exam_app/src/features/questions/presentation/cubit/questions_states.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/utils/errors/app_exception.dart';
import '../../../auth/data/data_sources/contracts/offline_auth_datasource.dart';
import '../../data/api/models/isar/question_model.dart';
import '../../data/datasource/contracts/offline_datasource/question_offline_datasource.dart';
import '../../domain/entities/isar/exam_score.dart';

@injectable
class QuestionsViewModel extends Cubit<QuestionsState> {
  final QuestionsUseCase _questionsUseCase;
  final OfflineAuthDataSource offlineAuthDataSource;
  final QuestionOfflineDataSource offlineQuestionsDataSource;
  final QuestionsOfflineDatasource questionOfflineDataSource;

  String? currentAttemptId;

  @factoryMethod
  QuestionsViewModel(
    this._questionsUseCase,
    this.offlineAuthDataSource,
    this.offlineQuestionsDataSource,
    this.questionOfflineDataSource,
  ) : super(QuestionsInitial());

  void doAction(QuestionsAction action) {
    switch (action) {
      case GetQuestionsAction():
        _getQuestions(action.examId, action.context);
        break;
      case CheckQuestionAction():
        _checkQuestions(action.request, action.context);
        break;
    }
  }

  Future<void> _getQuestions(String examId, BuildContext context) async {
    emit(GetQuestionsLoading());
    var token = await offlineAuthDataSource.getToken() ?? "";
    final result = await _questionsUseCase.getQuestions(token, examId);
    switch (result) {
      case Success<QuestionResponseEntity>():
        emit(GetQuestionsSuccess(result.data!));
        questionOfflineDataSource.cacheQuestions(result.data!, examId);
        break;
      case Failure<QuestionResponseEntity>():
        {
          final exception = result.exception;
          String message;
          if (exception is NoInternetException) {
            message = "${AppLocalizations.of(context)?.noInternetException}";
            emit(GetQuestionsError(message));
          } else if (exception is ServerError) {
            message = "${AppLocalizations.of(context)?.serverErrorException}";
            emit(GetQuestionsError(message));
          } else if (exception is UnauthorizedException) {
            message = exception.message ?? "";
            emit(GetQuestionsError(message));
          } else {
            message = "${AppLocalizations.of(context)?.unknownErrorException}";
            emit(GetQuestionsError(message));
          }
          break;
        }
    }
  }

  Future<void> _checkQuestions(
      CheckQuestionRequestEntity request, BuildContext context) async {
    var token = await offlineAuthDataSource.getToken() ?? '';
    var result = await _questionsUseCase.checkQuestions(token, request);

    switch (result) {
      case Success<CheckQuestionResponseEntity>():
        if (!isClosed) emit(CheckQuestionSuccess(result.data!));
        questionOfflineDataSource.cacheCheckQuestions(result.data!);
        break;
      case Failure<CheckQuestionResponseEntity>():
        final exception = result.exception;
        String message;

        if (exception is NoInternetException) {
          message = "${AppLocalizations.of(context)?.noInternetException}";
          if (!isClosed) emit(GetQuestionsError(message));
        } else if (exception is ServerError) {
          message = "${AppLocalizations.of(context)?.serverErrorException}";
          if (!isClosed) emit(GetQuestionsError(message));
        } else if (exception is UnauthorizedException) {
          message = exception.message ?? "";
          if (!isClosed) emit(GetQuestionsError(message));
        } else {
          message = "${AppLocalizations.of(context)?.unknownErrorException}";
          if (!isClosed) emit(GetQuestionsError(message));
        }
        break;
    }
  }

  Future<String> generateNewAttemptId() async {
    currentAttemptId = Uuid().v4();
    return currentAttemptId!;
  }

  Future<void> saveQuestionsWithCurrentAttemptId(
      List<QuestionModel> questions) async {
    if (currentAttemptId == null) {
      await generateNewAttemptId();
    }
    for (var question in questions) {
      await offlineQuestionsDataSource.saveQuestion(
          question, currentAttemptId!);
    }
  }

  Future<List<Map<String, dynamic>>> getAttemptsWithQuestionCount() async {
    return await offlineQuestionsDataSource.getAttemptsWithQuestionCount();
  }

  Future<List<QuestionModel>> getAllQuestionsForAttempt(
      String attemptId) async {
    return await offlineQuestionsDataSource
        .getAllQuestionsForAttempt(attemptId);
  }

  Future<ExamScore> getScoreStatistics(String attemptId) async {
    final questions =
        await offlineQuestionsDataSource.getQuestionsByAttempt(attemptId);

    final correctAnswers =
        questions.where((q) => q.userAnswer == q.correctAnswer).length;

    final incorrectAnswers = questions.length - correctAnswers;

    final percentage =
        (questions.isNotEmpty) ? correctAnswers / questions.length : 0.0;

    final examId = questions.isNotEmpty ? questions.first.examId : '';

    return ExamScore(
      correctAnswers: correctAnswers,
      incorrectAnswers: incorrectAnswers,
      percentage: percentage * 100,
      examId: examId,
    );
  }
}
