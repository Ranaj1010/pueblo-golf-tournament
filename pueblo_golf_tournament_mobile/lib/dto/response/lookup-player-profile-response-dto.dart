import 'package:json_annotation/json_annotation.dart';
import 'package:pueblo_golf_tournament_mobile/base/base-response.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/lookup-tournament-team-response-dto.dart';

part 'lookup-player-profile-response-dto.g.dart';

@JsonSerializable()
class LookupPlayeProfileResponseDto extends BaseResponse {
  final PlayerProfile? profile;

  factory LookupPlayeProfileResponseDto.fromJson(Map<String, dynamic> json) =>
      _$LookupPlayeProfileResponseDtoFromJson(json);

  LookupPlayeProfileResponseDto({required super.message, this.profile});
  Map<String, dynamic> toJson() => _$LookupPlayeProfileResponseDtoToJson(this);
}
