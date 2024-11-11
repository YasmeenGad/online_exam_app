import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam_app/src/core/di/di.dart';
import 'package:online_exam_app/src/core/routes/routes_name.dart';
import 'package:online_exam_app/src/core/styles/app_colors.dart';
import 'package:online_exam_app/src/features/questions/presentation/cubit/questions_action.dart';
import 'package:online_exam_app/src/features/questions/presentation/cubit/questions_view_model.dart';
import 'package:online_exam_app/src/features/questions/presentation/widgets/time_out_dialog.dart';

import '../../domain/entities/request/check_question_request_entity.dart';
import '../../domain/entities/response/question_response_entity.dart';
import '../cubit/questions_states.dart';
import '../widgets/no_questions_view.dart';
import '../widgets/question_argument.dart';
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
  late QuestionsViewModel _questionsViewModel;
  int _currentQuestionIndex = 0;
  List<QuestionsEntity> _questions = [];
  List<AnswersEntity> _answers = [];
  Timer? _timer;
  int _timeRemaining = 0;
  int _examDuration = 0;
  bool _isTimerStarted = false;
  String? _selectedAnswer;

  @override
  void initState() {
    super.initState();
    _questionsViewModel = getIt<QuestionsViewModel>();
    _questionsViewModel
        .doAction(GetQuestionsAction(context: context, examId: widget.examId));
  }

  void _startTimer() {
    if (!_isTimerStarted) {
      _isTimerStarted = true;
      _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
        if (!mounted) {
          t.cancel();
          return;
        }

        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            setState(() {
              if (_timeRemaining > 0) {
                _timeRemaining--;
              } else {
                _timer?.cancel();
                buildTimeOutDialog(context, widget.examId);
              }
            });
          }
        });
      });
    }
  }

  void _onAnswerSelected(String? answer) {
    setState(() {
      _selectedAnswer = answer;
    });
  }

  void _saveCurrentAnswer() {
    if (_selectedAnswer != null &&
        _currentQuestionIndex >= 0 &&
        _currentQuestionIndex < _questions.length) {
      final currentQuestion = _questions[_currentQuestionIndex];
      final answerEntity = AnswersEntity(
        questionId: currentQuestion.Id,
        correct: _selectedAnswer,
      );

      final index =
          _answers.indexWhere((a) => a.questionId == currentQuestion.Id);
      if (index >= 0) {
        _answers[index] = answerEntity;
      } else {
        _answers.add(answerEntity);
      }
    }
  }

  void _onNextQuestion() async {
    _saveCurrentAnswer();
    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        _selectedAnswer = null;
      });
    } else {
      final request = CheckQuestionRequestEntity(
        answers: _answers,
      );

      _questionsViewModel
          .doAction(CheckQuestionAction(request: request, context: context));
    }
  }

  void _onPreviousQuestion() {
    if (_currentQuestionIndex > 0) {
      setState(() {
        _currentQuestionIndex--;
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Widget _buildQuestionView(QuestionsState state) {
    if (state is GetQuestionsSuccess) {
      _questions = state.questionResponseEntity.questions ?? [];
      _examDuration = _questions.isNotEmpty
          ? (state.questionResponseEntity.questions?.first.exam?.duration ?? 0)
          : 0;

      if (!_isTimerStarted && _questions.isNotEmpty) {
        _timeRemaining = _examDuration * 60;
        _startTimer();
      }

      if (_questions.isEmpty) {
        return NoQuestionsView(onBackPressed: () => Navigator.pop(context));
      }

      return Padding(
        padding: const EdgeInsets.only(top: 56, left: 16, right: 16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: TimerDisplay(
                time:
                    '${(_timeRemaining ~/ 60).toString().padLeft(2, '0')}:${(_timeRemaining % 60).toString().padLeft(2, '0')}',
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 20),
                  QuestionIndicator(
                    currentQuestionIndex: _currentQuestionIndex,
                    totalQuestions: _questions.length,
                  ),
                  const SizedBox(height: 28),
                  Flexible(
                    child: QuestionCard(
                      question: _questions[_currentQuestionIndex],
                      selectedAnswer: _selectedAnswer,
                      onAnswerSelected: _onAnswerSelected,
                    ),
                  ),
                  const SizedBox(height: 64),
                  QuestionNavigationButtons(
                    onPrevious: _onPreviousQuestion,
                    onNext: _onNextQuestion,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    if (state is GetQuestionsError) {
      return Center(child: Text('Error: ${state.message}'));
    }
    if (state is GetQuestionsLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return const Center(child: CircularProgressIndicator());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: BlocProvider(
        create: (context) => _questionsViewModel,
        child: BlocBuilder<QuestionsViewModel, QuestionsState>(
          builder: (context, state) {
            if (state is CheckQuestionSuccess) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (mounted) {
                  Navigator.pushReplacementNamed(
                    context,
                    RoutesName.examScoreView,
                    arguments: questionsArguments(
                      correctScore:
                          state.checkQuestionResponseEntity.correct.toString(),
                      incorrectScore:
                          state.checkQuestionResponseEntity.wrong.toString(),
                      totalScore:
                          state.checkQuestionResponseEntity.total.toString(),
                      examId: widget.examId,
                    ),
                  );
                }
              });
            }

            return _buildQuestionView(state);
          },
        ),
      ),
    );
  }
}

// class QuestionsView extends StatefulWidget {
//   const QuestionsView({super.key, required this.examId});
//
//   final String examId;
//
//   @override
//   State<QuestionsView> createState() => _QuestionsViewState();
// }
//
// class _QuestionsViewState extends State<QuestionsView> {
//   late QuestionsViewModel _questionsViewModel;
//   int _currentQuestionIndex = 0;
//   List<QuestionsEntity> _questions = [];
//   List<AnswersEntity> _answers = [];
//   Timer? _timer;
//   int _timeRemaining = 0;
//   int _examDuration = 0;
//   bool _isTimerStarted = false;
//   String? _selectedAnswer;
//
//   @override
//   void initState() {
//     super.initState();
//     _questionsViewModel = getIt<QuestionsViewModel>();
//     _questionsViewModel.doAction(
//         GetQuestionsAction(context: context, examId: widget.examId));
//   }
//
//   void _startTimer() {
//     if (!_isTimerStarted) {
//       _isTimerStarted = true;
//       _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
//         if (mounted) {
//           WidgetsBinding.instance.addPostFrameCallback((_) {
//             setState(() {
//               if (_timeRemaining > 0) {
//                 _timeRemaining--;
//               } else {
//                 _timer?.cancel();
//                 buildTimeOutDialog(context, widget.examId);
//               }
//             });
//           });
//         }
//       });
//     }
//   }
//
//   void _onAnswerSelected(String? answer) {
//     setState(() {
//       _selectedAnswer = answer;
//     });
//   }
//
//   void _saveCurrentAnswer() {
//     if (_selectedAnswer != null && _currentQuestionIndex >= 0 &&
//         _currentQuestionIndex < _questions.length) {
//       final currentQuestion = _questions[_currentQuestionIndex];
//
//     //  _questionsViewModel.saveQuestions(_questions);
//
//       final answerEntity = AnswersEntity(
//         questionId: currentQuestion.Id,
//         correct: _selectedAnswer,
//       );
//
//       final index = _answers.indexWhere((a) =>
//       a.questionId == currentQuestion.Id);
//       if (index >= 0) {
//         _answers[index] = answerEntity;
//       } else {
//         _answers.add(answerEntity);
//       }
//     }
//   }
//
//   void _onNextQuestion() async {
//     _saveCurrentAnswer();
//     if (_currentQuestionIndex < _questions.length - 1) {
//       setState(() {
//         _currentQuestionIndex++;
//         _selectedAnswer = null;
//       });
//     } else {
//       _questionsViewModel.printSavedQuestions();
//       _questionsViewModel.printSavedCheckQuestionResponse();
//       _questionsViewModel.getSavedQuestions();
//       _questionsViewModel.getSavedCheckQuestionResponse();
//
//       final request = CheckQuestionRequestEntity(
//         answers: _answers,
//       );
//
//       _questionsViewModel.doAction(
//           CheckQuestionAction(request: request, context: context));
//     }
//   }
//
//   void _onPreviousQuestion() {
//     if (_currentQuestionIndex > 0) {
//       setState(() {
//         _currentQuestionIndex--;
//       });
//     }
//   }
//
//   @override
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }
//
//   Widget _buildQuestionView(QuestionsState state) {
//     if (state is GetQuestionsSuccess) {
//       _questions = state.questionResponseEntity.questions ?? [];
//       _examDuration = _questions.isNotEmpty
//           ? (state.questionResponseEntity.questions?.first.exam?.duration ?? 0)
//           : 0;
//
//       if (!_isTimerStarted && _questions.isNotEmpty) {
//         _timeRemaining = _examDuration * 60;
//         _startTimer();
//       }
//
//       if (_questions.isEmpty) {
//         return NoQuestionsView(onBackPressed: () => Navigator.pop(context));
//       }
//
//       return Padding(
//         padding: const EdgeInsets.only(top: 56, left: 16, right: 16),
//         child: CustomScrollView(
//           slivers: [
//             SliverToBoxAdapter(
//               child: TimerDisplay(
//                 time: '${(_timeRemaining ~/ 60).toString().padLeft(
//                     2, '0')}:${(_timeRemaining % 60).toString().padLeft(2, '0')}',
//               ),
//             ),
//             SliverToBoxAdapter(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   const SizedBox(height: 20),
//                   QuestionIndicator(
//                     currentQuestionIndex: _currentQuestionIndex,
//                     totalQuestions: _questions.length,
//                   ),
//                   const SizedBox(height: 28),
//                   Flexible(
//                     child: QuestionCard(
//                       question: _questions[_currentQuestionIndex],
//                       selectedAnswer: _selectedAnswer,
//                       onAnswerSelected: _onAnswerSelected,
//                     ),
//                   ),
//                   const SizedBox(height: 64),
//                   QuestionNavigationButtons(
//                     onPrevious: _onPreviousQuestion,
//                     onNext: _onNextQuestion,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       );
//     }
//
//     if (state is GetQuestionsError) {
//       return ErrorWidget(state.message);
//     }
//
//     return const Center(child: CircularProgressIndicator());
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.whiteColor,
//       body: BlocProvider(
//         create: (context) => _questionsViewModel,
//         child: BlocBuilder<QuestionsViewModel, QuestionsState>(
//           builder: (context, state) {
//             if (state is CheckQuestionSuccess) {
//               if (mounted) {
//                 Future.delayed(const Duration(milliseconds: 500), () {
//                   if (mounted) {
//                     Navigator.pushReplacementNamed(
//                       context,
//                       RoutesName.examScoreView,
//                       arguments: questionsArguments(
//                         correctScore: state.checkQuestionResponseEntity.correct.toString(),
//                         incorrectScore: state.checkQuestionResponseEntity.wrong.toString(),
//                         totalScore: state.checkQuestionResponseEntity.total.toString(),
//                         examId: widget.examId,
//                       ),
//                     );
//                   }
//                 });
//               }
//             }
//
//             return _buildQuestionView(state);
//           },
//         ),
//       ),
//     );
//   }
// }
//
