import 'package:json_annotation/json_annotation.dart';
import 'base-model.dart';
part 'team.g.dart';

@JsonSerializable()
class Team extends BaseModel {
  final String? name;
  final String? logoUrl;

  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);

  Team(this.name, this.logoUrl, {required super.id});

  Map<String, dynamic> toJson() => _$TeamToJson(this);
}
