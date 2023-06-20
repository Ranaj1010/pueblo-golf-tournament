import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/payment-channel-account-dto.dart';

import '../../utilities/enums.dart';

class PaymentMethodForm extends StatelessWidget {
  final bool isWeb;
  final PaymentChannelAccountDto? selectedPaymentChannelAccount;
  final Function selectPaymentMethod;
  final Function uploadProofOfPayment;
  final File? proofOfPaymentImage;
  final Uint8List? proofOfPaymentImageWeb;

  final TextEditingController accountNumberTextController;
  final TextEditingController accountNameTextController;
  final TextEditingController paymentReferrenceIdTextController;
  final TextEditingController paymentMethodTextController;
  const PaymentMethodForm(
      {super.key,
      required this.selectPaymentMethod,
      required this.uploadProofOfPayment,
      this.proofOfPaymentImage,
      required this.paymentReferrenceIdTextController,
      this.proofOfPaymentImageWeb,
      required this.isWeb,
      required this.selectedPaymentChannelAccount,
      required this.accountNumberTextController,
      required this.accountNameTextController,
      required this.paymentMethodTextController});
  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 20,
      children: [
        TextField(
          onTap: () => selectPaymentMethod(),
          decoration: const InputDecoration(
              hintText: "Payment Method",
              suffixIcon: Icon(Icons.chevron_right)),
          readOnly: true,
          controller: paymentMethodTextController,
        ),
        TextField(
          decoration: const InputDecoration(hintText: "Account No."),
          controller: accountNameTextController,
        ),
        TextField(
          decoration: const InputDecoration(hintText: "Account Name."),
          controller: accountNumberTextController,
        ),
        TextField(
          decoration: const InputDecoration(hintText: "Referrence Id"),
          controller: paymentReferrenceIdTextController,
        ),
        SizedBox(
          height: 350,
          width: double.infinity,
          child: Card(
            elevation: 0,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            semanticContainer: true,
            shape: RoundedRectangleBorder(
                side: BorderSide(width: 0.5, color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0)),
            child: InkWell(
              onTap: () => uploadProofOfPayment(),
              child:
                  proofOfPaymentImage != null || proofOfPaymentImageWeb != null
                      ? isWeb
                          ? Image(
                              image: MemoryImage(proofOfPaymentImageWeb!),
                              fit: BoxFit.cover,
                            )
                          : Image(
                              image: FileImage(proofOfPaymentImage!),
                              fit: BoxFit.cover,
                            )
                      : const Padding(
                          padding: EdgeInsets.all(20),
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            direction: Axis.vertical,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            spacing: 10,
                            runAlignment: WrapAlignment.center,
                            children: [
                              Icon(Icons.cloud_upload_outlined),
                              Text(
                                "Upload Payment \nScreen shot",
                                textAlign: TextAlign.center,
                              ),
                            ],
                          )),
            ),
          ),
        ),
      ],
    );
  }
}

class PaymentSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        children: [
          Text(
            "You have successfully paid your team's registration. Please wait for the organizers confirmation for your registration.",
            style: TextStyle(
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
