import 'package:json_annotation/json_annotation.dart';

part 'lookup-scorer-profile-request-dto.g.dart';

@JsonSerializable()
class LookupScorerProfilesRequestDto {
  final int tournamentId;

  LookupScorerProfilesRequestDto({required this.tournamentId});
  factory LookupScorerProfilesRequestDto.fromJson(Map<String, dynamic> json) =>
      _$LookupScorerProfilesRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$LookupScorerProfilesRequestDtoToJson(this);
}
