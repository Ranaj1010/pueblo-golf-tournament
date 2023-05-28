import 'package:pueblo_golf_tournament_mobile/base/base-response.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/division-dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register-division-response-dto.g.dart';

@JsonSerializable()
class RegisterDivisionResponseDto extends BaseResponse {
  final DivisionDto? data;

  RegisterDivisionResponseDto({
    required super.message,
    required this.data,
  });
  factory RegisterDivisionResponseDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterDivisionResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterDivisionResponseDtoToJson(this);
}
