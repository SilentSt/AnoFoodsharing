import 'package:flutter/material.dart';
import 'package:cifra/widgets/widgets.dart';
import 'package:cifra/functions/functions.dart';

class ErrorDialog extends StatefulWidget {
  const ErrorDialog({
    Key? key,
  }) : super(key: key);

  @override
  State<ErrorDialog> createState() => _ErrorDialogState();
}

class _ErrorDialogState extends State<ErrorDialog> {
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
                "Упс... Ошибка!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontFamily: "GothamPro",
                    fontSize: 20),
              ),
              SizedBox(height: 30),
              PngGif(
                  imgPath: "assets/imgs/error",
                  width: 150,
                  height: 150),
              SizedBox(height: 30),
            ],
          ),
        )
      ],
    );
  }
}