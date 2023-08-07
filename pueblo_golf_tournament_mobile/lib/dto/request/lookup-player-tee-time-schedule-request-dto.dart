import 'package:json_annotation/json_annotation.dart';

part 'lookup-player-tee-time-schedule-request-dto.g.dart';

@JsonSerializable()
class LookupPlayerTeeTimeScheduleRequest {
  final int tournamentId;
  final int playerId;
  LookupPlayerTeeTimeScheduleRequest({
    required this.tournamentId,
    required this.playerId,
  });

  factory LookupPlayerTeeTimeScheduleRequest.fromJson(
          Map<String, dynamic> json) =>
      _$LookupPlayerTeeTimeScheduleRequestFromJson(json);
  Map<String, dynamic> toJson() =>
      _$LookupPlayerTeeTimeScheduleRequestToJson(this);
}
