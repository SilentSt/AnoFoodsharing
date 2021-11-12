import 'package:flutter/material.dart';
import 'package:cifra/widgets/widgets.dart';

Padding registrationInputField(String text, Key key, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 30),
        child: InputField(key: key, inpTitle: text,)
  );
}