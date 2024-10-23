part of 'subject_cubit.dart';

@immutable
sealed class SubjectState {}
enum SubjectActions { GetAllSubjects, SearchByName }

final class SubjectInitial extends SubjectState {}

final class SubjectLoading extends SubjectState {}

final class SubjectSuccess extends SubjectState {
  final List<Subject> subjects;

  SubjectSuccess(this.subjects);
}

final class SubjectError extends SubjectState {
  final Exception exception;

  SubjectError(this.exception);
}
