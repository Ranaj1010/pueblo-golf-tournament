import 'package:json_annotation/json_annotation.dart';
import 'package:pueblo_golf_tournament_mobile/api/dtos/tournament-dto.dart';
import 'package:pueblo_golf_tournament_mobile/api/responses/base-response.dart';
import 'package:pueblo_golf_tournament_mobile/models/tournament.dart';
part 'lookup-tournament-response-dto.g.dart';

@JsonSerializable()
class LookupTournamentResponseDto extends BaseResponse {
  final List<TournamentDto> data;

  factory LookupTournamentResponseDto.fromJson(Map<String, dynamic> json) =>
      _$LookupTournamentResponseDtoFromJson(json);

  LookupTournamentResponseDto({
    required super.message,
    required this.data,
  });

  Map<String, dynamic> toJson() => _$LookupTournamentResponseDtoToJson(this);
}
