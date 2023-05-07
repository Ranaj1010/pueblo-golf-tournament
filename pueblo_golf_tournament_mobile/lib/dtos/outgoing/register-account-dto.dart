import 'package:json_annotation/json_annotation.dart';

part 'register-account-dto.g.dart';

@JsonSerializable()
class RegisterAccountDto {
  final Map<String, dynamic> account;
  final Map<String, dynamic> person;

  RegisterAccountDto({required this.account, required this.person});

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

@JsonSerializable()
class PersonRawDto {
  final String firstName;
  final String middleName;
  final String lastName;
  final DateTime birthDate;
  final String contactNumber;
  final String emailAddress;
  final String country;

  PersonRawDto(
      {required this.firstName,
      required this.middleName,
      required this.lastName,
      required this.birthDate,
      required this.contactNumber,
      required this.emailAddress,
      required this.country});

  factory PersonRawDto.fromJson(Map<String, dynamic> json) =>
      _$PersonRawDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PersonRawDtoToJson(this);
}
