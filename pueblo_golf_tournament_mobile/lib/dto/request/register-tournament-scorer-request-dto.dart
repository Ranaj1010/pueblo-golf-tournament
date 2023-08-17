import 'package:pueblo_golf_tournament_mobile/dto/request/register-account-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/register-person-request-dto.dart';

import 'package:json_annotation/json_annotation.dart';

part 'register-tournament-scorer-request-dto.g.dart';

@JsonSerializable()
class ReqisterTournamentScorerRequestDto {
  final int tournamentId, scorerId;

  ReqisterTournamentScorerRequestDto(
      {required this.tournamentId, required this.scorerId});

  factory ReqisterTournamentScorerRequestDto.fromJson(
          Map<String, dynamic> json) =>
      _$ReqisterTournamentScorerRequestDtoFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ReqisterTournamentScorerRequestDtoToJson(this);
}
