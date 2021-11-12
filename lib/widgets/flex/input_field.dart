import 'package:cifra/data/data.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String inpTitle;

  const InputField({Key? key, this.inpTitle = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,
      obscureText: key == const Key("password") ? true : false,
      style: const TextStyle(color: Colors.black, fontSize: 18),
      textAlign: TextAlign.center,
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
      onChanged: (value) => {
        if (key == const Key("e-mail")) UserData.email = value,
        if (key == const Key("password")) UserData.password = value,
      },
    );
  }
}
