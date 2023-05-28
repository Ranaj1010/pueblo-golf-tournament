// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountDto _$AccountDtoFromJson(Map<String, dynamic> json) => AccountDto(
      id: json['id'] as int,
      username: json['username'] as String,
      personId: json['personId'] as int,
      accountType: json['accountType'] as int,
      person: json['person'] == null
          ? null
          : PersonDto.fromJson(json['person'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AccountDtoToJson(AccountDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'personId': instance.personId,
      'accountType': instance.accountType,
      'person': instance.person,
    };
