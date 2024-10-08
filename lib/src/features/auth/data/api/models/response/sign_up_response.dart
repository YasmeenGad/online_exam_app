class SignUpResponse {
  final String? token;
  final String? message;

  SignUpResponse({
    this.token,
    this.message,
  });

  factory SignUpResponse.fromJson(Map<String, dynamic> json) {
    return SignUpResponse(
      token: json['token'],
      message: json['message'],
    );
  }
}