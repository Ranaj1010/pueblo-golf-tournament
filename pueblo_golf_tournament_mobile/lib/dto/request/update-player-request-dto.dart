import 'package:json_annotation/json_annotation.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/player-dto.dart';

part 'update-player-request-dto.g.dart';

@JsonSerializable()
class UpdatePlayerRequestDto {
  final PlayerDto player;

  UpdatePlayerRequestDto({required this.player});

  factory UpdatePlayerRequestDto.fromJson(Map<String, dynamic> json) =>
      _$UpdatePlayerRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UpdatePlayerRequestDtoToJson(this);
}
