import 'package:json_annotation/json_annotation.dart';
import 'base-model.dart';
part 'tournament.g.dart';

@JsonSerializable()
class Tournament extends BaseModel {
  final String name;
  final String? bannerPhoto;
  final DateTime startDate;
  final DateTime endDate;
  final String? venuePlace;
  final String? venueAddress;
  final String? venueCity;
  final String? venueCountry;
  final int numberOfSlots;

  factory Tournament.fromJson(Map<String, dynamic> json) =>
      _$TournamentFromJson(json);

  Tournament(
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
  Map<String, dynamic> toJson() => _$TournamentToJson(this);
}
