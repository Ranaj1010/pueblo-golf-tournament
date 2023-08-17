import 'package:pueblo_golf_tournament_mobile/base/base-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/person-dto.dart';

import 'package:json_annotation/json_annotation.dart';

part 'scorer-dto.g.dart';

@JsonSerializable()
class ScorerDto extends BaseDto {
  ScorerDto({
    required super.id,
  });
  factory ScorerDto.fromJson(Map<String, dynamic> json) =>
      _$ScorerDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ScorerDtoToJson(this);
}
