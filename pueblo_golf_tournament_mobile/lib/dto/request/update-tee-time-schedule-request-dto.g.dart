// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update-tee-time-schedule-request-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateTeeTimeScheduleRequestDto _$UpdateTeeTimeScheduleRequestDtoFromJson(
        Map<String, dynamic> json) =>
    UpdateTeeTimeScheduleRequestDto(
      teeTimeSchedule: TeeTimeScheduleDto.fromJson(
          json['teeTimeSchedule'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateTeeTimeScheduleRequestDtoToJson(
        UpdateTeeTimeScheduleRequestDto instance) =>
    <String, dynamic>{
      'teeTimeSchedule': instance.teeTimeSchedule,
    };
