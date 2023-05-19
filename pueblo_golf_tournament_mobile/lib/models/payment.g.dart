// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Payment _$PaymentFromJson(Map<String, dynamic> json) => Payment(
      json['paymentMethod'] as String?,
      json['referrenceId'] as String?,
      DateTime.parse(json['paymentDate'] as String),
      id: json['id'] as int,
    );

Map<String, dynamic> _$PaymentToJson(Payment instance) => <String, dynamic>{
      'id': instance.id,
      'paymentMethod': instance.paymentMethod,
      'referrenceId': instance.referrenceId,
      'paymentDate': instance.paymentDate.toIso8601String(),
    };
