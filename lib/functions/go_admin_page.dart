import 'package:cifra/pages/account_page.dart';
import 'package:cifra/pages/admin_page.dart';
import 'package:flutter/material.dart';

void goAdminPage(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminPage(gridColumns: [],)));
}
