// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register-payment-request-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterPaymentRequestDto _$RegisterPaymentRequestDtoFromJson(
        Map<String, dynamic> json) =>
    RegisterPaymentRequestDto(
      paymentMethod: json['paymentMethod'] as String,
      referrenceId: json['referrenceId'] as String,
      paymentDate: DateTime.parse(json['paymentDate'] as String),
    );

Map<String, dynamic> _$RegisterPaymentRequestDtoToJson(
        RegisterPaymentRequestDto instance) =>
    <String, dynamic>{
      'paymentMethod': instance.paymentMethod,
      'referrenceId': instance.referrenceId,
      'paymentDate': instance.paymentDate.toIso8601String(),
    };
