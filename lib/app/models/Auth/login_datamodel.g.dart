// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_datamodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoginResponse _$$_LoginResponseFromJson(Map<String, dynamic> json) =>
    _$_LoginResponse(
      status: json['status'] as String?,
      message: json['message'] as String?,
      token: json['token'] as String?,
      userDetails: json['user_details'] == null
          ? null
          : AppUser.fromJson(json['user_details'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_LoginResponseToJson(_$_LoginResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'token': instance.token,
      'user_details': instance.userDetails?.toJson(),
    };
