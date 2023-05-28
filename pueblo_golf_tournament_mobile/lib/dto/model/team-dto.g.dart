// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeamDto _$TeamDtoFromJson(Map<String, dynamic> json) => TeamDto(
      id: json['id'] as int,
      name: json['name'] as String,
      logoUrl: json['logoUrl'] as String?,
      teamCaptainId: json['teamCaptainId'] as int,
    );

Map<String, dynamic> _$TeamDtoToJson(TeamDto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logoUrl': instance.logoUrl,
      'teamCaptainId': instance.teamCaptainId,
    };
