import 'package:json_annotation/json_annotation.dart';
import 'package:pueblo_golf_tournament_mobile/base/base-response.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/leader-board-dto.dart';

import '../model/division-dto.dart';

part 'lookup-leader-board-response-dto.g.dart';

@JsonSerializable()
class LookupLeaderBoardResponseDto extends BaseResponse {
  final List<DivisionLeaderBoard> data;

  LookupLeaderBoardResponseDto({required this.data, required super.message});

  factory LookupLeaderBoardResponseDto.fromJson(Map<String, dynamic> json) =>
      _$LookupLeaderBoardResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LookupLeaderBoardResponseDtoToJson(this);
}

@JsonSerializable()
class DivisionLeaderBoard {
  final DivisionDto division;
  final List<LeaderBoardDto>? leaderBoard;

  DivisionLeaderBoard({required this.division, required this.leaderBoard});

  factory DivisionLeaderBoard.fromJson(Map<String, dynamic> json) =>
      _$DivisionLeaderBoardFromJson(json);

  Map<String, dynamic> toJson() => _$DivisionLeaderBoardToJson(this);
}
