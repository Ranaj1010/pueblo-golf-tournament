import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/lookup-tournament-team-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/utilities/enums.dart';

class TeamForm extends StatelessWidget {
  final TextEditingController teamNameTextController;

  const TeamForm({
    super.key,
    required this.teamNameTextController,
  });
  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 20,
      children: [
        TextField(
          decoration: const InputDecoration(hintText: "Team Name"),
          controller: teamNameTextController,
        ),
      ],
    );
  }
}

class AddMembersForm extends StatelessWidget {
  final Function onAddMember;
  final List<PlayerProfile> members;

  const AddMembersForm(
      {super.key, required this.onAddMember, required this.members});
  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 20,
      children: [
        members.isNotEmpty
            ? Card(
                child: ListView.separated(
                    padding: EdgeInsets.all(0),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => ListTile(
                          leading: CircleAvatar(child: Icon(Icons.person)),
                          title: Text(
                              "${members[index].person.firstName} ${members[index].person.lastName}"),
                          subtitle:
                              Text("${members[index].player.playerExternalId}"),
                        ),
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: members.length),
              )
            : Padding(padding: EdgeInsets.all(0)),
        SizedBox(
            width: double.infinity,
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              semanticContainer: true,
              child: InkWell(
                onTap: () => onAddMember(),
                child: ListTile(
                  title: Text("Add Member"),
                  trailing: Icon(Icons.add),
                ),
              ),
            ))
      ],
    );
  }
}

class PaymentMethodForm extends StatelessWidget {
  final PaymentMethodEnum paymentMethod;
  final Function(PaymentMethodEnum) selectPaymentMethod;
  final Function uploadProofOfPayment;
  final File? proofOfPaymentImage;
  final TextEditingController paymentReferrenceIdTextController;
  const PaymentMethodForm(
      {super.key,
      required this.paymentMethod,
      required this.selectPaymentMethod,
      required this.uploadProofOfPayment,
      this.proofOfPaymentImage,
      required this.paymentReferrenceIdTextController});
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
              surfaceTintColor: Colors.white,
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
              child: proofOfPaymentImage != null
                  ? Image(
                      image: FileImage(proofOfPaymentImage!),
                      fit: BoxFit.cover,
                    )
                  : Padding(
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

class ConfirmationForm extends StatelessWidget {
  final bool isUnderstood;
  final Function(bool value) onTapUnderstand;
  final List<PlayerProfile> members;
  final String teamName;
  const ConfirmationForm(
      {super.key,
      required this.isUnderstood,
      required this.onTapUnderstand,
      required this.members,
      required this.teamName});
  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 20,
      children: [
        Text(
          "Team",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromARGB(255, 232, 255, 240),
          ),
          width: double.infinity,
          child: Wrap(
            spacing: 10,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              CircleAvatar(child: Text(teamName[0])),
              Text(
                teamName,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )
            ],
          ),
        ),
        Text(
          "Members",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Card(
          child: ListView.separated(
              padding: EdgeInsets.all(0),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => ListTile(
                    leading: CircleAvatar(child: Icon(Icons.person)),
                    title: Text(
                        "${members[index].person.firstName} ${members[index].person.lastName}"),
                    subtitle: Text("${members[index].player.playerExternalId}"),
                  ),
              separatorBuilder: (context, index) => Divider(),
              itemCount: members.length),
        ),
        Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromARGB(255, 255, 239, 204),
          ),
          child: const Padding(
            padding: EdgeInsets.all(20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Reminder:",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.deepOrange),
              ),
              Padding(padding: EdgeInsets.all(10)),
              Text(
                  "Please pay the Registration Fee within 15 days upon submission of registration. Failure to pay  forfeits your team slot in the tournament.\n\nThank you and happy golfing! :)"),
            ]),
          ),
        ),
        InkWell(
          onTap: () => onTapUnderstand(!isUnderstood),
          child: Row(
            children: [
              Checkbox(
                value: isUnderstood,
                onChanged: (value) => onTapUnderstand(!isUnderstood),
              ),
              const Text("I understand and continue my registration.")
            ],
          ),
        )
      ],
    );
  }
}

class TeamRegistrationSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        children: [
          Text(
            "You have successfully created your team. Please wait for the organizers confirmation for your registration.",
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
