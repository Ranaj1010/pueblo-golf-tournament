import 'package:json_annotation/json_annotation.dart';
import 'package:pueblo_golf_tournament_mobile/base/base-response.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/person-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/scorer-dto.dart';

part 'lookup-scorer-profile-response-dto.g.dart';

@JsonSerializable()
class LookupScorerProfileResponseDto extends BaseResponse {
  final List<ScorerProfile> data;

  LookupScorerProfileResponseDto({required super.message, required this.data});

  factory LookupScorerProfileResponseDto.fromJson(Map<String, dynamic> json) =>
      _$LookupScorerProfileResponseDtoFromJson(json);
  Map<String, dynamic> toJson() => _$LookupScorerProfileResponseDtoToJson(this);
}

@JsonSerializable()
class ScorerProfile {
  final PersonDto? person;
  final ScorerDto? scorer;

  ScorerProfile({this.person, this.scorer});

  factory ScorerProfile.fromJson(Map<String, dynamic> json) =>
      _$ScorerProfileFromJson(json);
  Map<String, dynamic> toJson() => _$ScorerProfileToJson(this);
}
