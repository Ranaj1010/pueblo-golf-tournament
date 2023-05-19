import 'package:json_annotation/json_annotation.dart';
import 'package:pueblo_golf_tournament_mobile/models/base-model.dart';

part 'tournament-dto.g.dart';

@JsonSerializable()
class TournamentDto extends BaseModel {
  final String name;
  final String? bannerPhoto;
  final String? startDate;
  final String? endDate;
  final String? venuePlace;
  final String? venueAddress;
  final String? venueCity;
  final String? venueCountry;
  final int numberOfSlots;

  factory TournamentDto.fromJson(Map<String, dynamic> json) =>
      _$TournamentDtoFromJson(json);

  TournamentDto(
      {required this.name,
      required this.bannerPhoto,
      required this.startDate,
      required this.endDate,
      this.venuePlace,
      this.venueAddress,
      this.venueCity,
      this.venueCountry,
      required this.numberOfSlots,
      required super.id});
  Map<String, dynamic> toJson() => _$TournamentDtoToJson(this);
}
