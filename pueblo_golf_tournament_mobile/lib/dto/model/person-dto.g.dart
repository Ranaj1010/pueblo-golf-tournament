// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonDto _$PersonDtoFromJson(Map<String, dynamic> json) => PersonDto(
      id: json['id'] as int,
      firstName: json['firstName'] as String,
      middleName: json['middleName'] as String,
      lastName: json['lastName'] as String,
      birthDate: DateTime.parse(json['birthDate'] as String),
      contactNumber: json['contactNumber'] as String,
      homeAddress: json['homeAddress'] as String,
      city: json['city'] as String,
      emailAddress: json['emailAddress'] as String,
      country: json['country'] as String,
    );

Map<String, dynamic> _$PersonDtoToJson(PersonDto instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'birthDate': instance.birthDate.toIso8601String(),
      'contactNumber': instance.contactNumber,
      'homeAddress': instance.homeAddress,
      'city': instance.city,
      'emailAddress': instance.emailAddress,
      'country': instance.country,
    };
