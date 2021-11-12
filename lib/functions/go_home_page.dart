import 'package:cifra/pages/home_page.dart';
import 'package:flutter/material.dart';

void goHomePage(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
}
