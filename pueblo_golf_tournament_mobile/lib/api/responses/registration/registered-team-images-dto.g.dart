// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registered-team-images-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisteredTeamImagesDto _$RegisteredTeamImagesDtoFromJson(
        Map<String, dynamic> json) =>
    RegisteredTeamImagesDto(
      message: json['message'] as String,
      paymentImageUrl: json['paymentImageUrl'] as String,
      logoImageUrl: json['logoImageUrl'] as String,
    );

Map<String, dynamic> _$RegisteredTeamImagesDtoToJson(
        RegisteredTeamImagesDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'paymentImageUrl': instance.paymentImageUrl,
      'logoImageUrl': instance.logoImageUrl,
    };
