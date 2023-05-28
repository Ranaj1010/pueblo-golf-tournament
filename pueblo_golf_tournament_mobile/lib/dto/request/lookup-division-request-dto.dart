import 'package:json_annotation/json_annotation.dart';

part 'lookup-division-request-dto.g.dart';

@JsonSerializable()
class LookupDivisionRequestDto {
  final String filterName;
  final String tournamentId;

  LookupDivisionRequestDto(
      {required this.filterName, required this.tournamentId});

  factory LookupDivisionRequestDto.fromJson(Map<String, dynamic> json) =>
      _$LookupDivisionRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$LookupDivisionRequestDtoToJson(this);
}
