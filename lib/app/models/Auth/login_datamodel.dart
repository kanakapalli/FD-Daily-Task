import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../user/appUser.dart';

part 'login_datamodel.freezed.dart';
part 'login_datamodel.g.dart';

@freezed
class LoginResponse with _$LoginResponse {
  
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory LoginResponse({
    String? status,
    String? message,
    String? token,
    @JsonKey(name: 'user_details') AppUser? userDetails,
    // DateTime? modified,
    // @Default(<String>[]) List<String> images,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}
