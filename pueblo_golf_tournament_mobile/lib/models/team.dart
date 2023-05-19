import 'package:json_annotation/json_annotation.dart';
import 'package:pueblo_golf_tournament_mobile/models/division.dart';
import 'package:pueblo_golf_tournament_mobile/models/home-club.dart';
import 'package:pueblo_golf_tournament_mobile/models/person.dart';
import 'package:pueblo_golf_tournament_mobile/utilities/enums.dart';

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
