import 'package:cifra/functions/go_account_page.dart';
import 'package:cifra/functions/go_push_page.dart';
import 'package:flutter/material.dart';
import '../widgets.dart';
import '../../functions/functions.dart';

AlertDialog userSubMenu() => AlertDialog(
  actionsAlignment: MainAxisAlignment.start,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
  actions: [
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Link(text: "Данные пользователя", onTap: goAccountPage, fontSize: 18, fontColor: Colors.black, borderColor: Color(0xffFFE17D)),
        Link(text: "Правила", onTap: goRulesPage, fontSize: 18, fontColor: Colors.black, borderColor: Color(0xffFFE17D)),
        Link(text: "Выйти", onTap: logout, fontSize: 18, fontColor: Colors.black, borderColor: Color(0xffFFE17D)),
      ],
    )
  ],
);