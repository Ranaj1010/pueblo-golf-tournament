// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receive-leader-board-update-response-dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReceiveLeaderBoardUpdateResponseDto
    _$ReceiveLeaderBoardUpdateResponseDtoFromJson(Map<String, dynamic> json) =>
        ReceiveLeaderBoardUpdateResponseDto(
          data: (json['data'] as List<dynamic>)
              .map((e) =>
                  DivisionLeaderBoard.fromJson(e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$ReceiveLeaderBoardUpdateResponseDtoToJson(
        ReceiveLeaderBoardUpdateResponseDto instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
