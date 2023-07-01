// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tournament-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TournamentDto _$TournamentDtoFromJson(Map<String, dynamic> json) =>
    TournamentDto(
      id: json['id'] as int,
      name: json['name'] as String,
      bannerPhoto: json['bannerPhoto'] as String?,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      registrationFee: (json['registrationFee'] as num).toDouble(),
      venuePlace: json['venuePlace'] as String,
      venueAddress: json['venueAddress'] as String,
      venueCity: json['venueCity'] as String,
      venueCountry: json['venueCountry'] as String,
      numberOfSlots: json['numberOfSlots'] as int,
      nameOfTournamentSupport: json['nameOfTournamentSupport'] as String,
      contactNumberOfTournamentSupport:
          json['contactNumberOfTournamentSupport'] as String,
    );

Map<String, dynamic> _$TournamentDtoToJson(TournamentDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'bannerPhoto': instance.bannerPhoto,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'registrationFee': instance.registrationFee,
      'venuePlace': instance.venuePlace,
      'venueAddress': instance.venueAddress,
      'venueCity': instance.venueCity,
      'venueCountry': instance.venueCountry,
      'numberOfSlots': instance.numberOfSlots,
      'nameOfTournamentSupport': instance.nameOfTournamentSupport,
      'contactNumberOfTournamentSupport':
          instance.contactNumberOfTournamentSupport,
    };
