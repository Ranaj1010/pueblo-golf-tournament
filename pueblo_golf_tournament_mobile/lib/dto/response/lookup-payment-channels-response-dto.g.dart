// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lookup-payment-channels-response-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LookupPaymentChannelsResponseDto _$LookupPaymentChannelsResponseDtoFromJson(
        Map<String, dynamic> json) =>
    LookupPaymentChannelsResponseDto(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => PaymentChannelDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$LookupPaymentChannelsResponseDtoToJson(
        LookupPaymentChannelsResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
