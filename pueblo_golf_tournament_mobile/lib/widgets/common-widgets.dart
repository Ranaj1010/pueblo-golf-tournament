import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class BrandTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final String? labelText;
  final bool? obscureText;
  final IconButton? trailButton;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final String? errorMessage;
  final bool? isError;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? textInputType;
  const BrandTextField(
      {super.key,
      this.controller,
      required this.hintText,
      this.labelText,
      this.obscureText,
      this.trailButton,
      this.prefixIcon,
      this.suffixIcon,
      this.focusNode,
      this.errorMessage,
      this.isError,
      this.inputFormatters,
      this.textInputType});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        labelText != null
            ? Padding(
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                child: Text(
                  "${labelText}",
                  style: TextStyle(fontSize: 12),
                ),
              )
            : const Padding(padding: EdgeInsets.all(0)),
        Card(
          shadowColor: Colors.black,
          elevation: 0,
          shape: const RoundedRectangleBorder(
              side: BorderSide(
                  color: Color.fromARGB(255, 206, 206, 206), width: 0.5),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: TextField(
              keyboardType: textInputType,
              focusNode: focusNode,
              decoration: InputDecoration(
                  prefixIcon: prefixIcon,
                  suffixIcon: obscureText != null
                      ? trailButton ?? suffixIcon
                      : suffixIcon,
                  hintText: hintText,
                  border: InputBorder.none,
                  constraints: const BoxConstraints(maxWidth: double.infinity),
                  contentPadding: const EdgeInsets.all(15)),
              obscureText: obscureText ?? false,
              controller: controller,
              inputFormatters: inputFormatters),
        ),
        errorMessage != null
            ? Padding(
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                child: Text(
                  "${errorMessage}",
                  style: TextStyle(fontSize: 12, color: Colors.red),
                ),
              )
            : Padding(padding: EdgeInsets.all(0)),
      ],
    );
  }
}

class BrandDateTimePicker extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final String? labelText;
  final bool? obscureText;
  final IconButton? trailButton;
  final Icon? prefixIcon;
  final FocusNode? focusNode;
  final String? errorMessage;
  final bool? isError;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? textInputType;
  const BrandDateTimePicker(
      {super.key,
      this.controller,
      required this.hintText,
      this.labelText,
      this.obscureText,
      this.trailButton,
      this.prefixIcon,
      this.focusNode,
      this.errorMessage,
      this.isError,
      this.inputFormatters,
      this.textInputType});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        labelText != null
            ? Padding(
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                child: Text(
                  "${labelText}",
                  style: TextStyle(fontSize: 12),
                ),
              )
            : Padding(padding: EdgeInsets.all(0)),
        Card(
          shadowColor: Colors.black,
          elevation: 0,
          shape: const RoundedRectangleBorder(
              side: BorderSide(
                  color: Color.fromARGB(255, 206, 206, 206), width: 0.5),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: TextField(
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(), //get today's date
                    firstDate: DateTime(
                        2000), //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime(2101));

                if (pickedDate != null) {
                  String formattedDate =
                      DateFormat('MMMM dd, yyyy').format(pickedDate);
                  controller!.text = formattedDate;
                } else {
                  print("Date is not selected");
                }
              },
              keyboardType: TextInputType.number,
              focusNode: focusNode,
              decoration: InputDecoration(
                  prefixIcon: prefixIcon,
                  suffixIcon: Icon(Icons.date_range),
                  hintText: hintText,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(15)),
              obscureText: obscureText ?? false,
              controller: controller,
              inputFormatters: inputFormatters),
        ),
        errorMessage != null
            ? Padding(
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                child: Text(
                  "${errorMessage}",
                  style: TextStyle(fontSize: 12, color: Colors.red),
                ),
              )
            : Padding(padding: EdgeInsets.all(0)),
      ],
    );
  }
}

class BrandSearchTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final String? labelText;
  final bool? obscureText;
  final IconButton? trailButton;
  final Icon? prefixIcon;
  final Icon? suffixIcon;

  const BrandSearchTextField(
      {super.key,
      this.controller,
      required this.hintText,
      this.labelText,
      this.obscureText,
      this.trailButton,
      this.prefixIcon,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.grey,
      shadowColor: Color.fromARGB(255, 238, 238, 238),
      shape: RoundedRectangleBorder(
          side:
              BorderSide(color: Color.fromARGB(255, 230, 230, 230), width: 0.5),
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: TextField(
        decoration: InputDecoration(
            prefixIcon: prefixIcon,
            suffixIcon:
                obscureText != null ? trailButton ?? suffixIcon : suffixIcon,
            hintText: hintText,
            labelText: labelText,
            border: InputBorder.none,
            contentPadding: EdgeInsets.fromLTRB(20, 0, 20, 0)),
        obscureText: obscureText ?? false,
        controller: controller,
      ),
    );
  }
}

class BrandElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final bool? isFluid;
  final Color? primaryColor;
  const BrandElevatedButton(
      {super.key,
      required this.onPressed,
      required this.child,
      this.isFluid,
      this.primaryColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        boxShadow: onPressed != null
            ? [
                const BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 4),
                    blurRadius: 5.0)
              ]
            : [],
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.0, 1.0],
          colors: onPressed != null
              ? [
                  Color.fromARGB(255, 24, 193, 123),
                  Color.fromARGB(255, 24, 193, 123)
                ]
              : [
                  Color.fromARGB(255, 216, 217, 219),
                  Color.fromARGB(255, 216, 217, 219),
                ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
            minWidth: isFluid != null ? double.maxFinite : double.minPositive),
        child: ElevatedButton(
          onPressed: onPressed,
          child: Padding(padding: EdgeInsets.all(15), child: child),
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            foregroundColor: MaterialStateProperty.all(
                onPressed != null ? Colors.white : Colors.white70),
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            shadowColor: MaterialStateProperty.all(Colors.transparent),
          ),
        ),
      ),
    );
  }
}

class BrandFloatinActionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  const BrandFloatinActionButton(
      {super.key, required this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: Container(
          width: 60,
          height: 60,
          child: const Icon(
            Icons.add,
            size: 40,
            color: Colors.white,
          ),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 24, 193, 123),
                Color.fromARGB(255, 24, 193, 123)
              ])),
        ),
        onPressed: onPressed);
  }
}
