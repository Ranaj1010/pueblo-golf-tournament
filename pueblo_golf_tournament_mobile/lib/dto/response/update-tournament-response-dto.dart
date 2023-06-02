import 'package:json_annotation/json_annotation.dart';
import 'package:pueblo_golf_tournament_mobile/base/base-response.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/tournament-dto.dart';

part 'update-tournament-response-dto.g.dart';

@JsonSerializable()
class UpdateTournamentResponseDto extends BaseResponse {
  final TournamentDto? data;

  factory UpdateTournamentResponseDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateTournamentResponseDtoFromJson(json);

  UpdateTournamentResponseDto({required super.message, required this.data});
  Map<String, dynamic> toJson() => _$UpdateTournamentResponseDtoToJson(this);
}
