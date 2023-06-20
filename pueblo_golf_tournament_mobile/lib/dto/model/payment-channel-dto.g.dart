// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment-channel-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentChannelDto _$PaymentChannelDtoFromJson(Map<String, dynamic> json) =>
    PaymentChannelDto(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$PaymentChannelDtoToJson(PaymentChannelDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
    };
