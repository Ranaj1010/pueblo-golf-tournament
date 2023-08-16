import 'package:pueblo_golf_tournament_mobile/dto/request/register-payment-request-dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register-team-division-request-dto.g.dart';

@JsonSerializable()
class RegisterTeamDivisionRequestDto {
  final int tournamentId;
  final int teamId;
  final int divisionId;

  RegisterTeamDivisionRequestDto(
      {required this.tournamentId,
      required this.teamId,
      required this.divisionId});

  factory RegisterTeamDivisionRequestDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterTeamDivisionRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterTeamDivisionRequestDtoToJson(this);
}
