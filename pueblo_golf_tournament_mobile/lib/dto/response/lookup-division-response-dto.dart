import 'package:pueblo_golf_tournament_mobile/base/base-response.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/division-dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lookup-division-response-dto.g.dart';

@JsonSerializable()
class LookupDivisionResponseDto extends BaseResponse {
  final List<DivisionDto>? data;
  LookupDivisionResponseDto({
    required super.message,
    required this.data,
  });
  factory LookupDivisionResponseDto.fromJson(Map<String, dynamic> json) =>
      _$LookupDivisionResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$LookupDivisionResponseDtoToJson(this);
}
