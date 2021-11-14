import 'package:cifra/functions/go_account_page.dart';
import 'package:cifra/functions/go_accounts_child_page.dart';
import 'package:cifra/functions/go_accounts_orgs_page.dart';
import 'package:cifra/widgets/flex/link.dart';
import 'package:flutter/material.dart';

class ParametersPanel extends StatelessWidget {
  final int type;
  const ParametersPanel({
    Key? key, required this.type,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final volonter0 = <String, Function>{
      "Данные пользователя": goAccountPage,
      "Организации":goAccountsOrgsPage,
      "Подопечные":goAccountPage,
      "Настройки аккаунта":goAccountPage,
    };
    final volonter1 = <String, dynamic>{
      "Данные пользователя": goAccountPage,
      "Организации":goAccountsOrgsPage,
      "Подопечные":goAccountPage,
      "Настройки аккаунта":goAccountPage,
    };
    final volonter2 = <String, dynamic>{
    "Данные пользователя": goAccountPage,
    "Организации":goAccountsOrgsPage,
    "Подопечные":goAccountPage,
    "Настройки аккаунта":goAccountPage,
    };
    final kurator = <String, dynamic>{
      "Данные пользователя": goAccountPage,
      "Волонтёры":goAccountPage,
      "Организации":goAccountsOrgsPage,
      "Подопечные":goAccountsChildPage,
      "Настройки аккаунта":goAccountPage,
    };
    var typizator=[volonter0,volonter1, volonter2, kurator, volonter0];
    return Column(
      children:typizator[type].keys.map((e) => Link(
        text: e,
        fontColor: Colors.black,
        fontSize: 15,
        borderColor: const Color(0xffffe17d),
        width: 250,
        onTap: (typizator[type])[e],
      )).toList()
    );
  }
}