// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lookup-scorer-profile-response-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LookupScorerProfileResponseDto _$LookupScorerProfileResponseDtoFromJson(
        Map<String, dynamic> json) =>
    LookupScorerProfileResponseDto(
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => ScorerProfile.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LookupScorerProfileResponseDtoToJson(
        LookupScorerProfileResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

ScorerProfile _$ScorerProfileFromJson(Map<String, dynamic> json) =>
    ScorerProfile(
      person: json['person'] == null
          ? null
          : PersonDto.fromJson(json['person'] as Map<String, dynamic>),
      scorer: json['scorer'] == null
          ? null
          : ScorerDto.fromJson(json['scorer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ScorerProfileToJson(ScorerProfile instance) =>
    <String, dynamic>{
      'person': instance.person,
      'scorer': instance.scorer,
    };
