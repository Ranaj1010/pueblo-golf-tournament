import 'package:json_annotation/json_annotation.dart';

import '../../models/base-model.dart';

part 'home-club-dto.g.dart';

@JsonSerializable()
class HomeClubDto extends BaseModel {
  final String name;
  final String? address;
  final String? city;
  final String? province;
  final String? country;

  HomeClubDto(this.address, this.city, this.province, this.country,
      {required this.name, required super.id});

  factory HomeClubDto.fromJson(Map<String, dynamic> json) =>
      _$HomeClubDtoFromJson(json);

  Map<String, dynamic> toJson() => _$HomeClubDtoToJson(this);
}
