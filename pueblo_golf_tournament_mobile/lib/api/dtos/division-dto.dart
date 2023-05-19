import 'package:json_annotation/json_annotation.dart';

import '../../models/base-model.dart';
part 'division-dto.g.dart';

@JsonSerializable()
class DivisionDto extends BaseModel {
  final String name;
  final double tournamentId;

  DivisionDto(
      {required this.name, required this.tournamentId, required super.id});

  factory DivisionDto.fromJson(Map<String, dynamic> json) =>
      _$DivisionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DivisionDtoToJson(this);
}
