// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tournament-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TournamentDto _$TournamentDtoFromJson(Map<String, dynamic> json) =>
    TournamentDto(
      name: json['name'] as String,
      bannerPhoto: json['bannerPhoto'] as String?,
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      venuePlace: json['venuePlace'] as String?,
      venueAddress: json['venueAddress'] as String?,
      venueCity: json['venueCity'] as String?,
      venueCountry: json['venueCountry'] as String?,
      numberOfSlots: json['numberOfSlots'] as int,
      id: json['id'] as int,
    );

Map<String, dynamic> _$TournamentDtoToJson(TournamentDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'bannerPhoto': instance.bannerPhoto,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'venuePlace': instance.venuePlace,
      'venueAddress': instance.venueAddress,
      'venueCity': instance.venueCity,
      'venueCountry': instance.venueCountry,
      'numberOfSlots': instance.numberOfSlots,
    };
