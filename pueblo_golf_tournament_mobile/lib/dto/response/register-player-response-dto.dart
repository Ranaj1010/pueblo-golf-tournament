import 'package:pueblo_golf_tournament_mobile/base/base-response.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/player-dto.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/lookup-tournament-team-response-dto.dart';

part 'register-player-response-dto.g.dart';

@JsonSerializable()
class RegisterPlayerResponseDto extends BaseResponse {
  final PlayerProfile? playerProfile;
  RegisterPlayerResponseDto({
    required super.message,
    required this.playerProfile,
  });

  factory RegisterPlayerResponseDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterPlayerResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterPlayerResponseDtoToJson(this);
}
