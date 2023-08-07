import 'package:json_annotation/json_annotation.dart';
import 'package:pueblo_golf_tournament_mobile/base/base-dto.dart';

part 'tee-time-schedule-dto.g.dart';

@JsonSerializable()
class TeeTimeScheduleDto extends BaseDto {
  final int tournamentId;
  final DateTime dateTimeSlot;
  final bool isSelected;
  final bool isFull;
  final bool isEnabled;
  TeeTimeScheduleDto(
      {required this.tournamentId,
      required this.dateTimeSlot,
      required this.isSelected,
      required this.isFull,
      required this.isEnabled,
      required super.id});

  factory TeeTimeScheduleDto.fromJson(Map<String, dynamic> json) =>
      _$TeeTimeScheduleDtoFromJson(json);
  Map<String, dynamic> toJson() => _$TeeTimeScheduleDtoToJson(this);
}
