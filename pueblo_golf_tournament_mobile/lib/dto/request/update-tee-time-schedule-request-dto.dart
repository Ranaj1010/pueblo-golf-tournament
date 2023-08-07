import 'package:json_annotation/json_annotation.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/player-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/tee-time-schedule-dto.dart';

part 'update-tee-time-schedule-request-dto.g.dart';

@JsonSerializable()
class UpdateTeeTimeScheduleRequestDto {
  final TeeTimeScheduleDto teeTimeSchedule;

  UpdateTeeTimeScheduleRequestDto({required this.teeTimeSchedule});

  factory UpdateTeeTimeScheduleRequestDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateTeeTimeScheduleRequestDtoFromJson(json);
  Map<String, dynamic> toJson() =>
      _$UpdateTeeTimeScheduleRequestDtoToJson(this);
}
