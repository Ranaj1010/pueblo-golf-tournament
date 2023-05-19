import 'package:json_annotation/json_annotation.dart';
import 'package:pueblo_golf_tournament_mobile/models/division.dart';
import 'package:pueblo_golf_tournament_mobile/models/home-club.dart';
import 'package:pueblo_golf_tournament_mobile/models/person.dart';
import 'package:pueblo_golf_tournament_mobile/models/team.dart';
import 'package:pueblo_golf_tournament_mobile/utilities/enums.dart';

import '../../models/base-model.dart';
part 'player-dto.g.dart';

@JsonSerializable()
class PlayerDto extends BaseModel {
  final int playerType;
  final String worldHandicapSystemId;
  final double handicap;
  final double? divisionId;
  final String? homeClub;
  final double? teamId;
  final double? personId;
  final Person? person;
  final Division? division;
  final Team? team;

  factory PlayerDto.fromJson(Map<String, dynamic> json) =>
      _$PlayerDtoFromJson(json);

  PlayerDto({
    required super.id,
    required this.playerType,
    required this.worldHandicapSystemId,
    required this.handicap,
    this.divisionId,
    this.homeClub,
    this.teamId,
    this.personId,
    this.person,
    this.division,
    this.team,
  });

  Map<String, dynamic> toJson() => _$PlayerDtoToJson(this);
}
