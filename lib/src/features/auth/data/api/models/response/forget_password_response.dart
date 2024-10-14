class ForgetPasswordResponse {
  final String? message;
  final String? info;

  ForgetPasswordResponse({
    this.message,
    this.info,
  });

  factory ForgetPasswordResponse.fromJson(Map<String, dynamic> json) {
    return ForgetPasswordResponse(
      message: json['message'],
      info: json['info'],
    );
  }
}