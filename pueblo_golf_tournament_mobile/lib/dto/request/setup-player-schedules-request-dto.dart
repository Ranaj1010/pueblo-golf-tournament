import 'package:json_annotation/json_annotation.dart';

import '../model/tee-time-schedule-dto.dart';

part 'setup-player-schedules-request-dto.g.dart';

@JsonSerializable()
class SetupPlayerSchedulesRequestDto {
  final int playerId;
  final List<TeeTimeScheduleDto> teeTimeSchedules;

  factory SetupPlayerSchedulesRequestDto.fromJson(Map<String, dynamic> json) =>
      _$SetupPlayerSchedulesRequestDtoFromJson(json);

  SetupPlayerSchedulesRequestDto(
      {required this.playerId, required this.teeTimeSchedules});
  Map<String, dynamic> toJson() => _$SetupPlayerSchedulesRequestDtoToJson(this);
}
