import 'package:json_annotation/json_annotation.dart';

part 'lookup-payment-channels-request-dto.g.dart';

@JsonSerializable()
class LookupPaymentChannelsRequestDto {
  final String filterName;

  LookupPaymentChannelsRequestDto({required this.filterName});
  factory LookupPaymentChannelsRequestDto.fromJson(Map<String, dynamic> json) =>
      _$LookupPaymentChannelsRequestDtoFromJson(json);
  Map<String, dynamic> toJson() =>
      _$LookupPaymentChannelsRequestDtoToJson(this);
}
