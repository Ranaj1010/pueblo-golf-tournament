// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lookup-leader-board-response-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LookupLeaderBoardResponseDto _$LookupLeaderBoardResponseDtoFromJson(
        Map<String, dynamic> json) =>
    LookupLeaderBoardResponseDto(
      data: (json['data'] as List<dynamic>)
          .map((e) => DivisionLeaderBoard.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$LookupLeaderBoardResponseDtoToJson(
        LookupLeaderBoardResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

DivisionLeaderBoard _$DivisionLeaderBoardFromJson(Map<String, dynamic> json) =>
    DivisionLeaderBoard(
      division: DivisionDto.fromJson(json['division'] as Map<String, dynamic>),
      leaderBoard: (json['leaderBoard'] as List<dynamic>?)
          ?.map((e) => LeaderBoardDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DivisionLeaderBoardToJson(
        DivisionLeaderBoard instance) =>
    <String, dynamic>{
      'division': instance.division,
      'leaderBoard': instance.leaderBoard,
    };
