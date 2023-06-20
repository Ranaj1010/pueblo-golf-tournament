import 'package:json_annotation/json_annotation.dart';

part 'lookup-payment-channel-accounts-request-dto.g.dart';

@JsonSerializable()
class LookupPaymentChannelAccountsRequestDto {
  final int tournamentId;

  factory LookupPaymentChannelAccountsRequestDto.fromJson(
          Map<String, dynamic> json) =>
      _$LookupPaymentChannelAccountsRequestDtoFromJson(json);

  LookupPaymentChannelAccountsRequestDto({required this.tournamentId});
  Map<String, dynamic> toJson() =>
      _$LookupPaymentChannelAccountsRequestDtoToJson(this);
}
