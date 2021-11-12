import 'package:cifra/functions/functions.dart';
import 'package:flutter/material.dart';
import '../widgets.dart';

class FullSizeAuthorizePanel extends StatelessWidget {
  const FullSizeAuthorizePanel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Button(
          onTap: loginButtonPressed,
          hoveredBackgroundColor: Colors.white,
          fontColor: Colors.black,
          borderColor: Colors.black,
          backgroundColor: Colors.white,
          width: 100,
          fontSize: 15,
          text: "Вход",
          hoveredBorderColor: Colors.black,
        ),
        Button(
          onTap: registrationButtonPressed,
          hoveredBackgroundColor: Colors.black,
          hoveredBorderColor: Colors.black,
          fontColor: Colors.white,
          borderColor: Colors.black,
          backgroundColor: Colors.black,
          width: 200,
          fontSize: 15,
          text: "Стать волонтером",
        )
      ],
    );
  }
}