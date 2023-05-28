import 'dart:io';

class UploadMobileProofOfPaymentRequestDto {
  final int paymentId;
  final File paymentImage;

  UploadMobileProofOfPaymentRequestDto(
      {required this.paymentId, required this.paymentImage});

  toJson() {}
}
