import 'package:pueblo_golf_tournament_mobile/base/base-response.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/tournament-dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register-tournament-response-dto.g.dart';

@JsonSerializable()
class RegisterTournamentResponseDto extends BaseResponse {
  final TournamentDto? data;

  RegisterTournamentResponseDto({required super.message, required this.data});
  factory RegisterTournamentResponseDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterTournamentResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterTournamentResponseDtoToJson(this);
}
