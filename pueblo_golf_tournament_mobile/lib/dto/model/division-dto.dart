import 'package:pueblo_golf_tournament_mobile/base/base-dto.dart';

import 'package:json_annotation/json_annotation.dart';

part 'division-dto.g.dart';

@JsonSerializable()
class DivisionDto extends BaseDto {
  final String name;
  final int tournamentId;
  DivisionDto({
    required super.id,
    required this.name,
    required this.tournamentId,
  });
  factory DivisionDto.fromJson(Map<String, dynamic> json) =>
      _$DivisionDtoFromJson(json);
  Map<String, dynamic> toJson() => _$DivisionDtoToJson(this);
}
