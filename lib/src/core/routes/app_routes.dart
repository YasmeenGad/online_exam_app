import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:online_exam_app/src/core/global/layout.dart';
import 'package:online_exam_app/src/core/routes/routes_name.dart';
import 'package:online_exam_app/src/features/auth/presentation/views/forget_password_view.dart';
import 'package:online_exam_app/src/features/auth/presentation/views/login_view.dart';
import 'package:online_exam_app/src/features/auth/presentation/views/signup_view.dart';
import 'package:online_exam_app/src/features/auth/presentation/views/welcome_view.dart';
import 'package:online_exam_app/src/features/exam/presentation/views/exam_details_view.dart';
import 'package:online_exam_app/src/features/profile/presentation/views/profile_view.dart';
import 'package:online_exam_app/src/features/profile/presentation/views/reset_password_profile_view.dart';
import 'package:online_exam_app/src/features/questions/presentation/views/questions_view.dart';
import 'package:online_exam_app/src/features/results/presentation/widget/questions_card.dart';
import '../../features/auth/presentation/views/email_verification_view.dart';
import '../../features/auth/presentation/views/reset_password_view.dart';
import '../../features/exam/presentation/views/exam_view.dart';
import '../../features/exam/presentation/views/subjects_view.dart';
import '../../features/exam/presentation/widgets/exam_argument.dart';
import '../../features/questions/presentation/widgets/question_argument.dart';
import '../../features/results/presentation/view/answer_view.dart';
import '../../features/splash/view/splash_view.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      RoutesName.loginView: (context) => const LoginView(),
      RoutesName.signUpView: (context) => const SignUpView(),
      RoutesName.forgetPasswordView: (context) => const ForgetPasswordView(),
      RoutesName.emailVerificationView: (context) {
        final arguments = ModalRoute.of(context)!.settings.arguments as String;
        return EmailVerificationView(
          email: arguments,
        );
      },
      RoutesName.resetPasswordView: (context) => const ResetPasswordView(),
      RoutesName.welcomeView: (context) => WelcomeView(),
      RoutesName.bottomNavigationBar: (context) => Layout(),
      RoutesName.profileView: (context) => ProfileView(),
      RoutesName.resetPasswordProfileView: (context) =>
          ResetPasswordProfileView(),
      RoutesName.examView: (context) {
        final arguments =
            ModalRoute.of(context)!.settings.arguments as ExamArguments;
        return ExamView(
          subjectId: arguments.id!,
          subjectImage: arguments.subjectImage!,
        );
      },
      RoutesName.splashView: (context) => SplashView(),
      RoutesName.examDetailView: (context) {
        final arguments =
            ModalRoute.of(context)!.settings.arguments as ExamArguments;
        return ExamDetailsView(
          examId: arguments.id!,
          subjectImage: arguments.subjectImage!,
            );
      },
      RoutesName.questionsView: (context) => QuestionsView(
            examId: ModalRoute.of(context)!.settings.arguments as String,
          // attemptId: ModalRoute.of(context)!.settings.arguments as String,
          ),
      RoutesName.subjectView: (context) => SubjectsView(),
      RoutesName.questionsCard: (context) => QuestionsCard(),
      RoutesName.answerView: (context) => AnswerView(
          ),

    };
  }
}
