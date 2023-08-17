import 'package:pueblo_golf_tournament_mobile/base/base-response.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/register-account-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/register-person-request-dto.dart';

import 'package:json_annotation/json_annotation.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/lookup-scorer-profile-response-dto.dart';

part 'register-tournament-scorer-response-dto.g.dart';

@JsonSerializable()
class ReqisterTournamentScorerResponseDto extends BaseResponse {
  final bool success;

  ReqisterTournamentScorerResponseDto(
      {required super.message, required this.success});

  factory ReqisterTournamentScorerResponseDto.fromJson(
          Map<String, dynamic> json) =>
      _$ReqisterTournamentScorerResponseDtoFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ReqisterTournamentScorerResponseDtoToJson(this);
}
