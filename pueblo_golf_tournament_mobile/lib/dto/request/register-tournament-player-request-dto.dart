import 'package:json_annotation/json_annotation.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/register-player-request-dto.dart';

part 'register-tournament-player-request-dto.g.dart';

@JsonSerializable()
class RegisterTournamentPlayerRequestDto {
  final int playerId;
  final int registrationId;
  final int teamId;
  final int tournamentId;

  factory RegisterTournamentPlayerRequestDto.fromJson(
          Map<String, dynamic> json) =>
      _$RegisterTournamentPlayerRequestDtoFromJson(json);

  RegisterTournamentPlayerRequestDto(
      {required this.registrationId,
      required this.teamId,
      required this.tournamentId,
      required this.playerId});
  Map<String, dynamic> toJson() =>
      _$RegisterTournamentPlayerRequestDtoToJson(this);
}
