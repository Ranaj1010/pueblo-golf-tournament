import 'package:json_annotation/json_annotation.dart';
import 'package:pueblo_golf_tournament_mobile/base/base-response.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/player-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/tee-time-schedule-dto.dart';

part 'update-tee-time-schedule-response-dto.g.dart';

@JsonSerializable()
class UpdateTeeTimeScheduleResponseDto extends BaseResponse {
  final TeeTimeScheduleDto? data;

  factory UpdateTeeTimeScheduleResponseDto.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateTeeTimeScheduleResponseDtoFromJson(json);

  UpdateTeeTimeScheduleResponseDto(
      {required super.message, required this.data});
  Map<String, dynamic> toJson() =>
      _$UpdateTeeTimeScheduleResponseDtoToJson(this);
}
