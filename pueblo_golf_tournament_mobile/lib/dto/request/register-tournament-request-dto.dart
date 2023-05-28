import 'package:json_annotation/json_annotation.dart';

part 'register-tournament-request-dto.g.dart';

@JsonSerializable()
class RegisterTournamentRequestDto {
  final String name;
  final DateTime startDate;
  final DateTime endDate;
  final String venuePlace;
  final String venueAddress;
  final String venueCity;
  final String venueCountry;
  final int numberOfSlots;

  RegisterTournamentRequestDto(
      {required this.name,
      required this.startDate,
      required this.endDate,
      required this.venuePlace,
      required this.venueAddress,
      required this.venueCity,
      required this.venueCountry,
      required this.numberOfSlots});
  factory RegisterTournamentRequestDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterTournamentRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterTournamentRequestDtoToJson(this);
}
