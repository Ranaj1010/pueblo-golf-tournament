import 'package:json_annotation/json_annotation.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/person-dto.dart';

part 'update-person-request-dto.g.dart';

@JsonSerializable()
class UpdatePersonRequestDto {
  final PersonDto person;

  UpdatePersonRequestDto({required this.person});

  factory UpdatePersonRequestDto.fromJson(Map<String, dynamic> json) =>
      _$UpdatePersonRequestDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UpdatePersonRequestDtoToJson(this);
}
