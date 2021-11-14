import 'package:cifra/data/data.dart';
import 'package:cifra/functions/functions.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String keyName;
  final String inpTitle;
  final TextEditingController controller;
  const InputField({Key? key, this.inpTitle = "", required this.keyName, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,
      obscureText: key == const Key("password")||inpTitle=="Придумайте пароль" ? true : false,
      style: const TextStyle(color: Colors.black, fontSize: 18),
      textAlign: TextAlign.center,
      controller: controller,
      validator: (emailReg) {
        // Check if this field is empty
        if (emailReg!.isEmpty) {
        }

        // using regular expression
        if (!RegExp( r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(emailReg)) {
          return "Please enter a valid email address";
        }

        // the email is valid
        return null;
      },
      decoration: InputDecoration(
        alignLabelWithHint: true,
        filled: true,
        fillColor: Colors.white,
        labelText: inpTitle,
        labelStyle: const TextStyle(
            fontSize: 15,
            color: Colors.black,
          fontWeight: FontWeight.w600
        ),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
      ),
    );
  }
}
