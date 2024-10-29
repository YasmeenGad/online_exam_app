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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}
