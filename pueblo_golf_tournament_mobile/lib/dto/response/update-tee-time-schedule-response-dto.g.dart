// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update-tee-time-schedule-response-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateTeeTimeScheduleResponseDto _$UpdateTeeTimeScheduleResponseDtoFromJson(
        Map<String, dynamic> json) =>
    UpdateTeeTimeScheduleResponseDto(
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : TeeTimeScheduleDto.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateTeeTimeScheduleResponseDtoToJson(
        UpdateTeeTimeScheduleResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
