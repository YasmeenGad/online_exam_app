part of 'exam_cubit.dart';

@immutable
sealed class ExamState {}
sealed  class examAction {}


class getExamBySubject extends examAction {
  final String subjectId;

  getExamBySubject(this.subjectId);
}
class getExamDetails extends examAction {
  final String examId;

  getExamDetails(this.examId);
}

final class ExamInitial extends ExamState {}

final class ExamLoading extends ExamState {}

final class ExamError extends ExamState {
  final Exception exception;

  ExamError(this.exception);
}

final class ExamSuccess extends ExamState {
  final List<Exam> exams;

  ExamSuccess(this.exams);
}

final class ExamDetailsSuccess extends ExamState {
  final Exam exam;

  ExamDetailsSuccess(this.exam);
}

final class ExamDetailsLoading extends ExamState {}

final class ExamDetailsError extends ExamState {
  final Exception exception;

  ExamDetailsError(this.exception);
}
