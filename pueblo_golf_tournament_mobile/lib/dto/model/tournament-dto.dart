import 'package:json_annotation/json_annotation.dart';
import 'package:pueblo_golf_tournament_mobile/base/base-dto.dart';
part 'tournament-dto.g.dart';

@JsonSerializable()
class TournamentDto extends BaseDto {
  final String name;
  final String? bannerPhoto;
  final DateTime startDate;
  final DateTime endDate;
  final double registrationFee;
  final String venuePlace;
  final String venueAddress;
  final String venueCity;
  final String venueCountry;
  final int numberOfSlots;
  final String nameOfTournamentSupport;
  final String contactNumberOfTournamentSupport;

  TournamentDto({
    required super.id,
    required this.name,
    required this.bannerPhoto,
    required this.startDate,
    required this.endDate,
    required this.registrationFee,
    required this.venuePlace,
    required this.venueAddress,
    required this.venueCity,
    required this.venueCountry,
    required this.numberOfSlots,
    required this.nameOfTournamentSupport,
    required this.contactNumberOfTournamentSupport,
  });

  factory TournamentDto.fromJson(Map<String, dynamic> json) =>
      _$TournamentDtoFromJson(json);
  Map<String, dynamic> toJson() => _$TournamentDtoToJson(this);
}
