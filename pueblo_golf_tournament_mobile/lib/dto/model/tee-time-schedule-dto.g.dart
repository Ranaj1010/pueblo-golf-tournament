// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tee-time-schedule-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeeTimeScheduleDto _$TeeTimeScheduleDtoFromJson(Map<String, dynamic> json) =>
    TeeTimeScheduleDto(
      tournamentId: json['tournamentId'] as int,
      dateTimeSlot: DateTime.parse(json['dateTimeSlot'] as String),
      isSelected: json['isSelected'] as bool,
      isFull: json['isFull'] as bool,
      isEnabled: json['isEnabled'] as bool,
      id: json['id'] as int,
    );

Map<String, dynamic> _$TeeTimeScheduleDtoToJson(TeeTimeScheduleDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tournamentId': instance.tournamentId,
      'dateTimeSlot': instance.dateTimeSlot.toIso8601String(),
      'isSelected': instance.isSelected,
      'isFull': instance.isFull,
      'isEnabled': instance.isEnabled,
    };
