import 'package:pueblo_golf_tournament_mobile/base/base-dto.dart';

import 'package:json_annotation/json_annotation.dart';

part 'payment-channel-dto.g.dart';

@JsonSerializable()
class PaymentChannelDto extends BaseDto {
  final String name;
  final String description;
  PaymentChannelDto({
    required super.id,
    required this.name,
    required this.description,
  });

  factory PaymentChannelDto.fromJson(Map<String, dynamic> json) =>
      _$PaymentChannelDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PaymentChannelDtoToJson(this);
}
