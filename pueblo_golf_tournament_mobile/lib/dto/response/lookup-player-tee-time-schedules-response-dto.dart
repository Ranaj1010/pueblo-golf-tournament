import 'package:json_annotation/json_annotation.dart';
import 'package:pueblo_golf_tournament_mobile/base/base-response.dart';

import '../model/tee-time-schedule-dto.dart';
import 'lookup-tee-time-schedules-response-dto.dart';

part 'lookup-player-tee-time-schedules-response-dto.g.dart';

@JsonSerializable()
class LookupPlayerTeeTimeScheduleResponse extends BaseResponse {
  final int playerId;
  final List<TournamentScheduleDate>? data;
  LookupPlayerTeeTimeScheduleResponse({
    required super.message,
    required this.data,
    required this.playerId,
  });

  factory LookupPlayerTeeTimeScheduleResponse.fromJson(
          Map<String, dynamic> json) =>
      _$LookupPlayerTeeTimeScheduleResponseFromJson(json);
  Map<String, dynamic> toJson() =>
      _$LookupPlayerTeeTimeScheduleResponseToJson(this);
}
