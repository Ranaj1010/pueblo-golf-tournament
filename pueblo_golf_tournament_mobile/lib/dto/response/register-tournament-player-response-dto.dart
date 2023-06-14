import 'package:pueblo_golf_tournament_mobile/base/base-response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/lookup-tournament-team-response-dto.dart';

import '../model/tournament-player-dto.dart';

part 'register-tournament-player-response-dto.g.dart';

@JsonSerializable()
class RegisterTournamentPlayerResponseDto extends BaseResponse {
  final TournamentPlayerDto? playerProfile;
  RegisterTournamentPlayerResponseDto({
    required super.message,
    required this.playerProfile,
  });

  factory RegisterTournamentPlayerResponseDto.fromJson(
          Map<String, dynamic> json) =>
      _$RegisterTournamentPlayerResponseDtoFromJson(json);
  Map<String, dynamic> toJson() =>
      _$RegisterTournamentPlayerResponseDtoToJson(this);
}
