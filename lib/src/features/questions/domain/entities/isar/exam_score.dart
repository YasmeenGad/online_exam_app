class ExamScore {
  final int correctAnswers;
  final int incorrectAnswers;
  final double percentage;
  final String examId;

  ExamScore({
    required this.examId,
    required this.correctAnswers,
    required this.incorrectAnswers,
    required this.percentage,
  });
}
