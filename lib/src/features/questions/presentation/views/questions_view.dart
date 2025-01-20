import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/src/core/di/di.dart';
import 'package:online_exam_app/src/core/styles/app_colors.dart';
import 'package:online_exam_app/src/features/questions/presentation/cubit/questions_action.dart';
import 'package:online_exam_app/src/features/questions/presentation/cubit/questions_view_model.dart';
import 'package:online_exam_app/src/features/questions/presentation/views/score_view.dart';
import '../../data/api/models/isar/question_model.dart';
import '../../domain/entities/request/check_question_request_entity.dart';
import '../../domain/entities/response/question_response_entity.dart';
import '../cubit/questions_states.dart';
import '../widgets/no_questions_view.dart';
import '../widgets/question_card.dart';
import '../widgets/question_indicator.dart';
import '../widgets/question_navigation_buttons.dart';
import '../widgets/timer_display.dart';

class QuestionsView extends StatefulWidget {
  const QuestionsView({super.key, required this.examId});

  final String examId;

  @override
  State<QuestionsView> createState() => _QuestionsViewState();
}

class _QuestionsViewState extends State<QuestionsView> {
  late QuestionsViewModel questionsViewModel;
  int currentQuestionIndex = 0;
  late List<QuestionsEntity> questions = [];
  Timer? timer;
  int timeRemaining = 0;
  int examDuration = 0;
  bool isTimerStarted = false;
  String? selectedAnswer;
  List<String?> selectedAnswers = [];

  @override
  void initState() {
    super.initState();
    questionsViewModel = getIt<QuestionsViewModel>();
    questionsViewModel
        .doAction(GetQuestionsAction(context: context, examId: widget.examId));
  }

  void startTimer() {
    isTimerStarted = true;
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {
        if (timeRemaining > 0) {
          timeRemaining--;
        } else {
          timer!.cancel();
        }
      });
    });
  }

  void onAnswerSelected(String? answer) async {
    setState(() {
      selectedAnswer = answer; // تعيين الإجابة المختارة أو null
    });

    // تأكيد إرسال الإجابة للسيرفر
    final answerEntity = AnswersEntity(
      questionId: questions[currentQuestionIndex].Id,
      correct: selectedAnswer, // إرسال null أو الإجابة المختارة
    );

    final checkQuestionRequest = CheckQuestionRequestEntity(
      answers: [answerEntity],
    );

    // إرسال الطلب للسيرفر
    questionsViewModel.doAction(CheckQuestionAction(
      context: context,
      request: checkQuestionRequest,
    ));

    final question = questions[currentQuestionIndex];

    // هنا نقوم بحفظ السؤال مع الإجابة المختارة (التي قد تكون null)
    final questionModel = QuestionModel(
      examId: widget.examId,
      questionId: question.Id ?? '',
      questionText: question.question ?? '',
      questionType: question.type ?? '',
      correctAnswer: question.correct ?? '',
      userAnswer: selectedAnswer,
      // يمكن أن تكون null
      suggestedAnswers: question.answers
              ?.map((suggestedAnswer) =>
                  AnswerModel(answerText: suggestedAnswer.answer ?? ''))
              .toList() ??
          [],
    );

    // حفظ السؤال مع التحقق أولاً
    questionsViewModel.saveQuestion(questionModel);
  }

  void onNextQuestion() async {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedAnswer = null;
      });
    } else {
      var score = await questionsViewModel.getScoreStatistics();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ExamScoreView(
            correctAnswers: score.correctAnswers,
            incorrectAnswers: score.incorrectAnswers,
            percentage: score.percentage,
            examId: score.examId,
          ),
        ),
      );
    }
  }

  void onPreviousQuestion() {
    if (currentQuestionIndex > 0) {
      setState(() {
        currentQuestionIndex--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: BlocProvider(
        create: (context) => questionsViewModel,
        child: BlocBuilder<QuestionsViewModel, QuestionsState>(
          builder: (context, state) {
            if (state is GetQuestionsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GetQuestionsSuccess) {
              questions = state.questionResponseEntity.questions ?? [];
              examDuration = questions.isNotEmpty
                  ? state.questionResponseEntity.questions![0].exam?.duration ??
                      0
                  : 0;

              if (!isTimerStarted && questions.isNotEmpty) {
                timeRemaining = examDuration * 60;
                startTimer();
                isTimerStarted = true;
              }
              if (questions.isEmpty) {
                return NoQuestionsView(
                    onBackPressed: () => Navigator.pop(context));
              }
              return Padding(
                padding: const EdgeInsets.only(top: 56, left: 16, right: 16),
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: TimerDisplay(
                          time:
                              '${(timeRemaining ~/ 60).toString().padLeft(2, '0')}:${(timeRemaining % 60).toString().padLeft(2, '0')}'),
                    ),
                    SliverToBoxAdapter(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 20),
                          QuestionIndicator(
                              currentQuestionIndex: currentQuestionIndex,
                              totalQuestions: questions.length),
                          const SizedBox(height: 28),
                          Flexible(
                            child: QuestionCard(
                              question: questions[currentQuestionIndex],
                              selectedAnswer: selectedAnswer,
                              onAnswerSelected: onAnswerSelected,
                            ),
                          ),
                          const SizedBox(height: 64),
                          QuestionNavigationButtons(
                            onPrevious: onPreviousQuestion,
                            onNext: onNextQuestion,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is CheckQuestionSuccess) {
              // عند نجاح التحقق من السؤال، نقوم بإظهار الحالة بنفس طريقة الـ GetQuestionsSuccess
              return Padding(
                padding: const EdgeInsets.only(top: 56, left: 16, right: 16),
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: TimerDisplay(
                          time:
                              '${(timeRemaining ~/ 60).toString().padLeft(2, '0')}:${(timeRemaining % 60).toString().padLeft(2, '0')}'),
                    ),
                    SliverToBoxAdapter(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 20),
                          QuestionIndicator(
                              currentQuestionIndex: currentQuestionIndex,
                              totalQuestions: questions.length),
                          const SizedBox(height: 28),
                          Flexible(
                            child: QuestionCard(
                              question: questions[currentQuestionIndex],
                              selectedAnswer: selectedAnswer,
                              onAnswerSelected: onAnswerSelected,
                            ),
                          ),
                          const SizedBox(height: 64),
                          QuestionNavigationButtons(
                            onPrevious: onPreviousQuestion,
                            onNext: onNextQuestion,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
