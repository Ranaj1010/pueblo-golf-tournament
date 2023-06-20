// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lookup-payment-channel-accounts-response-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LookupPaymentChannelAccountsResponseDto
    _$LookupPaymentChannelAccountsResponseDtoFromJson(
            Map<String, dynamic> json) =>
        LookupPaymentChannelAccountsResponseDto(
          data: (json['data'] as List<dynamic>?)
              ?.map((e) =>
                  PaymentChannelAccountDto.fromJson(e as Map<String, dynamic>))
              .toList(),
          message: json['message'] as String,
        );

Map<String, dynamic> _$LookupPaymentChannelAccountsResponseDtoToJson(
        LookupPaymentChannelAccountsResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
