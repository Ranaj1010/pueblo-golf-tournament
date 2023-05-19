import 'package:json_annotation/json_annotation.dart';
import 'package:pueblo_golf_tournament_mobile/api/dtos/player-dto.dart';
import 'package:pueblo_golf_tournament_mobile/api/dtos/registration-dto.dart';
import 'package:pueblo_golf_tournament_mobile/api/dtos/team-dto.dart';
import 'package:pueblo_golf_tournament_mobile/api/responses/base-response.dart';

part 'registered-team-dto.g.dart';

@JsonSerializable()
class RegisteredTeamDto extends BaseResponse {
  final RegisteredTeamDataDto? data;
  RegisteredTeamDto({
    required super.message,
    required this.data,
  });

  factory RegisteredTeamDto.fromJson(Map<String, dynamic> json) =>
      _$RegisteredTeamDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RegisteredTeamDtoToJson(this);
}

@JsonSerializable()
class RegisteredTeamDataDto {
  final RegistrationDto registration;
  final TeamDto team;
  final PlayerDto teamCaptain;
  final List<PlayerDto> members;

  factory RegisteredTeamDataDto.fromJson(Map<String, dynamic> json) =>
      _$RegisteredTeamDataDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RegisteredTeamDataDtoToJson(this);

  RegisteredTeamDataDto(
      {required this.registration,
      required this.team,
      required this.teamCaptain,
      required this.members});
}
