import 'package:pueblo_golf_tournament_mobile/base/base-response.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/tournament-team-division-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/register-payment-request-dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register-team-division-response-dto.g.dart';

@JsonSerializable()
class RegisterTeamDivisionResponseDto extends BaseResponse {
  final TournamentTeamDivisionDto? data;

  RegisterTeamDivisionResponseDto({required super.message, required this.data});

  factory RegisterTeamDivisionResponseDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterTeamDivisionResponseDtoFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RegisterTeamDivisionResponseDtoToJson(this);
}
