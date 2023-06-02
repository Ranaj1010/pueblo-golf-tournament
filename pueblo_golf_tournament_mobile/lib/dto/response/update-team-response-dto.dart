import 'package:json_annotation/json_annotation.dart';
import 'package:pueblo_golf_tournament_mobile/base/base-response.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/team-dto.dart';

part 'update-team-response-dto.g.dart';

@JsonSerializable()
class UpdateTeamResponseDto extends BaseResponse {
  final TeamDto? data;

  factory UpdateTeamResponseDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateTeamResponseDtoFromJson(json);

  UpdateTeamResponseDto({required super.message, required this.data});
  Map<String, dynamic> toJson() => _$UpdateTeamResponseDtoToJson(this);
}
