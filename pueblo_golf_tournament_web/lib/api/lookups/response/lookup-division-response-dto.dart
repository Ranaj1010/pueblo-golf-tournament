import 'package:json_annotation/json_annotation.dart';
import 'package:pueblo_golf_tournament_web/api/base-response.dart';
import 'package:pueblo_golf_tournament_web/models/division.dart';
part 'lookup-division-response-dto.g.dart';

@JsonSerializable()
class LookupDivisionResponseDto extends BaseResponse {
  final List<Division> data;

  factory LookupDivisionResponseDto.fromJson(Map<String, dynamic> json) =>
      _$LookupDivisionResponseDtoFromJson(json);

  LookupDivisionResponseDto({
    required super.message,
    required this.data,
  });

  Map<String, dynamic> toJson() => _$LookupDivisionResponseDtoToJson(this);
}
