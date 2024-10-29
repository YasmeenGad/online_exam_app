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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['info'] = info;
    return data;
  }
}