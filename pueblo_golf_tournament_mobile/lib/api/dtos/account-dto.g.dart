// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountDto _$AccountDtoFromJson(Map<String, dynamic> json) => AccountDto(
      username: json['username'] as String,
      password: json['password'] as String,
      personId: (json['personId'] as num).toDouble(),
      accountType: $enumDecode(_$AccountTypeEnumEnumMap, json['accountType']),
      id: json['id'] as int,
    );

Map<String, dynamic> _$AccountDtoToJson(AccountDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'password': instance.password,
      'personId': instance.personId,
      'accountType': _$AccountTypeEnumEnumMap[instance.accountType]!,
    };

const _$AccountTypeEnumEnumMap = {
  AccountTypeEnum.SuperAdministrator: 'SuperAdministrator',
  AccountTypeEnum.Administrator: 'Administrator',
  AccountTypeEnum.User: 'User',
};
