// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment-channel-account-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentChannelAccountDto _$PaymentChannelAccountDtoFromJson(
        Map<String, dynamic> json) =>
    PaymentChannelAccountDto(
      id: json['id'] as int,
      paymentChannelId: json['paymentChannelId'] as int,
      tournamentId: json['tournamentId'] as int,
      accountName: json['accountName'] as String,
      accountNumber: json['accountNumber'] as String,
      paymentChannel: json['paymentChannel'] == null
          ? null
          : PaymentChannelDto.fromJson(
              json['paymentChannel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PaymentChannelAccountDtoToJson(
        PaymentChannelAccountDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'paymentChannelId': instance.paymentChannelId,
      'tournamentId': instance.tournamentId,
      'accountName': instance.accountName,
      'accountNumber': instance.accountNumber,
      'paymentChannel': instance.paymentChannel,
    };
