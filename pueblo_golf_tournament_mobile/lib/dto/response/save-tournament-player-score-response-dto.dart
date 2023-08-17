import 'package:json_annotation/json_annotation.dart';
import 'package:pueblo_golf_tournament_mobile/base/base-response.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/tournament-player-score-dto.dart';

part 'save-tournament-player-score-response-dto.g.dart';

@JsonSerializable()
class SaveTournamentPlayerScoreResponseDto extends BaseResponse {
  final TournamentPlayerScoreDto? data;
  SaveTournamentPlayerScoreResponseDto(
      {required super.message, required this.data});
  factory SaveTournamentPlayerScoreResponseDto.fromJson(
          Map<String, dynamic> json) =>
      _$SaveTournamentPlayerScoreResponseDtoFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SaveTournamentPlayerScoreResponseDtoToJson(this);
}
