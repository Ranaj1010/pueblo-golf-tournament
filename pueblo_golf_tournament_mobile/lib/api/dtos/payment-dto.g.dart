// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentDto _$PaymentDtoFromJson(Map<String, dynamic> json) => PaymentDto(
      id: json['id'] as int,
      paymentMethod: json['paymentMethod'] as String,
      referrenceId: json['referrenceId'] as String,
      paymentDate: DateTime.parse(json['paymentDate'] as String),
    );

Map<String, dynamic> _$PaymentDtoToJson(PaymentDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'paymentMethod': instance.paymentMethod,
      'referrenceId': instance.referrenceId,
      'paymentDate': instance.paymentDate.toIso8601String(),
    };
