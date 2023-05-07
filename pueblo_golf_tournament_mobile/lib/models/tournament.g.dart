// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tournament.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tournament _$TournamentFromJson(Map<String, dynamic> json) => Tournament(
      json['name'] as String?,
      json['bannerPhoto'] as String?,
      DateTime.parse(json['startDate'] as String),
      DateTime.parse(json['endDate'] as String),
      json['venuePlace'] as String?,
      json['venueAddress'] as String?,
      json['venueCity'] as String?,
      json['venueCountry'] as String?,
      json['numberOfSlots'] as int,
    );

Map<String, dynamic> _$TournamentToJson(Tournament instance) =>
    <String, dynamic>{
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
