import 'package:json_annotation/json_annotation.dart';
import 'package:pueblo_golf_tournament_mobile/base/base-response.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/tournament-hole-dto.dart';

part 'lookup-tournament-holes-response-dto.g.dart';

@JsonSerializable()
class LookupTournamentHolesResponseDto extends BaseResponse {
  final int tournamentId;
  final List<TournamentHoleDto> data;

  LookupTournamentHolesResponseDto(
      {required this.tournamentId, required this.data, required super.message});

  factory LookupTournamentHolesResponseDto.fromJson(
          Map<String, dynamic> json) =>
      _$LookupTournamentHolesResponseDtoFromJson(json);

  Map<String, dynamic> toJson() =>
      _$LookupTournamentHolesResponseDtoToJson(this);
}
