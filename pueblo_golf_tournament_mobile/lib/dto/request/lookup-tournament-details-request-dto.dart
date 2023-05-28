import 'package:json_annotation/json_annotation.dart';

part 'lookup-tournament-details-request-dto.g.dart';

@JsonSerializable()
class LookupTournamentDetailsRequestDto {
  final int tournamentId;

  LookupTournamentDetailsRequestDto({required this.tournamentId});

  factory LookupTournamentDetailsRequestDto.fromJson(
          Map<String, dynamic> json) =>
      _$LookupTournamentDetailsRequestDtoFromJson(json);
  Map<String, dynamic> toJson() =>
      _$LookupTournamentDetailsRequestDtoToJson(this);
}
