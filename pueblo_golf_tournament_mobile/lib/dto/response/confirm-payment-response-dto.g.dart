// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm-payment-response-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfirmPaymentResponseDto _$ConfirmPaymentResponseDtoFromJson(
        Map<String, dynamic> json) =>
    ConfirmPaymentResponseDto(
      registration: json['registration'] == null
          ? null
          : RegistrationDto.fromJson(
              json['registration'] as Map<String, dynamic>),
      payment: json['payment'] == null
          ? null
          : PaymentDto.fromJson(json['payment'] as Map<String, dynamic>),
      message: json['message'] as String,
    );

Map<String, dynamic> _$ConfirmPaymentResponseDtoToJson(
        ConfirmPaymentResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'registration': instance.registration,
      'payment': instance.payment,
    };
