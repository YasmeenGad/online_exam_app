import '../../data/api/models/request/email_verification_model.dart';

class EmailVerificationEntity {
  final String? resetCode;

  EmailVerificationEntity({
    required this.resetCode,
  });

   EmailVerificationModel toModel() {
    return EmailVerificationModel(
      resetCode: resetCode,
    );
   }
}