// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update-person-request-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdatePersonRequestDto _$UpdatePersonRequestDtoFromJson(
        Map<String, dynamic> json) =>
    UpdatePersonRequestDto(
      person: PersonDto.fromJson(json['person'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdatePersonRequestDtoToJson(
        UpdatePersonRequestDto instance) =>
    <String, dynamic>{
      'person': instance.person,
    };
