import 'package:json_annotation/json_annotation.dart';

part 'lookup-player-scores-request-dto.g.dart';

@JsonSerializable()
class LookupPlayerScoresRequest {
  final int tournamentId;
  final int playerId;
  final int teamId;
  final int teeTimeScheduleId;
  LookupPlayerScoresRequest({
    required this.tournamentId,
    required this.playerId,
    required this.teamId,
    required this.teeTimeScheduleId,
  });

  factory LookupPlayerScoresRequest.fromJson(Map<String, dynamic> json) =>
      _$LookupPlayerScoresRequestFromJson(json);
  Map<String, dynamic> toJson() => _$LookupPlayerScoresRequestToJson(this);
}
