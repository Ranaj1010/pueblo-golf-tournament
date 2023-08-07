// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setup-tournament-schedules-request-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetupTournamentSchedulesRequestDto _$SetupTournamentSchedulesRequestDtoFromJson(
        Map<String, dynamic> json) =>
    SetupTournamentSchedulesRequestDto(
      tournamentId: json['tournamentId'] as int,
      schedules: (json['schedules'] as List<dynamic>)
          .map((e) => ScheduleDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SetupTournamentSchedulesRequestDtoToJson(
        SetupTournamentSchedulesRequestDto instance) =>
    <String, dynamic>{
      'tournamentId': instance.tournamentId,
      'schedules': instance.schedules,
    };

ScheduleDto _$ScheduleDtoFromJson(Map<String, dynamic> json) => ScheduleDto(
      date: DateTime.parse(json['date'] as String),
      timeSeries: (json['timeSeries'] as List<dynamic>)
          .map((e) => TimeSlotDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ScheduleDtoToJson(ScheduleDto instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'timeSeries': instance.timeSeries,
    };

TimeSlotDto _$TimeSlotDtoFromJson(Map<String, dynamic> json) => TimeSlotDto(
      timeSeriesSlot: DateTime.parse(json['timeSeriesSlot'] as String),
      isEnabled: json['isEnabled'] as bool,
      isSelected: json['isSelected'] as bool,
    );

Map<String, dynamic> _$TimeSlotDtoToJson(TimeSlotDto instance) =>
    <String, dynamic>{
      'timeSeriesSlot': instance.timeSeriesSlot.toIso8601String(),
      'isEnabled': instance.isEnabled,
      'isSelected': instance.isSelected,
    };
