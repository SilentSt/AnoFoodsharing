import '../pages/rules_page.dart';
import 'package:flutter/material.dart';
void goRulesPage(BuildContext context)
{
  Navigator.push(context, MaterialPageRoute(builder: (context) => const RulesPage()));
}