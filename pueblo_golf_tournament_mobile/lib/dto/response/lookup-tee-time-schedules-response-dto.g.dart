// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lookup-tee-time-schedules-response-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LookupTeeTimeScheduleResponse _$LookupTeeTimeScheduleResponseFromJson(
        Map<String, dynamic> json) =>
    LookupTeeTimeScheduleResponse(
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>?)
          ?.map(
              (e) => TournamentScheduleDate.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LookupTeeTimeScheduleResponseToJson(
        LookupTeeTimeScheduleResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

TournamentScheduleDate _$TournamentScheduleDateFromJson(
        Map<String, dynamic> json) =>
    TournamentScheduleDate(
      timeSchedules: (json['timeSchedules'] as List<dynamic>?)
          ?.map((e) => TeeTimeScheduleDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$TournamentScheduleDateToJson(
        TournamentScheduleDate instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'timeSchedules': instance.timeSchedules,
    };
