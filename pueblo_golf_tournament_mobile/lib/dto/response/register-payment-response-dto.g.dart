// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register-payment-response-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterPaymentResponseDto _$RegisterPaymentResponseDtoFromJson(
        Map<String, dynamic> json) =>
    RegisterPaymentResponseDto(
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : PaymentDto.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegisterPaymentResponseDtoToJson(
        RegisterPaymentResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
