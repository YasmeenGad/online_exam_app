part of 'exam_cubit.dart';

@immutable
sealed class ExamState {}

final class ExamInitial extends ExamState {}

final class ExamLoading extends ExamState {}

final class ExamError extends ExamState {
  final Exception exception;

  ExamError(this.exception);
}

final class ExamSuccess extends ExamState {
  final Exam exams;

  ExamSuccess(this.exams);
}
