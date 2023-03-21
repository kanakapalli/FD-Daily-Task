import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'appUser.freezed.dart';
part 'appUser.g.dart';

@freezed
class AppUser with _$AppUser {
  @JsonSerializable(explicitToJson: true)
  const factory AppUser({
    // @JsonKey(name: 'id') int? id,
    String? role,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    String? username,

  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);
}

