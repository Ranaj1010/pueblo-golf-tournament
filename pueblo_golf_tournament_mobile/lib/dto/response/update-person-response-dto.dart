import 'package:json_annotation/json_annotation.dart';
import 'package:pueblo_golf_tournament_mobile/base/base-response.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/person-dto.dart';

part 'update-person-response-dto.g.dart';

@JsonSerializable()
class UpdatePersonResponseDto extends BaseResponse {
  final PersonDto? data;

  factory UpdatePersonResponseDto.fromJson(Map<String, dynamic> json) =>
      _$UpdatePersonResponseDtoFromJson(json);

  UpdatePersonResponseDto({required super.message, required this.data});
  Map<String, dynamic> toJson() => _$UpdatePersonResponseDtoToJson(this);
}
