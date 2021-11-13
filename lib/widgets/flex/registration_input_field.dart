import 'package:cifra/widgets/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:cifra/widgets/widgets.dart';

Padding registrationInputField(String text, Key key, TextEditingController registerController,BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 30),
        child: InputField(inpTitle: text, keyName: key.toString(),controller: registerController,)
  );
}