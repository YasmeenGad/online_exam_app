// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditProfileResponseDto _$EditProfileResponseDtoFromJson(
        Map<String, dynamic> json) =>
    EditProfileResponseDto(
      message: json['message'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EditProfileResponseDtoToJson(
        EditProfileResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'user': instance.user,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      Id: json['_id'] as String?,
      username: json['username'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      role: json['role'] as String?,
      password: json['password'] as String?,
      isVerified: json['isVerified'] as bool?,
      createdAt: json['createdAt'] as String?,
      passwordChangedAt: json['passwordChangedAt'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      '_id': instance.Id,
      'username': instance.username,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
      'role': instance.role,
      'password': instance.password,
      'isVerified': instance.isVerified,
      'createdAt': instance.createdAt,
      'passwordChangedAt': instance.passwordChangedAt,
    };
