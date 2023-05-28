import 'package:json_annotation/json_annotation.dart';
import 'package:pueblo_golf_tournament_mobile/base/base-dto.dart';
part 'team-dto.g.dart';

@JsonSerializable()
class TeamDto extends BaseDto {
  final String name;
  final String? logoUrl;
  final int teamCaptainId;
  TeamDto({
    required super.id,
    required this.name,
    required this.logoUrl,
    required this.teamCaptainId,
  });

  factory TeamDto.fromJson(Map<String, dynamic> json) =>
      _$TeamDtoFromJson(json);
  Map<String, dynamic> toJson() => _$TeamDtoToJson(this);
}
