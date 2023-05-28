import 'package:pueblo_golf_tournament_mobile/base/base-response.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/team-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/tournament-dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lookup-tournament-details-response-dto.g.dart';

@JsonSerializable()
class LookupTournamentDetailsResponseDto extends BaseResponse {
  final TournamentDto? tournament;
  final List<TeamDto> teams;
  final int playetCount;
  final int teamsCount;
  LookupTournamentDetailsResponseDto({
    required super.message,
    required this.tournament,
    required this.teams,
    required this.playetCount,
    required this.teamsCount,
  });
  factory LookupTournamentDetailsResponseDto.fromJson(
          Map<String, dynamic> json) =>
      _$LookupTournamentDetailsResponseDtoFromJson(json);
  Map<String, dynamic> toJson() =>
      _$LookupTournamentDetailsResponseDtoToJson(this);
}
