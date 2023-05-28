// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register-person-request-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReqisterPersonRequesDto _$ReqisterPersonRequesDtoFromJson(
        Map<String, dynamic> json) =>
    ReqisterPersonRequesDto(
      firstName: json['firstName'] as String,
      middleName: json['middleName'] as String,
      lastName: json['lastName'] as String,
      birthDate: DateTime.parse(json['birthDate'] as String),
      contactNumber: json['contactNumber'] as String,
      emailAddress: json['emailAddress'] as String,
      country: json['country'] as String,
    );

Map<String, dynamic> _$ReqisterPersonRequesDtoToJson(
        ReqisterPersonRequesDto instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'birthDate': instance.birthDate.toIso8601String(),
      'contactNumber': instance.contactNumber,
      'emailAddress': instance.emailAddress,
      'country': instance.country,
    };
