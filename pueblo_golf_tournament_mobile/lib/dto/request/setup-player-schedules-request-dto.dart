import 'package:json_annotation/json_annotation.dart';

import '../model/tee-time-schedule-dto.dart';

part 'setup-player-schedules-request-dto.g.dart';

@JsonSerializable()
class SetupPlayerSchedulesRequestDto {
  final int tournamentId;
  final int playerId;
  final List<TeeTimeSchedulesRequestDto> teeTimeSchedules;

  factory SetupPlayerSchedulesRequestDto.fromJson(Map<String, dynamic> json) =>
      _$SetupPlayerSchedulesRequestDtoFromJson(json);

  SetupPlayerSchedulesRequestDto({
    required this.playerId,
    required this.teeTimeSchedules,
    required this.tournamentId,
  });
  Map<String, dynamic> toJson() => _$SetupPlayerSchedulesRequestDtoToJson(this);
}

@JsonSerializable()
class TeeTimeSchedulesRequestDto {
  final int holeType;
  TeeTimeScheduleDto teeTimeSchedule;

  factory TeeTimeSchedulesRequestDto.fromJson(Map<String, dynamic> json) =>
      _$TeeTimeSchedulesRequestDtoFromJson(json);

  TeeTimeSchedulesRequestDto(
      {required this.holeType, required this.teeTimeSchedule});

  Map<String, dynamic> toJson() => _$TeeTimeSchedulesRequestDtoToJson(this);
}
