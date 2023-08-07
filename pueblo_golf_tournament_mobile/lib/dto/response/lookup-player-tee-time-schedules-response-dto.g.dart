// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lookup-player-tee-time-schedules-response-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LookupPlayerTeeTimeScheduleResponse
    _$LookupPlayerTeeTimeScheduleResponseFromJson(Map<String, dynamic> json) =>
        LookupPlayerTeeTimeScheduleResponse(
          message: json['message'] as String,
          data: (json['data'] as List<dynamic>?)
              ?.map((e) =>
                  TournamentScheduleDate.fromJson(e as Map<String, dynamic>))
              .toList(),
          playerId: json['playerId'] as int,
        );

Map<String, dynamic> _$LookupPlayerTeeTimeScheduleResponseToJson(
        LookupPlayerTeeTimeScheduleResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'playerId': instance.playerId,
      'data': instance.data,
    };
