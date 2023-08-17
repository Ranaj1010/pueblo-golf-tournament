import 'package:json_annotation/json_annotation.dart';
import 'package:pueblo_golf_tournament_mobile/base/base-response.dart';

import '../model/tournament-player-score-dto.dart';

part 'lookup-player-scores-response-dto.g.dart';

@JsonSerializable()
class LookupPlayerScoresResponse extends BaseResponse {
  final List<TournamentPlayerScoreDto> data;
  LookupPlayerScoresResponse({required this.data, required super.message});
  factory LookupPlayerScoresResponse.fromJson(Map<String, dynamic> json) =>
      _$LookupPlayerScoresResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LookupPlayerScoresResponseToJson(this);
}
