import 'package:json_annotation/json_annotation.dart';
import 'package:pueblo_golf_tournament_web/models/person.dart';
import 'package:pueblo_golf_tournament_web/models/team.dart';

import 'base-model.dart';
import 'division.dart';
part 'player.g.dart';

@JsonSerializable()
class Player extends BaseModel {
  final int playerType;
  final String worldHandicapSystemsId;
  final double handicap;
  final double divisionId;
  final String homeClub;
  final double? teamId;
  final double? personId;
  final Person? person;
  final Division? division;
  final Team? team;

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);

  Player(
    this.homeClub, {
    required super.id,
    required this.playerType,
    required this.worldHandicapSystemsId,
    required this.handicap,
    required this.divisionId,
    this.teamId,
    this.personId,
    this.person,
    this.division,
    this.team,
  });

  Map<String, dynamic> toJson() => _$PlayerToJson(this);
}
