import 'package:pueblo_golf_tournament_mobile/base/base-response.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/person-dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register-account-response-dto.g.dart';

@JsonSerializable()
class RegisterAccountResponseDto extends BaseResponse {
  final RegisteredAccountDataDto? data;

  RegisterAccountResponseDto({required super.message, required this.data});
  factory RegisterAccountResponseDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterAccountResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterAccountResponseDtoToJson(this);
}

@JsonSerializable()
class RegisteredAccountDataDto {
  final PersonDto person;

  RegisteredAccountDataDto({required this.person});
  factory RegisteredAccountDataDto.fromJson(Map<String, dynamic> json) =>
      _$RegisteredAccountDataDtoFromJson(json);
  Map<String, dynamic> toJson() => _$RegisteredAccountDataDtoToJson(this);
}
