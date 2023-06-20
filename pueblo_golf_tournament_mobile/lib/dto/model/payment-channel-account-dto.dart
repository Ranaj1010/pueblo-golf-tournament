import 'package:pueblo_golf_tournament_mobile/base/base-dto.dart';

import 'package:json_annotation/json_annotation.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/payment-channel-dto.dart';

part 'payment-channel-account-dto.g.dart';

@JsonSerializable()
class PaymentChannelAccountDto extends BaseDto {
  final int paymentChannelId;
  final int tournamentId;
  final String accountName;
  final String accountNumber;
  final PaymentChannelDto? paymentChannel;
  PaymentChannelAccountDto({
    required super.id,
    required this.paymentChannelId,
    required this.tournamentId,
    required this.accountName,
    required this.accountNumber,
    this.paymentChannel,
  });

  factory PaymentChannelAccountDto.fromJson(Map<String, dynamic> json) =>
      _$PaymentChannelAccountDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PaymentChannelAccountDtoToJson(this);
}
