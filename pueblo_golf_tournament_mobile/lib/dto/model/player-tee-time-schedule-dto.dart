import 'package:json_annotation/json_annotation.dart';
import 'package:pueblo_golf_tournament_mobile/base/base-dto.dart';

part 'player-tee-time-schedule-dto.g.dart';

@JsonSerializable()
class PlayerTeeTimeScheduleDto extends BaseDto {
  final int playerId;
  final int teeTimeScheduleId;
  final int holeType;

  PlayerTeeTimeScheduleDto(
      {required super.id,
      required this.playerId,
      required this.teeTimeScheduleId,
      required this.holeType});

  factory PlayerTeeTimeScheduleDto.fromJson(Map<String, dynamic> json) =>
      _$PlayerTeeTimeScheduleDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PlayerTeeTimeScheduleDtoToJson(this);
}
