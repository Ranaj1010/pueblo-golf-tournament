import 'package:json_annotation/json_annotation.dart';

part 'lookup-tournaments-request-dto.g.dart';

@JsonSerializable()
class LookupTournamentsRequestDto {
  final String filterName;

  LookupTournamentsRequestDto({required this.filterName});
  factory LookupTournamentsRequestDto.fromJson(Map<String, dynamic> json) =>
      _$LookupTournamentsRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$LookupTournamentsRequestDtoToJson(this);
}
