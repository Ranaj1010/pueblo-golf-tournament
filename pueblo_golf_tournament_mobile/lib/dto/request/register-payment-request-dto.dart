import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:json_annotation/json_annotation.dart';

class RegisterPaymentRequestDto {
  final String paymentMethod;
  final int registrationId;
  final String referrenceId;
  final DateTime paymentDate;
  final File paymentReferrencePhoto;

  RegisterPaymentRequestDto({
    required this.paymentMethod,
    required this.registrationId,
    required this.referrenceId,
    required this.paymentDate,
    required this.paymentReferrencePhoto,
  });
}

class RegisterPaymentWebRequestDto {
  final String paymentMethod;
  final int registrationId;
  final String referrenceId;
  final DateTime paymentDate;
  final Uint8List paymentReferrencePhoto;

  RegisterPaymentWebRequestDto({
    required this.paymentMethod,
    required this.registrationId,
    required this.referrenceId,
    required this.paymentDate,
    required this.paymentReferrencePhoto,
  });
}
