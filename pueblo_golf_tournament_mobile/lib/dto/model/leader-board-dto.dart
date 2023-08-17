import 'package:pueblo_golf_tournament_mobile/base/base-dto.dart';

import 'package:json_annotation/json_annotation.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/division-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/team-dto.dart';

part 'leader-board-dto.g.dart';

@JsonSerializable()
class LeaderBoardDto {
  final int tournamentId, score;
  final TeamDto team;

  LeaderBoardDto({
    required this.tournamentId,
    required this.score,
    required this.team,
  });

  factory LeaderBoardDto.fromJson(Map<String, dynamic> json) =>
      _$LeaderBoardDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LeaderBoardDtoToJson(this);
}
