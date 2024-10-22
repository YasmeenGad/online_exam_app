class SignInResponse {
  final String? token;
  final String? message;

  SignInResponse({
    this.token,
    this.message,
  });

  factory SignInResponse.fromJson(Map<String, dynamic> json) {
    return SignInResponse(
      token: json['token'],
      message: json['message'],
    );
  }
}