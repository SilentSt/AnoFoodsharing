import '../pages/test_page.dart';
import 'package:flutter/material.dart';

void goTestPage(BuildContext context)
{
  Navigator.push(context, MaterialPageRoute(builder: (context) => const TestPage()));
}