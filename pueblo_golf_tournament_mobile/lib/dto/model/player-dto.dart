import 'package:pueblo_golf_tournament_mobile/base/base-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/person-dto.dart';

import 'package:json_annotation/json_annotation.dart';

part 'player-dto.g.dart';

@JsonSerializable()
class PlayerDto extends BaseDto {
  final int playerType;
  final String worldHandicapSystemId;
  final String playerExternalId;
  final double handicap;
  final String homeClub;
  final int personId;
  final PersonDto? person;
  PlayerDto({
    required super.id,
    required this.playerType,
    required this.worldHandicapSystemId,
    required this.playerExternalId,
    required this.handicap,
    required this.homeClub,
    required this.personId,
    required this.person,
  });
  factory PlayerDto.fromJson(Map<String, dynamic> json) =>
      _$PlayerDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PlayerDtoToJson(this);
}
