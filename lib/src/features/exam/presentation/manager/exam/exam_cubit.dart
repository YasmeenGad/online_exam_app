import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:online_exam_app/src/core/network/result.dart';

import '../../../../../core/dependency injection/di.dart';
import '../../../../auth/data/datasources/contracts/offline_auth_datasource.dart';
import '../../../domain/entities/exam_entity.dart';
import '../../../domain/use_case/exam_use_case.dart';

part 'exam_state.dart';

@injectable
class ExamCubit extends Cubit<ExamState> {
  final ExamUseCase _examUseCase;

  ExamCubit(this._examUseCase) : super(ExamInitial());

  var offlineAuthDataSource = getIt<OfflineAuthDataSource>();

  static ExamCubit get(context) => BlocProvider.of(context);

  void getExamBySubject(String subjectId) async {
    emit(ExamLoading());
    String? token = await offlineAuthDataSource.getToken();
    final result = await _examUseCase.getExamsById(token!, subjectId);

    switch (result) {
      case Success():
        emit(ExamSuccess(result.data!));
        break;
      case Failure():
        emit(ExamError(result.exception!));
        break;
    }
  }
}
