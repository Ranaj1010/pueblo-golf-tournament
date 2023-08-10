import 'package:json_annotation/json_annotation.dart';
import 'package:pueblo_golf_tournament_mobile/base/base-response.dart';

import '../model/tee-time-schedule-dto.dart';

part 'lookup-tee-time-schedules-response-dto.g.dart';

@JsonSerializable()
class LookupTeeTimeScheduleResponse extends BaseResponse {
  final List<TournamentScheduleDate>? data;
  LookupTeeTimeScheduleResponse({required super.message, required this.data});

  factory LookupTeeTimeScheduleResponse.fromJson(Map<String, dynamic> json) =>
      _$LookupTeeTimeScheduleResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LookupTeeTimeScheduleResponseToJson(this);
}

@JsonSerializable()
class TournamentScheduleDate {
  final int holeType;
  final DateTime date;
  final List<TeeTimeScheduleDto>? timeSchedules;
  TournamentScheduleDate({
    required this.timeSchedules,
    required this.date,
    required this.holeType,
  });

  factory TournamentScheduleDate.fromJson(Map<String, dynamic> json) =>
      _$TournamentScheduleDateFromJson(json);
  Map<String, dynamic> toJson() => _$TournamentScheduleDateToJson(this);
}
