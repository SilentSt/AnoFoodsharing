import 'package:cifra/pages/home_page.dart';
import 'package:cifra/widgets/widgets.dart';
import 'package:flutter/material.dart';
import '../data/data.dart';

void loginButtonPressed(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: const BorderSide(color: Colors.white, width: 1)),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const InputField(
                    key: Key("e-mail"),
                    inpTitle: "e-mail",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const InputField(
                    key: Key("password"),
                    inpTitle: "Пароль",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    onPressed: () => {},
                    child: const Text(
                      "Забыли пароль?",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffFFC851)),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                      onPressed: () => {},
                      child: const Text(
                        "Ещё не зарегистрировались?\nЗарегистрироваться",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                        textAlign: TextAlign.center,
                      )),
                  const SizedBox(
                    height: 40,
                  ),
                  Button(
                    text: "Войти",
                    width: 110,
                    backgroundColor: Colors.black,
                    borderColor: Colors.black,
                    fontSize: 15,
                    hoveredBorderColor: const Color(0xff08A88A),
                    fontColor: Colors.white,
                    onTap: (context) => {
                      if (UserData.email == "" && UserData.password == "")
                        PageState.logged = true,
                      if (PageState.logged)
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()))
                    },
                  ),
                ],
              ),
            )
          ],
        );
      });
}
