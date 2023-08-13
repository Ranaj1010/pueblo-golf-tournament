import 'package:json_annotation/json_annotation.dart';
import 'package:pueblo_golf_tournament_mobile/base/base-response.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/tournament-hole-dto.dart';

part 'setup-tournament-holes-response-dto.g.dart';

@JsonSerializable()
class SetupTournamentHolesResponseDto extends BaseResponse {
  final List<TournamentHoleDto> data;

  SetupTournamentHolesResponseDto({required super.message, required this.data});
  factory SetupTournamentHolesResponseDto.fromJson(Map<String, dynamic> json) =>
      _$SetupTournamentHolesResponseDtoFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SetupTournamentHolesResponseDtoToJson(this);
}
