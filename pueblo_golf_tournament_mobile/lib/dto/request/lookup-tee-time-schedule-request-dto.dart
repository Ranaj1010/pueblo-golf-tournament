import 'package:json_annotation/json_annotation.dart';

part 'lookup-tee-time-schedule-request-dto.g.dart';

@JsonSerializable()
class LookupTeeTimeScheduleRequest {
  final int tournamentId;
  LookupTeeTimeScheduleRequest({required this.tournamentId});

  factory LookupTeeTimeScheduleRequest.fromJson(Map<String, dynamic> json) =>
      _$LookupTeeTimeScheduleRequestFromJson(json);
  Map<String, dynamic> toJson() => _$LookupTeeTimeScheduleRequestToJson(this);
}
