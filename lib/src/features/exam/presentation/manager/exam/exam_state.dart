part of 'exam_cubit.dart';

@immutable
sealed class ExamState {}
sealed  class examAction {}


class getExamBySubject extends examAction {
  final String subjectId;
  final BuildContext context;


  getExamBySubject(this.subjectId , this.context);
}
class getExamDetails extends examAction {
  final String examId;
  final BuildContext context;


  getExamDetails(this.examId , this.context );
}

final class ExamInitial extends ExamState {}

final class ExamLoading extends ExamState {}

final class ExamError extends ExamState {
  final String message;

  ExamError(this.message);
}

final class ExamSuccess extends ExamState {
  final List<Exams> exams;

  ExamSuccess(this.exams);
}

final class ExamDetailsSuccess extends ExamState {
  final Exams exam;

  ExamDetailsSuccess(this.exam);
}

final class ExamDetailsLoading extends ExamState {}

final class ExamDetailsError extends ExamState {
  final String message;

  ExamDetailsError(this.message);
}
