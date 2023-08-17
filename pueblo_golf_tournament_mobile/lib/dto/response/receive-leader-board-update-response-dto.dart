import 'package:json_annotation/json_annotation.dart';
import 'package:pueblo_golf_tournament_mobile/base/base-response.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/leader-board-dto.dart';

import '../model/division-dto.dart';
import 'lookup-leader-board-response-dto.dart';

part 'receive-leader-board-update-response-dto.g.dart';

@JsonSerializable()
class ReceiveLeaderBoardUpdateResponseDto {
  final List<DivisionLeaderBoard> data;

  ReceiveLeaderBoardUpdateResponseDto({required this.data});

  factory ReceiveLeaderBoardUpdateResponseDto.fromJson(
          Map<String, dynamic> json) =>
      _$ReceiveLeaderBoardUpdateResponseDtoFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ReceiveLeaderBoardUpdateResponseDtoToJson(this);
}
