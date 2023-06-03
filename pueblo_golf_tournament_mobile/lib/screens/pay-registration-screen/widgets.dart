import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';

import '../../utilities/enums.dart';

class PaymentMethodForm extends StatelessWidget {
  final bool isWeb;
  final PaymentMethodEnum paymentMethod;
  final Function(PaymentMethodEnum) selectPaymentMethod;
  final Function uploadProofOfPayment;
  final File? proofOfPaymentImage;
  final Uint8List? proofOfPaymentImageWeb;
  final TextEditingController paymentReferrenceIdTextController;
  const PaymentMethodForm(
      {super.key,
      required this.paymentMethod,
      required this.selectPaymentMethod,
      required this.uploadProofOfPayment,
      this.proofOfPaymentImage,
      required this.paymentReferrenceIdTextController,
      this.proofOfPaymentImageWeb,
      required this.isWeb});
  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 20,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(22, 20, 22, 20),
                    child: Text(
                      "Select Payment Method",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListView(
                    padding: EdgeInsets.all(0),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      ListTile(
                        title: const Text('GCash'),
                        onTap: () =>
                            selectPaymentMethod(PaymentMethodEnum.GCash),
                        leading: Radio<PaymentMethodEnum>(
                          value: PaymentMethodEnum.GCash,
                          groupValue: paymentMethod,
                          onChanged: (PaymentMethodEnum? value) =>
                              selectPaymentMethod(value!),
                        ),
                      ),
                      ListTile(
                        title: const Text('Bank Deposit'),
                        onTap: () =>
                            selectPaymentMethod(PaymentMethodEnum.BankDeposit),
                        leading: Radio<PaymentMethodEnum>(
                          value: PaymentMethodEnum.BankDeposit,
                          groupValue: paymentMethod,
                          onChanged: (PaymentMethodEnum? value) =>
                              selectPaymentMethod(value!),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ))
          ],
        ),
        TextField(
          decoration: InputDecoration(hintText: "Referrence Id"),
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
