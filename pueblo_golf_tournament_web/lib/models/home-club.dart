import 'package:json_annotation/json_annotation.dart';

import 'base-model.dart';
part 'home-club.g.dart';

@JsonSerializable()
class HomeClub extends BaseModel {
  final String name;
  final String? address;
  final String? city;
  final String? province;
  final String? country;

  HomeClub(this.address, this.city, this.province, this.country,
      {required this.name, required super.id});

  factory HomeClub.fromJson(Map<String, dynamic> json) =>
      _$HomeClubFromJson(json);

  Map<String, dynamic> toJson() => _$HomeClubToJson(this);
}
