// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'credentials.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Credentials _$$_CredentialsFromJson(Map<String, dynamic> json) =>
    _$_Credentials(
      name: json['name'] as String?,
      token: json['token'] as String?,
      password: json['password'] as String?,
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$$_CredentialsToJson(_$_Credentials instance) =>
    <String, dynamic>{
      'name': instance.name,
      'token': instance.token,
      'password': instance.password,
      'userId': instance.userId,
    };
