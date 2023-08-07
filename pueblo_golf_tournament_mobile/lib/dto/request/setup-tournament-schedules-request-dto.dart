import 'package:json_annotation/json_annotation.dart';

part 'setup-tournament-schedules-request-dto.g.dart';

@JsonSerializable()
class SetupTournamentSchedulesRequestDto {
  final int tournamentId;
  final List<ScheduleDto> schedules;

  SetupTournamentSchedulesRequestDto(
      {required this.tournamentId, required this.schedules});

  factory SetupTournamentSchedulesRequestDto.fromJson(
          Map<String, dynamic> json) =>
      _$SetupTournamentSchedulesRequestDtoFromJson(json);
  Map<String, dynamic> toJson() =>
      _$SetupTournamentSchedulesRequestDtoToJson(this);
}

@JsonSerializable()
class ScheduleDto {
  final DateTime date;
  final List<TimeSlotDto> timeSeries;

  ScheduleDto({required this.date, required this.timeSeries});

  factory ScheduleDto.fromJson(Map<String, dynamic> json) =>
      _$ScheduleDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ScheduleDtoToJson(this);
}

@JsonSerializable()
class TimeSlotDto {
  final DateTime timeSeriesSlot;
  final bool isEnabled;
  final bool isSelected;

  TimeSlotDto(
      {required this.timeSeriesSlot,
      required this.isEnabled,
      required this.isSelected});

  factory TimeSlotDto.fromJson(Map<String, dynamic> json) =>
      _$TimeSlotDtoFromJson(json);
  Map<String, dynamic> toJson() => _$TimeSlotDtoToJson(this);
}
