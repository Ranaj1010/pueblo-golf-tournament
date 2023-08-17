import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PersonalInfoForm extends StatelessWidget {
  final TextEditingController firstNameTextController;
  final TextEditingController middleNameTextController;
  final TextEditingController lastNameTextController;
  final TextEditingController birthDateTextController;
  final GlobalKey<FormState> formKey;
  const PersonalInfoForm(
      {super.key,
      required this.firstNameTextController,
      required this.middleNameTextController,
      required this.lastNameTextController,
      required this.birthDateTextController,
      required this.formKey});
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Wrap(
        runSpacing: 20,
        children: [
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This field is required.';
              }
              return null;
            },
            decoration: const InputDecoration(
              hintText: "First Name",
            ),
            controller: firstNameTextController,
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: "Middle Name",
            ),
            controller: middleNameTextController,
          ),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This field is required.';
              }
              return null;
            },
            decoration: const InputDecoration(hintText: "Last Name"),
            controller: lastNameTextController,
          ),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This field is required.';
              }
              return null;
            },
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
      ),
    );
  }
}

class ContactForm extends StatelessWidget {
  final TextEditingController mobileNumberTextController;
  final TextEditingController emailAddressTextController;
  final TextEditingController homeAddressTextController;
  final TextEditingController cityTextController;
  final TextEditingController countryTextController;
  final GlobalKey<FormState> formKey;
  const ContactForm(
      {super.key,
      required this.mobileNumberTextController,
      required this.emailAddressTextController,
      required this.homeAddressTextController,
      required this.cityTextController,
      required this.countryTextController,
      required this.formKey});
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Wrap(
        runSpacing: 20,
        children: [
          TextFormField(
            decoration: const InputDecoration(hintText: "Mobile Number"),
            controller: mobileNumberTextController,
          ),
          TextFormField(
            decoration: const InputDecoration(hintText: "Email Address"),
            controller: emailAddressTextController,
          ),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This field is required.';
              }
              return null;
            },
            decoration: const InputDecoration(hintText: "Home Address"),
            controller: homeAddressTextController,
          ),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This field is required.';
              }
              return null;
            },
            decoration: const InputDecoration(hintText: "City"),
            controller: cityTextController,
          ),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This field is required.';
              }
              return null;
            },
            decoration: const InputDecoration(
              hintText: "Country",
            ),
            controller: countryTextController,
          ),
        ],
      ),
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
  final GlobalKey<FormState> formKey;
  const AccountForm(
      {super.key,
      required this.usernameTextController,
      required this.passwordTextController,
      required this.confirmPasswordTextController,
      required this.isPasswordPeeked,
      required this.isConfirmPasswordPeeked,
      required this.peekPassword,
      required this.peekConfirmPassword,
      required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Wrap(
        runSpacing: 20,
        children: [
          TextFormField(
            validator: (value) {
              if (value != null && value!.length < 4) {
                return 'Username should have atleast 4 characters';
              }
              if (value == null || value.isEmpty) {
                return 'This field is required.';
              }
              return null;
            },
            decoration: const InputDecoration(hintText: "Username"),
            controller: usernameTextController,
          ),
          TextFormField(
            validator: (value) {
              if (value != null && value!.length < 6) {
                return 'Password should have atleast 6 characters';
              }
              if (value != null && !value.contains(RegExp(r'[A-Z]'))) {
                return 'Password should have atleast 1 uppercase letter.';
              }

              if (value == null || value.isEmpty) {
                return 'This field is required.';
              }

              return null;
            },
            decoration: InputDecoration(
                hintText: "Password",
                helperText:
                    "Should have atleast 6 characters and 1 uppercase letter.",
                helperStyle:
                    TextStyle(letterSpacing: 0, color: Colors.deepOrangeAccent),
                suffixIcon: IconButton(
                    onPressed: () => peekPassword(),
                    icon: Icon(!isPasswordPeeked
                        ? Icons.visibility_off
                        : Icons.visibility))),
            controller: passwordTextController,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]'))
            ],
            obscureText: !isPasswordPeeked,
          ),
          TextFormField(
            validator: (value) {
              if (passwordTextController.text != value) {
                return 'Password does not matched.';
              }

              if (value == null || value.isEmpty) {
                return 'This field is required.';
              }
              return null;
            },
            decoration: InputDecoration(
                hintText: "Confirm Password",
                suffixIcon: IconButton(
                    onPressed: () => peekConfirmPassword(),
                    icon: Icon(!isConfirmPasswordPeeked
                        ? Icons.visibility_off
                        : Icons.visibility))),
            controller: confirmPasswordTextController,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]'))
            ],
            obscureText: !isConfirmPasswordPeeked,
          ),
        ],
      ),
    );
  }
}

class SignUpSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Wrap(
        children: [
          Text(
            "You have successfully registered a new scorer.",
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
