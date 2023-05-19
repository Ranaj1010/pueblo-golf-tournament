// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tournament.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tournament _$TournamentFromJson(Map<String, dynamic> json) => Tournament(
      name: json['name'] as String,
      bannerPhoto: json['bannerPhoto'] as String?,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      venuePlace: json['venuePlace'] as String?,
      venueAddress: json['venueAddress'] as String?,
      venueCity: json['venueCity'] as String?,
      venueCountry: json['venueCountry'] as String?,
      numberOfSlots: json['numberOfSlots'] as int,
      id: json['id'] as int,
    );

Map<String, dynamic> _$TournamentToJson(Tournament instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'bannerPhoto': instance.bannerPhoto,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'venuePlace': instance.venuePlace,
      'venueAddress': instance.venueAddress,
      'venueCity': instance.venueCity,
      'venueCountry': instance.venueCountry,
      'numberOfSlots': instance.numberOfSlots,
    };
