import 'package:json_annotation/json_annotation.dart';

part 'setup-tournament-holes-request-dto.g.dart';

@JsonSerializable()
class SetupTournamentHolesRequestDto {
  final int tournamentId;
  final List<HoleRequestDto> holes;

  SetupTournamentHolesRequestDto(
      {required this.tournamentId, required this.holes});
  factory SetupTournamentHolesRequestDto.fromJson(Map<String, dynamic> json) =>
      _$SetupTournamentHolesRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$SetupTournamentHolesRequestDtoToJson(this);
}

@JsonSerializable()
class HoleRequestDto {
  final int holeNumber, maximumStrokes;
  HoleRequestDto({required this.holeNumber, required this.maximumStrokes});
  factory HoleRequestDto.fromJson(Map<String, dynamic> json) =>
      _$HoleRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$HoleRequestDtoToJson(this);
}
