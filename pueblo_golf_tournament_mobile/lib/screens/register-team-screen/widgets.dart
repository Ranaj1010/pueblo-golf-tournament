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
            : const Padding(padding: EdgeInsets.all(0)),
        members.length < 4
            ? SizedBox(
                width: double.infinity,
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  semanticContainer: true,
                  child: InkWell(
                    onTap: () => onAddMember(),
                    child: const ListTile(
                      title: Text("Add Member"),
                      trailing: Icon(Icons.add),
                    ),
                  ),
                ))
            : const Padding(padding: EdgeInsets.all(0))
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
