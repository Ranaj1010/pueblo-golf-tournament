// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register-account-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterAccountDto _$RegisterAccountDtoFromJson(Map<String, dynamic> json) =>
    RegisterAccountDto(
      account: json['account'] as Map<String, dynamic>,
      person: json['person'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$RegisterAccountDtoToJson(RegisterAccountDto instance) =>
    <String, dynamic>{
      'account': instance.account,
      'person': instance.person,
    };

AccountRawDto _$AccountRawDtoFromJson(Map<String, dynamic> json) =>
    AccountRawDto(
      username: json['username'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$AccountRawDtoToJson(AccountRawDto instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };

PersonRawDto _$PersonRawDtoFromJson(Map<String, dynamic> json) => PersonRawDto(
      firstName: json['firstName'] as String,
      middleName: json['middleName'] as String,
      lastName: json['lastName'] as String,
      birthDate: DateTime.parse(json['birthDate'] as String),
      contactNumber: json['contactNumber'] as String,
      emailAddress: json['emailAddress'] as String,
      country: json['country'] as String,
    );

Map<String, dynamic> _$PersonRawDtoToJson(PersonRawDto instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'birthDate': instance.birthDate.toIso8601String(),
      'contactNumber': instance.contactNumber,
      'emailAddress': instance.emailAddress,
      'country': instance.country,
    };
