import 'dart:convert';

import 'package:cifra/connectors/send_data.dart';
import 'package:cifra/functions/functions.dart';
import 'package:cifra/headers/login_headers.dart';
import 'package:cifra/widgets/controllers/controllers.dart';
import 'package:cifra/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import '../data/data.dart';

void loginButtonPressed(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        Map<String, dynamic> Function() toJs;
        String email;
        String password;
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
                  InputField(
                    inpTitle: "e-mail",
                    keyName: const Key("email").toString(),
                    controller: emailController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InputField(
                    keyName: const Key("password").toString(),
                    controller: passwordController,
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
                  const Button(
                    text: "Войти",
                    width: 110,
                    backgroundColor: Colors.black,
                    borderColor: Colors.black,
                    fontSize: 15,
                    hoveredBorderColor: Color(0xff08A88A),
                    fontColor: Colors.white,
                    onTap: login,
                  ),
                  //TextButton(onPressed:()=> {print(emailController.text)}, child: Text("Войти"))
                ],
              ),
            )
          ],
        );
      });
}

login(BuildContext context) async {
  //print(emailController.text);
  //print(passwordController.text);
  var res = await sendData(
      loginHeaders, 'login', 'grant_type=&username=${emailController.text}&password=${passwordController.text}&scope=&client_id=&client_secret=',);
  //print(res.toString());
  if(!res.contains("NO_RESULT"))
    {
      //print(jsonDecode(res));
      var val = await jsonDecode(res);
      await FlutterSession().set("jwt", val['access_token']);
      PageState.logged = true;
      goHomePage(context);
      //print(await FlutterSession().get('jwt'));
    }
  else{
    showDialog(context: context, builder: (context){
      return AlertDialog(
        actions: [
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 40),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15)
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text("Упс.. Ошибка!", style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),),
                  PngGif(imgPath: "assets/imgs/error", width: 150, height: 150)
                ],
              ),
            ),
          )
        ],
      );
    });
  }
  //await FlutterSession().set("token", );
}
