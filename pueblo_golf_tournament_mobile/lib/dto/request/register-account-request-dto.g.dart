// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register-account-request-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReqisterAccountRequesDto _$ReqisterAccountRequesDtoFromJson(
        Map<String, dynamic> json) =>
    ReqisterAccountRequesDto(
      person: ReqisterPersonRequesDto.fromJson(
          json['person'] as Map<String, dynamic>),
      account: RegisterAccountCredentialDto.fromJson(
          json['account'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReqisterAccountRequesDtoToJson(
        ReqisterAccountRequesDto instance) =>
    <String, dynamic>{
      'person': instance.person,
      'account': instance.account,
    };

RegisterAccountCredentialDto _$RegisterAccountCredentialDtoFromJson(
        Map<String, dynamic> json) =>
    RegisterAccountCredentialDto(
      username: json['username'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$RegisterAccountCredentialDtoToJson(
        RegisterAccountCredentialDto instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };
