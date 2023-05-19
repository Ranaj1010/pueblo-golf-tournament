// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registered-account-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisteredAccountDto _$RegisteredAccountDtoFromJson(
        Map<String, dynamic> json) =>
    RegisteredAccountDto(
      json['data'] == null
          ? null
          : RegisteredAccountData.fromJson(
              json['data'] as Map<String, dynamic>),
      message: json['message'] as String,
    );

Map<String, dynamic> _$RegisteredAccountDtoToJson(
        RegisteredAccountDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

RegisteredAccountData _$RegisteredAccountDataFromJson(
        Map<String, dynamic> json) =>
    RegisteredAccountData(
      person: json['person'] == null
          ? null
          : PersonDto.fromJson(json['person'] as Map<String, dynamic>),
      player: json['player'] == null
          ? null
          : PlayerDto.fromJson(json['player'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegisteredAccountDataToJson(
        RegisteredAccountData instance) =>
    <String, dynamic>{
      'person': instance.person,
      'player': instance.player,
    };
