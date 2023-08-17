// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register-scorer-response-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterScorerResponseDto _$RegisterScorerResponseDtoFromJson(
        Map<String, dynamic> json) =>
    RegisterScorerResponseDto(
      data: json['data'] == null
          ? null
          : ScorerProfile.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String,
    );

Map<String, dynamic> _$RegisterScorerResponseDtoToJson(
        RegisterScorerResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
