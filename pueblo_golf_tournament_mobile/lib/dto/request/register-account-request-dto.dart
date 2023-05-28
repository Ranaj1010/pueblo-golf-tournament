import 'package:pueblo_golf_tournament_mobile/dto/request/register-person-request-dto.dart';

import 'package:json_annotation/json_annotation.dart';

part 'register-account-request-dto.g.dart';

@JsonSerializable()
class ReqisterAccountRequesDto {
  final ReqisterPersonRequesDto person;
  final RegisterAccountCredentialDto account;

  ReqisterAccountRequesDto({required this.person, required this.account});

  factory ReqisterAccountRequesDto.fromJson(Map<String, dynamic> json) =>
      _$ReqisterAccountRequesDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ReqisterAccountRequesDtoToJson(this);
}

@JsonSerializable()
class RegisterAccountCredentialDto {
  final String username;
  final String password;

  RegisterAccountCredentialDto(
      {required this.username, required this.password});
  factory RegisterAccountCredentialDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterAccountCredentialDtoFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterAccountCredentialDtoToJson(this);
}
