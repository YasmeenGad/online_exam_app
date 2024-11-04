import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/src/core/utils/errors/result.dart';
import 'package:online_exam_app/src/features/questions/domain/entities/response/question_response_entity.dart';
import 'package:online_exam_app/src/features/questions/domain/usecase/questions_usecase.dart';
import 'package:online_exam_app/src/features/questions/presentation/cubit/questions_action.dart';
import 'package:online_exam_app/src/features/questions/presentation/cubit/questions_states.dart';
import '../../../../core/di/di.dart';
import '../../../../core/utils/errors/app_exception.dart';
import '../../../auth/data/datasources/contracts/offline_auth_datasource.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@injectable
class QuestionsViewModel extends Cubit<QuestionsState> {
  final QuestionsUseCase _questionsUseCase;
  var offlineAuthDataSource = getIt<OfflineAuthDataSource>();

  @factoryMethod
  QuestionsViewModel(this._questionsUseCase) : super(QuestionsInitial());

  void doAction(QuestionsAction action) {
    switch (action) {
      case GetQuestionsAction():
        {
          _getQuestions(action.examId, action.context);
          break;
        }
    }
  }

  Future<void> _getQuestions(String examId, BuildContext context) async {
    emit(GetQuestionsLoading());
    var token = await offlineAuthDataSource.getToken() ?? "";
    final result = await _questionsUseCase.getQuestions(token, examId);
    switch (result) {
      case Success<QuestionResponseEntity>():
        {
          emit(GetQuestionsSuccess(result.data!));
          break;
        }
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
}