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

class AccountForm extends StatelessWidget {
  final TextEditingController usernameTextController;
  final TextEditingController passwordTextController;
  final TextEditingController confirmPasswordTextController;
  final bool isPasswordPeeked;
  final bool isConfirmPasswordPeeked;
  final Function peekPassword;
  final Function peekConfirmPassword;
  const AccountForm(
      {super.key,
      required this.usernameTextController,
      required this.passwordTextController,
      required this.confirmPasswordTextController,
      required this.isPasswordPeeked,
      required this.isConfirmPasswordPeeked,
      required this.peekPassword,
      required this.peekConfirmPassword});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 20,
      children: [
        TextField(
          decoration: const InputDecoration(hintText: "Username"),
          controller: usernameTextController,
        ),
        TextField(
          decoration: InputDecoration(
              hintText: "Password",
              suffixIcon: IconButton(
                  onPressed: () => peekPassword(),
                  icon: Icon(!isPasswordPeeked
                      ? Icons.visibility_off
                      : Icons.visibility))),
          controller: passwordTextController,
          obscureText: !isPasswordPeeked,
        ),
        TextField(
          decoration: InputDecoration(
              hintText: "Confirm Password",
              suffixIcon: IconButton(
                  onPressed: () => peekConfirmPassword(),
                  icon: Icon(!isConfirmPasswordPeeked
                      ? Icons.visibility_off
                      : Icons.visibility))),
          controller: confirmPasswordTextController,
          obscureText: !isConfirmPasswordPeeked,
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
