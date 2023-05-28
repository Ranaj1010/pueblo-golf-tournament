import 'package:pueblo_golf_tournament_mobile/base/base-response.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/tournament-dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lookup-tournament-response-dto.g.dart';

@JsonSerializable()
class LookupTournamentResponseDto extends BaseResponse {
  final List<TournamentDto>? data;

  LookupTournamentResponseDto({required this.data, required super.message});
  factory LookupTournamentResponseDto.fromJson(Map<String, dynamic> json) =>
      _$LookupTournamentResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$LookupTournamentResponseDtoToJson(this);
}
