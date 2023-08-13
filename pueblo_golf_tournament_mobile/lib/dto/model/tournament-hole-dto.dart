import 'package:json_annotation/json_annotation.dart';

part 'tournament-hole-dto.g.dart';

@JsonSerializable()
class TournamentHoleDto {
  final int tournamentId;
  final int holeNumber;
  final int maximumStrokes;

  TournamentHoleDto(
      {required this.tournamentId,
      required this.holeNumber,
      required this.maximumStrokes});

  factory TournamentHoleDto.fromJson(Map<String, dynamic> json) =>
      _$TournamentHoleDtoFromJson(json);
  Map<String, dynamic> toJson() => _$TournamentHoleDtoToJson(this);
}
