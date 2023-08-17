import 'package:json_annotation/json_annotation.dart';

part 'lookup-leader-board-request-dto.g.dart';

@JsonSerializable()
class LookupLeaderBoardRequestDto {
  final int tournamentId;

  LookupLeaderBoardRequestDto({required this.tournamentId});

  factory LookupLeaderBoardRequestDto.fromJson(Map<String, dynamic> json) =>
      _$LookupLeaderBoardRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$LookupLeaderBoardRequestDtoToJson(this);
}
