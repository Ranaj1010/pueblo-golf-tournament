import 'package:pueblo_golf_tournament_mobile/api/dtos/person-dto.dart';
import 'package:pueblo_golf_tournament_mobile/api/dtos/player-dto.dart';
import 'package:pueblo_golf_tournament_mobile/models/person.dart';

import 'package:json_annotation/json_annotation.dart';

part 'register-account-dto.g.dart';

@JsonSerializable()
class RegisterAccountDto {
  final PersonDto person;
  final AccountRawDto account;
  final PlayerDto player;

  RegisterAccountDto({
    required this.person,
    required this.account,
    required this.player,
  });

  factory RegisterAccountDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterAccountDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterAccountDtoToJson(this);
}

@JsonSerializable()
class AccountRawDto {
  final String username;
  final String password;

  AccountRawDto({required this.username, required this.password});

  factory AccountRawDto.fromJson(Map<String, dynamic> json) =>
      _$AccountRawDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AccountRawDtoToJson(this);
}
