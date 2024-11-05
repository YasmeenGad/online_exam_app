part of 'subject_cubit.dart';

@immutable
sealed class SubjectState {}
sealed  class SubjectActions {}
class GetAllSubjects extends SubjectActions {
  BuildContext context;
  GetAllSubjects({required this.context});
}

class SearchByName extends SubjectActions {}
final class SubjectInitial extends SubjectState {}

final class SubjectLoading extends SubjectState {}

final class SubjectSuccess extends SubjectState {
  final List<Subject> subjects;

  SubjectSuccess(this.subjects);
}

final class SubjectError extends SubjectState {
  final String message;

  SubjectError(this.message);
}
