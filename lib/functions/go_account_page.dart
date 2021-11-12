import 'package:cifra/pages/account_page.dart';
import 'package:flutter/material.dart';

void goAccountPage(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => const AccountPage()));
}
