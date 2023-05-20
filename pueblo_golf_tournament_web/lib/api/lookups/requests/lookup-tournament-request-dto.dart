import 'package:json_annotation/json_annotation.dart';
part 'lookup-tournament-request-dto.g.dart';

@JsonSerializable()
class LookupTournamentRequestDto {
  final String? filterName;

  LookupTournamentRequestDto(this.filterName);
  factory LookupTournamentRequestDto.fromJson(Map<String, dynamic> json) =>
      _$LookupTournamentRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LookupTournamentRequestDtoToJson(this);
}
