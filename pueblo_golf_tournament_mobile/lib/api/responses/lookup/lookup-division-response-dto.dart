import 'package:json_annotation/json_annotation.dart';
import 'package:pueblo_golf_tournament_mobile/api/dtos/division-dto.dart';
import 'package:pueblo_golf_tournament_mobile/api/dtos/tournament-dto.dart';
import 'package:pueblo_golf_tournament_mobile/api/responses/base-response.dart';
import 'package:pueblo_golf_tournament_mobile/models/tournament.dart';
part 'lookup-division-response-dto.g.dart';

@JsonSerializable()
class LookupDivisionResponseDto extends BaseResponse {
  final List<DivisionDto> data;

  factory LookupDivisionResponseDto.fromJson(Map<String, dynamic> json) =>
      _$LookupDivisionResponseDtoFromJson(json);

  LookupDivisionResponseDto({
    required super.message,
    required this.data,
  });

  Map<String, dynamic> toJson() => _$LookupDivisionResponseDtoToJson(this);
}
