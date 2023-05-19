// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home-club.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeClub _$HomeClubFromJson(Map<String, dynamic> json) => HomeClub(
      json['address'] as String?,
      json['city'] as String?,
      json['province'] as String?,
      json['country'] as String?,
      name: json['name'] as String,
      id: json['id'] as int,
    );

Map<String, dynamic> _$HomeClubToJson(HomeClub instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'city': instance.city,
      'province': instance.province,
      'country': instance.country,
    };
