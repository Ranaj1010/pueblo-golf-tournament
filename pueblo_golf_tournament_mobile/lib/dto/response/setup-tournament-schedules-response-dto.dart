import 'package:json_annotation/json_annotation.dart';
import 'package:pueblo_golf_tournament_mobile/base/base-response.dart';

part 'setup-tournament-schedules-response-dto.g.dart';

@JsonSerializable()
class SetupTournamentSchedulesResponseDto extends BaseResponse {
  final bool success;

  SetupTournamentSchedulesResponseDto({
    required super.message,
    required this.success,
  });

  factory SetupTournamentSchedulesResponseDto.fromJson(
          Map<String, dynamic> json) =>
      _$SetupTournamentSchedulesResponseDtoFromJson(json);
  Map<String, dynamic> toJson() =>
      _$SetupTournamentSchedulesResponseDtoToJson(this);
}
