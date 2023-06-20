// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentDto _$PaymentDtoFromJson(Map<String, dynamic> json) => PaymentDto(
      id: json['id'] as int,
      paymentMethod: json['paymentMethod'] as String,
      paymentChannelAccountId: json['paymentChannelAccountId'] as int?,
      paymentReferrencePhoto: json['paymentReferrencePhoto'] as String,
      referrenceId: json['referrenceId'] as String,
      paymentDate: DateTime.parse(json['paymentDate'] as String),
      accountNumber: json['accountNumber'] as String?,
      accountName: json['accountName'] as String?,
    );

Map<String, dynamic> _$PaymentDtoToJson(PaymentDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'paymentMethod': instance.paymentMethod,
      'paymentReferrencePhoto': instance.paymentReferrencePhoto,
      'paymentChannelAccountId': instance.paymentChannelAccountId,
      'accountNumber': instance.accountNumber,
      'accountName': instance.accountName,
      'referrenceId': instance.referrenceId,
      'paymentDate': instance.paymentDate.toIso8601String(),
    };
