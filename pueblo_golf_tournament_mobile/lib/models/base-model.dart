import 'package:json_annotation/json_annotation.dart';
part 'base-model.g.dart';

@JsonSerializable()
class BaseModel {
  final int id;

  BaseModel({required this.id});

  factory BaseModel.fromJson(Map<String, dynamic> json) =>
      _$BaseModelFromJson(json);
  Map<String, dynamic> toJson() => _$BaseModelToJson(this);
}
