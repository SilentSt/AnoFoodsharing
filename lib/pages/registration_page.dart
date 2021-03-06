import 'dart:convert';
import 'package:cifra/connectors/send_data.dart';
import 'package:cifra/data/data.dart';
import 'package:cifra/functions/functions.dart';
import 'package:cifra/functions/login_button_pressed.dart';
import 'package:cifra/headers/registation_headers.dart';
import 'package:cifra/pages/pages.dart';
import 'package:cifra/widgets/controllers/controllers.dart';
import 'package:cifra/widgets/static/error_dialog.dart';
import 'package:cifra/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    var pageSize = MediaQuery
        .of(context)
        .size;
    var keys = [
      "Имя",
      "Фамилия",
      "Город",
      "Адрес проживания",
      "Номер телефона",
      "e-mail",
      "Придумайте пароль",
    ];
    var texts = [
      "fName",
      "sName",
      "city",
      "address",
      "phoneNum",
      "email",
      "password",
    ];
    var controllers = [
      fNameReg,
      sNameReg,
      cityReg,
      addressReg,
      phoneNumReg,
      emailReg,
      passwordReg,
    ];
    final Map<String, String> inpFields = Map.fromIterables(texts, keys);
    final Map<String, TextEditingController> cts =
    Map.fromIterables(texts, controllers);
    bool isChecked = false;
    bool successRegistration = true;
    return Scaffold(
        appBar: AppBar(
            shadowColor: Colors.transparent,
            centerTitle: true,
            backgroundColor: Colors.white,
            leading: const Logo(),
            actions: const [
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  "Уже зарегистрированы? ",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: "GothemPro"),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 13),
                child: FlexLink(
                  onTap: loginButtonPressed,
                  fontColor: Colors.black,
                  text: 'Войти',
                  fontSize: 15,
                ),
              )
            ]),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              pageSize.width > 800
                  ? pageSize.width * 0.3
                  : pageSize.width * 0.1,
              40,
              pageSize.width > 800
                  ? pageSize.width * 0.3
                  : pageSize.width * 0.1,
              40,
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(40),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x0F000000),
                          blurRadius: 10.0,
                          spreadRadius: 7.0,
                          offset: Offset(
                            0,
                            10.0,
                          ),
                        ),
                      ]),
                  child: Column(
                    children: [
                      const Text(
                        "Регистрация!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontFamily: "GothamPro"),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: inpFields.keys
                            .map((key) =>
                            registrationInputField(
                                inpFields[key].toString(),
                                Key(key),
                                cts[key]!,
                                context))
                            .toList(),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      checkUsingUserData()
                    ],
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
                Button(
                    text: "Зарегистрироваться",
                    width: 275,
                    hoveredBorderColor: Color(0xff08A88A),
                    onTap: registrate,
                    backgroundColor: Colors.black,
                    fontColor: Colors.white,
                    borderColor: Colors.black,
                    fontSize: 20)
              ],
            ),
          ),
        ));
  }

  registrate(BuildContext context) async {
    var data = <String, dynamic>{};
    data['first_name'] = fNameReg.text;
    data['last_name'] = sNameReg.text;
    data['email'] = emailReg.text;
    data['city'] = cityReg.text;
    data['address'] = addressReg.text;
    data['phone'] = phoneNumReg.text;
    data['password'] = passwordReg.text;
    var res = await sendData(registrationHeaders, 'users', jsonEncode(data));

    if (res != "NO_RESULT_SEND") {
      shDialog(context);
    }
    else if (res == "NO_RESULT_SEND"){
      errorLogin(context);
    }
  }
  bool isChecked = true;
  Row checkUsingUserData() {

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (val) =>
          {
            setState(() {
              isChecked = val!;
            })
          },
          fillColor: MaterialStateProperty.all(const Color(0xffFFE17D)),
          checkColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        Expanded(
          child: RichText(
            text: TextSpan(children: [
              const WidgetSpan(
                  child: Text(
                    "Я принимаю ",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontFamily: "GothamPro"),
                  )),
              WidgetSpan(
                  child: GestureDetector(
                    onTap: () =>
                    {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              backgroundColor: Colors.white,
                              actionsAlignment: MainAxisAlignment.center,
                              actions: [
                                SingleChildScrollView(
                                  child: Expanded(
                                    child: SafeArea(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: const [
                                          Text("Пользовательское соглашение"),
                                          Text(
                                              "\nСоглашение на обработку персональных данных" +

                                                  '\nНастоящее пользовательское соглашение (далее - Соглашение) является публичной офертой (то есть предложением заключить соглашение).' +

                                                  '\nНажимая кнопки «Получить коммерческое предложение», «Зарегистрироваться», «Отправить заявку», «Отправить сообщение», «Заказать обратный звонок» и другие кнопки для отправки данных форм, Вы считаетесь присоединившимся к нему.' +
                                                  ''
                                                      '\nПри изменении законодательства, Соглашение может подвергаться изменениям.' +
                                                  ''
                                                      '\nЕсли вы считаете, что Соглашение или Администрации Сайта нарушает ваши права, сообщите об этом по электронному адресу: support@general-smeta.' +
                                                  ''
                                                      '\n1. Термины, применяемые в настоящем Соглашении:' +
                                                  ''
                                                      '\n1.1. Сайт – это совокупность текстов, графических элементов, дизайна, изображений, программного кода, фото- и видеоматериалов и иных результатов интеллектуальной деятельности, содержащихся в сети Интернет под доменным именем https://general-smeta.ru''' +
                                                  ''
                                                      '\n1.2. Администрация Сайта – это лицо, обладающее правами администрирования Сайта.' +
                                                  ''
                                                      '\n1.3. Пользователь – это любое лицо, осуществившее вход на Сайт и принявшее условия настоящего Соглашения, независимо от факта прохождения процедур регистрации и авторизации.' +
                                                  ''
                                                      '\n2. Использование персональных данных' +
                                                  ''
                                                      '\n2.1. Принимая условия настоящего соглашения, Пользователь предоставляет Администрации Сайта согласие на обработку своих персональных данных.' +
                                                  ''
                                                      '\n2.2. Цель обработки персональных данных: выполнение Администрацией обязательств перед Пользователем в рамках настоящего Соглашения, продвижение товаров и услуг, клиентская поддержка.' +
                                                  ''
                                                      '\n2.3. Обработке подлежат следующие персональные данные:' +
                                                  ''
                                                      '\n3. Присоединяясь к настоящему Соглашению и оставляя свои данные на Сайте, путем заполнения полей онлайн-заявки Пользователь:' +
                                                  ''
                                                      '\nподтверждает, что указанные им персональные данные принадлежат лично ему;' +
                                                  '\nпризнает и подтверждает, что он внимательно и в полном объеме ознакомился с настоящим Соглашением и содержащимися в нем условиями обработки его персональных данных, указываемых им в полях онлайн заявки на сайте;' +
                                                  '\nпризнает и подтверждает, что все положения настоящего Соглашения и условия обработки его персональных данных ему понятны;' +
                                                  '\nвыражает согласие с условиями обработки персональных данных без каких-либо оговорок и ограничений.' +
                                                  "\n3.1 Пользователь подтверждает, что, принимая условия Соглашения, он действует свободно, своей волей и в своем интересе.")
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ]
                              ,
                            );
                          })
                    },
                    child: const Text(
                      "соглашение",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffFFE17D),
                          fontFamily: "GothamPro",
                          decoration: TextDecoration.underline,
                          decorationThickness: 5),
                    ),
                  )),
              const WidgetSpan(
                  child: Text(
                    "об условиях обработки персональных данных",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontFamily: "GothamPro"),
                  )),
            ]),
          ),
        )
      ],
    );
  }
}

void shDialog(BuildContext context) {
  PageState.logged = true;
  showDialog(
      context: context,
      builder: (context) {
        return const SuccessRegistrationDialog();
      });
}
void errorLogin(BuildContext context) {
  PageState.logged = false;
  showDialog(
      context: context,
      builder: (context) {
        return const ErrorDialog();
      });
}