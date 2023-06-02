import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class PersonalInfoForm extends StatelessWidget {
  final TextEditingController firstNameTextController;
  final TextEditingController middleNameTextController;
  final TextEditingController lastNameTextController;
  final TextEditingController birthDateTextController;

  const PersonalInfoForm(
      {super.key,
      required this.firstNameTextController,
      required this.middleNameTextController,
      required this.lastNameTextController,
      required this.birthDateTextController});
  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 20,
      children: [
        TextField(
          decoration: const InputDecoration(hintText: "First Name"),
          controller: firstNameTextController,
        ),
        TextField(
          decoration: const InputDecoration(hintText: "Middle Name"),
          controller: middleNameTextController,
        ),
        TextField(
          decoration: const InputDecoration(hintText: "Last Name"),
          controller: lastNameTextController,
        ),
        TextField(
          readOnly: true,
          controller: birthDateTextController,
          decoration: const InputDecoration(
              hintText: 'BirthDate', suffixIcon: Icon(Icons.date_range)),
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(), //get today's date
                firstDate: DateTime(
                    1900), //DateTime.now() - not to allow to choose before today.
                lastDate: DateTime(2101));

            if (pickedDate != null) {
              String formattedDate =
                  DateFormat('MMMM dd, yyyy').format(pickedDate);
              birthDateTextController.text = formattedDate;
            } else {
              print("Date is not selected");
            }
          },
        ),
      ],
    );
  }
}

class ContactForm extends StatelessWidget {
  final TextEditingController mobileNumberTextController;
  final TextEditingController emailAddressTextController;
  final TextEditingController homeAddressTextController;
  final TextEditingController cityTextController;
  final TextEditingController countryTextController;

  const ContactForm(
      {super.key,
      required this.mobileNumberTextController,
      required this.emailAddressTextController,
      required this.homeAddressTextController,
      required this.cityTextController,
      required this.countryTextController});
  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 20,
      children: [
        TextField(
          decoration: InputDecoration(hintText: "Mobile Number"),
          controller: mobileNumberTextController,
        ),
        TextField(
          decoration: InputDecoration(hintText: "Email Address"),
          controller: emailAddressTextController,
        ),
        TextField(
          decoration: InputDecoration(hintText: "Home Address"),
          controller: homeAddressTextController,
        ),
        TextField(
          decoration: InputDecoration(hintText: "City"),
          controller: cityTextController,
        ),
        TextField(
          decoration: InputDecoration(hintText: "Country"),
          controller: countryTextController,
        ),
      ],
    );
  }
}

class PlayerForm extends StatelessWidget {
  final TextEditingController homeClubTextController;
  final TextEditingController worldHandicapSystemIdTextController;

  const PlayerForm(
      {super.key,
      required this.homeClubTextController,
      required this.worldHandicapSystemIdTextController});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 20,
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: "Home Club",
          ),
          controller: homeClubTextController,
        ),
        TextField(
          decoration: const InputDecoration(
              hintText: "World Handicap System Id",
              helperText: "If no WHS, enter '0'"),
          controller: worldHandicapSystemIdTextController,
        ),
      ],
    );
  }
}

class SignUpSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        children: [
          Text(
            "You have successfully created your account.",
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
