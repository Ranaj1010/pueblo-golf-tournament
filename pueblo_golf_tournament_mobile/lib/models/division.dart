import 'package:json_annotation/json_annotation.dart';

import 'base-model.dart';
part 'division.g.dart';

@JsonSerializable()
class Division extends BaseModel {
  final String name;
  final double tournamentId;

  Division({required this.name, required this.tournamentId, required super.id});

  factory Division.fromJson(Map<String, dynamic> json) =>
      _$DivisionFromJson(json);

  Map<String, dynamic> toJson() => _$DivisionToJson(this);
}
