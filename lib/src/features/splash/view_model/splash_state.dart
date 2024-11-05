part of 'splash_cubit.dart';

@immutable
sealed class SplashState {}

final class SplashInitial extends SplashState {}

class SplashShowFirstText extends SplashState {}
class SplashShowImageAndSecondText extends SplashState {

  SplashShowImageAndSecondText();
}

