// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register-account-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterAccountDto _$RegisterAccountDtoFromJson(Map<String, dynamic> json) =>
    RegisterAccountDto(
      person: PersonDto.fromJson(json['person'] as Map<String, dynamic>),
      account: AccountRawDto.fromJson(json['account'] as Map<String, dynamic>),
      player: PlayerDto.fromJson(json['player'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegisterAccountDtoToJson(RegisterAccountDto instance) =>
    <String, dynamic>{
      'person': instance.person,
      'account': instance.account,
      'player': instance.player,
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
