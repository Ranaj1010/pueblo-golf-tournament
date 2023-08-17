// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register-scorer-request-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterScorerRequestDto _$RegisterScorerRequestDtoFromJson(
        Map<String, dynamic> json) =>
    RegisterScorerRequestDto(
      person: ReqisterPersonRequesDto.fromJson(
          json['person'] as Map<String, dynamic>),
      account: RegisterAccountCredentialDto.fromJson(
          json['account'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegisterScorerRequestDtoToJson(
        RegisterScorerRequestDto instance) =>
    <String, dynamic>{
      'person': instance.person,
      'account': instance.account,
    };
