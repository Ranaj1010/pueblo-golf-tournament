import 'package:pueblo_golf_tournament_mobile/base/base-response.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/tournament-dto.dart';
import 'package:json_annotation/json_annotation.dart';

import '../model/payment-channel-dto.dart';

part 'lookup-payment-channels-response-dto.g.dart';

@JsonSerializable()
class LookupPaymentChannelsResponseDto extends BaseResponse {
  final List<PaymentChannelDto>? data;

  LookupPaymentChannelsResponseDto(
      {required this.data, required super.message});
  factory LookupPaymentChannelsResponseDto.fromJson(
          Map<String, dynamic> json) =>
      _$LookupPaymentChannelsResponseDtoFromJson(json);
  Map<String, dynamic> toJson() =>
      _$LookupPaymentChannelsResponseDtoToJson(this);
}
