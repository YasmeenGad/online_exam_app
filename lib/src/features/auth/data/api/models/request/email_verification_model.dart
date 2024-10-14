import '../../../../domain/entities/email_verification_entity.dart';

class EmailVerificationModel {
  String? resetCode;

  EmailVerificationModel({
      this.resetCode,});



  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['resetCode'] = resetCode;
    return map;
  }

  EmailVerificationEntity toEntity() {
    return EmailVerificationEntity(
      resetCode: resetCode,
    );
  }

}