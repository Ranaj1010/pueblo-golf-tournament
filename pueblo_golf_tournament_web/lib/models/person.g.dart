// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Person _$PersonFromJson(Map<String, dynamic> json) => Person(
      firstName: json['firstName'] as String,
      middleName: json['middleName'] as String,
      lastName: json['lastName'] as String,
      birthDate: DateTime.parse(json['birthDate'] as String),
      contactNumber: json['contactNumber'] as String,
      emailAddress: json['emailAddress'] as String,
      country: json['country'] as String,
      id: json['id'] as int,
    );

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'birthDate': instance.birthDate.toIso8601String(),
      'contactNumber': instance.contactNumber,
      'emailAddress': instance.emailAddress,
      'country': instance.country,
    };
