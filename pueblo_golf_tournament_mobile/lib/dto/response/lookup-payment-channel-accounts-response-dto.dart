import 'package:pueblo_golf_tournament_mobile/base/base-response.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/payment-channel-account-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/tournament-dto.dart';
import 'package:json_annotation/json_annotation.dart';

import '../model/payment-channel-dto.dart';

part 'lookup-payment-channel-accounts-response-dto.g.dart';

@JsonSerializable()
class LookupPaymentChannelAccountsResponseDto extends BaseResponse {
  final List<PaymentChannelAccountDto>? data;

  LookupPaymentChannelAccountsResponseDto(
      {required this.data, required super.message});
  factory LookupPaymentChannelAccountsResponseDto.fromJson(
          Map<String, dynamic> json) =>
      _$LookupPaymentChannelAccountsResponseDtoFromJson(json);
  Map<String, dynamic> toJson() =>
      _$LookupPaymentChannelAccountsResponseDtoToJson(this);
}
