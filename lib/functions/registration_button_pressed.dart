import 'package:cifra/pages/registration_page.dart';
import 'package:flutter/material.dart';

void registrationButtonPressed(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistrationPage()));
}
