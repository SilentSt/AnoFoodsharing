import 'package:cifra/widgets/flex/link.dart';
import 'package:flutter/material.dart';

class ParametersPanel extends StatelessWidget {
  const ParametersPanel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Link(
            text: 'Данные пользователя',
            onTap: () => {},
            fontColor: Colors.black,
            fontSize: 15,
            borderColor: const Color(0xffFFE17D),
            width: 250),
        Link(
            text: 'Волонтерская деятельность',
            onTap: () => {},
            fontColor: Colors.black,
            fontSize: 15,
            borderColor: const Color(0xffFFE17D),
            width: 250),
        Link(
            text: 'Расписание',
            onTap: () => {},
            fontColor: Colors.black,
            fontSize: 15,
            borderColor: const Color(0xffFFE17D),
            width: 250),
        Link(
            text: 'Организации',
            onTap: () => {},
            fontColor: Colors.black,
            fontSize: 15,
            borderColor: const Color(0xffFFE17D),
            width: 250),
        Link(
            text: 'Подопечные',
            onTap: () => {},
            fontColor: Colors.black,
            fontSize: 15,
            borderColor: const Color(0xffFFE17D),
            width: 250),
        Link(
            text: 'Арихив актов',
            onTap: () => {},
            fontColor: Colors.black,
            fontSize: 15,
            borderColor: const Color(0xffFFE17D),
            width: 250),
        Link(
            text: 'Правила',
            onTap: () => {},
            fontColor: Colors.black,
            fontSize: 15,
            borderColor: const Color(0xffFFE17D),
            width: 250),
        Link(
            text: 'Настройки аккаунта',
            onTap: () => {},
            fontColor: Colors.black,
            fontSize: 15,
            borderColor: const Color(0xffFFE17D),
            width: 250)
      ],
    );
  }
}