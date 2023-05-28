// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload-mobile-team-logo-response-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadMobileTeamLogoResponseDto _$UploadMobileTeamLogoResponseDtoFromJson(
        Map<String, dynamic> json) =>
    UploadMobileTeamLogoResponseDto(
      message: json['message'] as String,
      logoUrl: json['logoUrl'] as String,
      isUploaded: json['isUploaded'] as bool,
    );

Map<String, dynamic> _$UploadMobileTeamLogoResponseDtoToJson(
        UploadMobileTeamLogoResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'logoUrl': instance.logoUrl,
      'isUploaded': instance.isUploaded,
    };
