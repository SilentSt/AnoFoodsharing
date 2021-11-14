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
      "Повторите пароль"
    ];
    var texts = [
      "fName",
      "sName",
      "city",
      "address",
      "phoneNum",
      "email",
      "password",
      "sPassword"
    ];
    var controllers = [
      fNameReg,
      sNameReg,
      cityReg,
      addressReg,
      phoneNumReg,
      emailReg,
      passwordReg,
      passwordReg
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
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Text("Пользовательское соглашение"),
                                    Text(
                                        "Соглашение на обработку персональных данных" +

                                            'Настоящее пользовательское соглашение (далее - Соглашение) является публичной офертой (то есть предложением заключить соглашение).' +

                                            'Нажимая кнопки «Получить коммерческое предложение», «Зарегистрироваться», «Отправить заявку», «Отправить сообщение», «Заказать обратный звонок» и другие кнопки для отправки данных форм, Вы считаетесь присоединившимся к нему.' +
                                            ''
                                                'При изменении законодательства, Соглашение может подвергаться изменениям.' +
                                            ''
                                                'Если вы считаете, что Соглашение или Администрации Сайта нарушает ваши права, сообщите об этом по электронному адресу: support@general-smeta.' +
                                            ''
                                                '1. Термины, применяемые в настоящем Соглашении:' +
                                            ''
                                                '1.1. Сайт – это совокупность текстов, графических элементов, дизайна, изображений, программного кода, фото- и видеоматериалов и иных результатов интеллектуальной деятельности, содержащихся в сети Интернет под доменным именем https://general-smeta.ru''' +
                                            ''
                                                '1.2. Администрация Сайта – это лицо, обладающее правами администрирования Сайта.' +
                                            ''
                                                '1.3. Пользователь – это любое лицо, осуществившее вход на Сайт и принявшее условия настоящего Соглашения, независимо от факта прохождения процедур регистрации и авторизации.' +
                                            ''
                                                '2. Использование персональных данных' +
                                            ''
                                                '2.1. Принимая условия настоящего соглашения, Пользователь предоставляет Администрации Сайта согласие на обработку своих персональных данных.' +
                                            ''
                                                '2.2. Цель обработки персональных данных: выполнение Администрацией обязательств перед Пользователем в рамках настоящего Соглашения, продвижение товаров и услуг, клиентская поддержка.' +
                                            ''
                                                '2.3. Обработке подлежат следующие персональные данные:' +
                                            ''
                                                '2.3.1. Фамилия, имя, отчество Пользователя;' +
                                            ''
                                                '2.3.2. Электронный адрес Пользователя (Email);' +
                                            ''
                                                '2.3.3. Номер телефона Пользователя.' +
                                            ''
                                                '2.4. Под обработкой персональных данных подразумевается следующий перечень действий с персональными данными: сбор, запись, систематизация, накопление, хранение, уточнение (обновление, изменение), извлечение, использование, передачу (распространение, предоставление доступа), обезличивание, блокирование, удаление, уничтожение персональных данных.' +
                                            ''
                                                '2.5. Персональные данные получаются в связи с заключением договора, стороной которого является субъект персональных данных. Персональные данные не распространяются, а также не предоставляются третьим лицам без согласия субъекта персональных данных и используются оператором исключительно для исполнения указанного соглашения и заключения договоров с субъектом персональных данных.' +
                                            ''
                                                '2.6. Администрация имеет право отправлять информационные, в том числе рекламные сообщения, на электронную почту Пользователя. Пользователь вправе отказаться от получения рекламной и другой информации без объяснения причин отказа путем информирования Администрации о своем отказе по любому телефону, указанному на Сайте, либо посредством направления соответствующего заявления на электронный адрес support@general-smeta, либо нажав кнопку "Отписаться", содержащуюся в каждом информационном сообщении. Сервисные сообщения, информирующие Пользователя о заказе и этапах его обработки, отправляются автоматически и не могут быть отклонены Пользователем.' +
                                            ''
                                                '2.7. Данное согласие на обработку персональных данных действует бессрочно, но может быть отозвано субъектом персональных данных на основании личного заявления, направленного по электронной почте Администрации Сайта.' +
                                            ''
                                                '2.8. Администрация Сайта обязуется использовать персональные данные Пользователя, полученные в результате использования Сайта в соответствии с требованиями законодательства о защите персональных данных, в том числе федерального закона № 152-ФЗ от 22.02.2017 «О персональных данных» в редакции, действующей на момент обработки таких персональных данных.' +
                                            ''
                                                '3. Присоединяясь к настоящему Соглашению и оставляя свои данные на Сайте, путем заполнения полей онлайн-заявки Пользователь:' +
                                            ''
                                                'подтверждает, что указанные им персональные данные принадлежат лично ему;' +
                                            'признает и подтверждает, что он внимательно и в полном объеме ознакомился с настоящим Соглашением и содержащимися в нем условиями обработки его персональных данных, указываемых им в полях онлайн заявки на сайте;' +
                                            'признает и подтверждает, что все положения настоящего Соглашения и условия обработки его персональных данных ему понятны;' +
                                            'выражает согласие с условиями обработки персональных данных без каких-либо оговорок и ограничений.' +
                                            "3.1 Пользователь подтверждает, что, принимая условия Соглашения, он действует свободно, своей волей и в своем интересе.")
                                  ],
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