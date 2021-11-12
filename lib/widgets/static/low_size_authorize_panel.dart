import 'package:cifra/functions/functions.dart';
import 'package:flutter/material.dart';
import '../widgets.dart';

class LowSizeAuthorizePanel extends StatelessWidget {
  const LowSizeAuthorizePanel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      actionsAlignment: MainAxisAlignment.center,
                      actions: [
                        Column(
                          children: const [
                            Button(
                              onTap: loginButtonPressed,
                              fontColor: Colors.black,
                              borderColor: Colors.black,
                              backgroundColor: Colors.white,
                              width: 200,
                              fontSize: 15,
                              text: "Вход",
                              hoveredBorderColor: Colors.black,
                            ),
                            Button(
                              onTap: registrationButtonPressed,
                              fontColor: Colors.white,
                              borderColor: Colors.white,
                              backgroundColor: Colors.black,
                              width: 200,
                              fontSize: 15,
                              text: "Стать волонтером",
                              hoveredBorderColor: Colors.black,
                            )
                          ],
                        )
                      ],
                    );
                  })
            },
        icon: const Icon(Icons.login, color: Colors.black,));
  }
}
