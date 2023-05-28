import 'package:pueblo_golf_tournament_mobile/base/base-response.dart';

import '../model/person-dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register-person-response-dto.g.dart';

@JsonSerializable()
class RegisterPersonResponseDto extends BaseResponse {
  final PersonDto? data;

  RegisterPersonResponseDto({
    required super.message,
    required this.data,
  });
  factory RegisterPersonResponseDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterPersonResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterPersonResponseDtoToJson(this);
}
