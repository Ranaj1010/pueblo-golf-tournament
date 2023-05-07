import 'package:json_annotation/json_annotation.dart';

part 'tournament.g.dart';

@JsonSerializable()
class Tournament {
  final String? name;
  final String? bannerPhoto;
  final DateTime startDate;
  final DateTime endDate;
  final String? venuePlace;
  final String? venueAddress;
  final String? venueCity;
  final String? venueCountry;
  final int numberOfSlots;

  Tournament(
      this.name,
      this.bannerPhoto,
      this.startDate,
      this.endDate,
      this.venuePlace,
      this.venueAddress,
      this.venueCity,
      this.venueCountry,
      this.numberOfSlots);

  factory Tournament.fromJson(Map<String, dynamic> json) =>
      _$TournamentFromJson(json);

  Map<String, dynamic> toJson() => _$TournamentToJson(this);
}
