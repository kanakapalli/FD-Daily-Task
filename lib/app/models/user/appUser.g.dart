// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appUser.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppUser _$$_AppUserFromJson(Map<String, dynamic> json) => _$_AppUser(
      role: json['role'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      username: json['username'] as String?,
    );

Map<String, dynamic> _$$_AppUserToJson(_$_AppUser instance) =>
    <String, dynamic>{
      'role': instance.role,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'username': instance.username,
    };
