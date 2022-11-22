import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'credentials.freezed.dart';
part 'credentials.g.dart';

@freezed
class Credentials with _$Credentials {
  const factory Credentials(
      {String? name,
      String? token,
      String? password,
      String? userId}) = _Credentials;

  factory Credentials.fromJson(Map<String, Object?> json) =>
      _$CredentialsFromJson(json);
}
