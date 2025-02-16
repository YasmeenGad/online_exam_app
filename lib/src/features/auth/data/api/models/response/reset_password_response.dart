class ResetPasswordResponse {
  final String? token;
  final String? message;

  ResetPasswordResponse({
    this.token,
    this.message,
  });

  factory ResetPasswordResponse.fromJson(Map<String, dynamic> json) {
    return ResetPasswordResponse(
      token: json['token'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    map['message'] = message;
    return map;
  }
}