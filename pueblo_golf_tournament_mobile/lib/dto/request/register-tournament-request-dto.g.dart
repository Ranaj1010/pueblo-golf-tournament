// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register-tournament-request-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterTournamentRequestDto _$RegisterTournamentRequestDtoFromJson(
        Map<String, dynamic> json) =>
    RegisterTournamentRequestDto(
      name: json['name'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      venuePlace: json['venuePlace'] as String,
      venueAddress: json['venueAddress'] as String,
      venueCity: json['venueCity'] as String,
      venueCountry: json['venueCountry'] as String,
      numberOfSlots: json['numberOfSlots'] as int,
    );

Map<String, dynamic> _$RegisterTournamentRequestDtoToJson(
        RegisterTournamentRequestDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'venuePlace': instance.venuePlace,
      'venueAddress': instance.venueAddress,
      'venueCity': instance.venueCity,
      'venueCountry': instance.venueCountry,
      'numberOfSlots': instance.numberOfSlots,
    };
