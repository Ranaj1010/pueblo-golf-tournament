// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lookup-player-profile-response-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LookupPlayeProfileResponseDto _$LookupPlayeProfileResponseDtoFromJson(
        Map<String, dynamic> json) =>
    LookupPlayeProfileResponseDto(
      message: json['message'] as String,
      profile: json['profile'] == null
          ? null
          : PlayerProfile.fromJson(json['profile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LookupPlayeProfileResponseDtoToJson(
        LookupPlayeProfileResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'profile': instance.profile,
    };
