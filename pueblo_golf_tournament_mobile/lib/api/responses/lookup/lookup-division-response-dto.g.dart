// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lookup-division-response-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LookupDivisionResponseDto _$LookupDivisionResponseDtoFromJson(
        Map<String, dynamic> json) =>
    LookupDivisionResponseDto(
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => DivisionDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LookupDivisionResponseDtoToJson(
        LookupDivisionResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
