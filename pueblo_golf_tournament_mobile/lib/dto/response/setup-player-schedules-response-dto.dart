import 'package:json_annotation/json_annotation.dart';
import 'package:pueblo_golf_tournament_mobile/base/base-response.dart';

import '../model/player-tee-time-schedule-dto.dart';

part 'setup-player-schedules-response-dto.g.dart';

@JsonSerializable()
class SetupPlayerSchedulesResponseDto extends BaseResponse {
  final List<PlayerTeeTimeScheduleDto> data;
  SetupPlayerSchedulesResponseDto({
    required super.message,
    required this.data,
  });
  factory SetupPlayerSchedulesResponseDto.fromJson(Map<String, dynamic> json) =>
      _$SetupPlayerSchedulesResponseDtoFromJson(json);
  Map<String, dynamic> toJson() =>
      _$SetupPlayerSchedulesResponseDtoToJson(this);
}
