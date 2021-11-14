import 'package:cifra/pages/account_child_page.dart';
import 'package:cifra/pages/account_orgs_page.dart';
import 'package:cifra/pages/orgs_page.dart';
import 'package:cifra/pages/statistics_page.dart';
import 'package:flutter/material.dart';

void goAccountsChildPage(BuildContext context)
{
  Navigator.push(context, MaterialPageRoute(builder: (context) => const AccountChildPage()));
}