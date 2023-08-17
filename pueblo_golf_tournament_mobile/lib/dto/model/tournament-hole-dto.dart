import 'package:json_annotation/json_annotation.dart';
import 'package:pueblo_golf_tournament_mobile/base/base-dto.dart';

part 'tournament-hole-dto.g.dart';

@JsonSerializable()
class TournamentHoleDto extends BaseDto {
  final int tournamentId;
  final int holeNumber;
  final int maximumStrokes;

  TournamentHoleDto(
      {required this.tournamentId,
      required this.holeNumber,
      required this.maximumStrokes,
      required super.id});

  factory TournamentHoleDto.fromJson(Map<String, dynamic> json) =>
      _$TournamentHoleDtoFromJson(json);
  Map<String, dynamic> toJson() => _$TournamentHoleDtoToJson(this);
}
