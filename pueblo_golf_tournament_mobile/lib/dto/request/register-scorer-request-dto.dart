import 'package:json_annotation/json_annotation.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/register-account-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/register-person-request-dto.dart';

part 'register-scorer-request-dto.g.dart';

@JsonSerializable()
class RegisterScorerRequestDto {
  final ReqisterPersonRequesDto person;
  final RegisterAccountCredentialDto account;

  RegisterScorerRequestDto({required this.person, required this.account});

  factory RegisterScorerRequestDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterScorerRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterScorerRequestDtoToJson(this);
}
