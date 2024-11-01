import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:online_exam_app/src/core/utils/errors/result.dart';
import '../../../../../core/di/di.dart';
import '../../../../auth/data/datasources/contracts/offline_auth_datasource.dart';
import '../../../data/data_sources/contracts/exam_offline_datasource.dart';
import '../../../domain/entities/exam_entity.dart';
import '../../../domain/use_case/exam_use_case.dart';

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
          _getExamBySubject(action.subjectId);
          break;
        }
      case getExamDetails():
        {
          _getExamDetails(action.examId);
          break;
        }
    }

  }

  void _getExamBySubject(String subjectId) async {
    emit(ExamLoading());
    String? token = await offlineAuthDataSource.getToken();
    final result = await _examUseCase.getExamsById(token!, subjectId);

    switch (result) {
      case Success():
        emit(ExamSuccess(result.data!));
        await examOfflineDataSource.cacheExams(result.data!);
        break;
      case Failure():
        emit(ExamError(result.exception!));
        break;
    }
  }


  void _getExamDetails(String examId) async {
    emit(ExamDetailsLoading());
    String? token = await offlineAuthDataSource.getToken();
    final result = await _examUseCase.getExamDetails(examId, token!);

    switch (result) {
      case Success():
        emit(ExamDetailsSuccess(result.data!));
        await examOfflineDataSource.cacheExam(result.data!);
        break;
      case Failure():
        emit(ExamDetailsError(result.exception!));
        break;
    }
  }
}
