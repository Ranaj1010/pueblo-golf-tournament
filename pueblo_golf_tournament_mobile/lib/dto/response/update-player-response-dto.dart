import 'package:json_annotation/json_annotation.dart';
import 'package:pueblo_golf_tournament_mobile/base/base-response.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/player-dto.dart';

part 'update-player-response-dto.g.dart';

@JsonSerializable()
class UpdatePlayerResponseDto extends BaseResponse {
  final PlayerDto? data;

  factory UpdatePlayerResponseDto.fromJson(Map<String, dynamic> json) =>
      _$UpdatePlayerResponseDtoFromJson(json);

  UpdatePlayerResponseDto({required super.message, required this.data});
  Map<String, dynamic> toJson() => _$UpdatePlayerResponseDtoToJson(this);
}
