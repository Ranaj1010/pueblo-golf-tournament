import 'package:json_annotation/json_annotation.dart';
import 'package:pueblo_golf_tournament_mobile/models/division.dart';
import 'package:pueblo_golf_tournament_mobile/models/home-club.dart';
import 'package:pueblo_golf_tournament_mobile/models/person.dart';
import 'package:pueblo_golf_tournament_mobile/utilities/enums.dart';

import '../../models/base-model.dart';
part 'team-dto.g.dart';

@JsonSerializable()
class TeamDto extends BaseModel {
  final String? name;
  final String? logoUrl;

  factory TeamDto.fromJson(Map<String, dynamic> json) =>
      _$TeamDtoFromJson(json);

  TeamDto({
    required super.id,
    this.name,
    this.logoUrl,
  });

  Map<String, dynamic> toJson() => _$TeamDtoToJson(this);
}
