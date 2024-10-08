class SignUpModel {
  final String? username;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;
  final String? rePassword;
  final String? phone;

  SignUpModel({
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.rePassword,
    this.phone, 
  });

  Map<String, dynamic> toJson() => {
    'username': username,
    'firstName': firstName,
    'lastName': lastName,
    'email': email,
    'password': password,
    'rePassword': rePassword,
    'phone': phone,
  };

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
      username: json['username'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      password: json['password'],
      rePassword: json['rePassword'],
      phone: json['phone'],
    );


  }
  
  }