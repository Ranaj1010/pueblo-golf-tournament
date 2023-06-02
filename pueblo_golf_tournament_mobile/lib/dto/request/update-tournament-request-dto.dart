import 'package:json_annotation/json_annotation.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/tournament-dto.dart';

part 'update-tournament-request-dto.g.dart';

@JsonSerializable()
class UpdateTournamentRequestDto {
  final TournamentDto person;

  UpdateTournamentRequestDto({required this.person});

  factory UpdateTournamentRequestDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateTournamentRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateTournamentRequestDtoToJson(this);
}
