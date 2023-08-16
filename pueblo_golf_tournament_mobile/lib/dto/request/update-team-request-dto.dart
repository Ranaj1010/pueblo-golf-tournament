import 'package:json_annotation/json_annotation.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/team-dto.dart';

part 'update-team-request-dto.g.dart';

@JsonSerializable()
class UpdateTeamRequestDto {
  final TeamDto team;

  UpdateTeamRequestDto({required this.team});

  factory UpdateTeamRequestDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateTeamRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateTeamRequestDtoToJson(this);
}
