import 'package:json_annotation/json_annotation.dart';
import 'package:pueblo_golf_tournament_web/models/tournament.dart';

import '../../base-response.dart';
part 'lookup-tournament-response-dto.g.dart';

@JsonSerializable()
class LookupTournamentResponseDto extends BaseResponse {
  final List<Tournament> data;

  factory LookupTournamentResponseDto.fromJson(Map<String, dynamic> json) =>
      _$LookupTournamentResponseDtoFromJson(json);

  LookupTournamentResponseDto({
    required super.message,
    required this.data,
  });

  Map<String, dynamic> toJson() => _$LookupTournamentResponseDtoToJson(this);
}
