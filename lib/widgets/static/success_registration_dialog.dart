import 'package:flutter/material.dart';
import 'package:cifra/widgets/widgets.dart';
import 'package:cifra/functions/functions.dart';

class SuccessRegistrationDialog extends StatefulWidget {
  const SuccessRegistrationDialog({
    Key? key,
  }) : super(key: key);

  @override
  State<SuccessRegistrationDialog> createState() => _SuccessRegistrationDialogState();
}

class _SuccessRegistrationDialogState extends State<SuccessRegistrationDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.center,
            mainAxisAlignment:
            MainAxisAlignment.center,
            children: const [
              Text(
                "Регистрация прошла успешно!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontFamily: "GothamPro",
                    fontSize: 20),
              ),
              SizedBox(height: 30),
              PngGif(
                  imgPath: "assets/imgs/human",
                  width: 150,
                  height: 150),
              SizedBox(height: 30),
              Button(
                  text: "Ура :)",
                  width: 100,
                  onTap: goHomePage,
                  backgroundColor: Colors.white,
                  fontColor: Colors.black,
                  borderColor: Colors.black,
                  hoveredBorderColor:Color(0xff08A88A),
                  fontSize: 15)
            ],
          ),
        )
      ],
    );
  }
}