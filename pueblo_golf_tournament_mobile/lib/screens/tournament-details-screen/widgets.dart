import 'package:flutter/material.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/lookup-tournament-team-response-dto.dart';

class RegisteredTeamList extends StatelessWidget {
  final List<RegisteredTeam> registeredTeams;
  final bool isLoading;
  final Function(RegisteredTeam) onSelectTeam;
  const RegisteredTeamList(
      {super.key,
      required this.registeredTeams,
      required this.isLoading,
      required this.onSelectTeam});

  Widget status(int value) {
    switch (value) {
      case 0:
        return Text(
          "Pending",
          style: TextStyle(color: Colors.orange),
        );

      case 1:
        return Text(
          "Confirmed",
          style: TextStyle(color: Colors.green),
        );

      case 2:
        return Text(
          "Cancelled",
          style: TextStyle(color: Colors.red),
        );

      default:
        return Text("Unknown");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 10,
      children: [
        const Text(
          "My Team",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Card(
                elevation: 10,
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: ListView.separated(
                    padding: const EdgeInsets.all(0),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => ListTile(
                          onTap: () => onSelectTeam(registeredTeams[index]),
                          trailing: Icon(Icons.chevron_right),
                          leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  registeredTeams[index].team.logoUrl!)),
                          title: Text(
                            registeredTeams[index].team.name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: status(
                              registeredTeams[index].registration.status),
                        ),
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: registeredTeams.length),
              ),
      ],
    );
  }
}
