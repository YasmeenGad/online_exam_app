class EmailVerificationResponse {
  final String? message;
  final String? status;


  EmailVerificationResponse({
    required this.message,
   required this.status,
  });

  factory EmailVerificationResponse.fromJson(Map<String, dynamic> json) {
    return EmailVerificationResponse(
      message: json['message'],
      status: json['status'],
    );
  }


}
