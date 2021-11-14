import 'dart:convert';
import 'dart:io';

import 'package:cifra/connectors/get_data.dart';
import 'package:cifra/data/page_state.dart';
import 'package:cifra/functions/go_push_page.dart';
import 'package:cifra/headers/account_data_headers.dart';
import 'package:cifra/headers/login_headers.dart';
import 'package:cifra/widgets/controllers/controllers.dart';
import 'package:cifra/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';

class AccountChildPage extends StatefulWidget {
  const AccountChildPage({Key? key}) : super(key: key);

  @override
  State<AccountChildPage> createState() => _AccountChildPageState();
}

class _AccountChildPageState extends State<AccountChildPage> {
  int role = 0;

  @override
  Widget build(BuildContext context) {
    prepareData();
    var pageSize = MediaQuery.of(context).size;
    //print(getData(accountDataHeaders, '/me'));
    return Scaffold(
      appBar: AppBar(
          shadowColor: Colors.transparent,
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: const Logo(),
          title: const RowAppTitle(
            titles: ['Уведомления'],
            func: [goPushPage],
          ),
          actions: [
            IconButton(
                onPressed: () => {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return userSubMenu();
                          })
                    },
                icon: const PngGif(
                  imgPath: "assets/imgs/profile",
                  height: 54,
                  width: 54,
                )),
          ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                pageSize.width > 820
                    ? ParametersPanel(type: PageState.role)
                    : IconButton(
                        onPressed: () => {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15))),
                                      actionsAlignment:
                                          MainAxisAlignment.center,
                                      actions: [
                                        ParametersPanel(
                                          type: PageState.role,
                                        )
                                      ],
                                    );
                                  })
                            },
                        icon: const Icon(Icons.menu)),
                const SizedBox(
                  width: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(40),
                  child: Container(
                    width: pageSize.width > 820 ? 550 : pageSize.width - 100,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x0F000000),
                            blurRadius: 10.0,
                            spreadRadius: 7.0,
                            offset: Offset(
                              0,
                              10.0,
                            ),
                          )
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(40),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: const [
                                Text(
                                  "Картошкина Нина Юрьевна",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                      fontFamily: 'GothamPro'),
                                ),
                                SizedBox(height: 10,),
                                Text("подопечный с 14.11.2021",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 10,
                                      fontFamily: 'GothamPro'),),
                              ],
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            ),
                            const SizedBox(height: 5,),
                            Row(
                              children: const [ Text("Красноармейская улица, 210/117, кв. 67",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 10,
                                    fontFamily: 'GothamPro'),)],
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            ),
                            const SizedBox(height: 5,),
                            Row(
                              children: const [Text("+7 978 565 65 74",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    fontFamily: 'GothamPro'),)],
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            ),
                            const SizedBox(height: 5,),
                            Row(
                              children: const [Text("patato@mail.ru",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 15,
                                    fontFamily: 'GothamPro'),)],
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            ),
                          ]),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  prepareData() async {
    var header = accountDataHeaders;
    header[HttpHeaders.authorizationHeader] =
        'Bearer ${await FlutterSession().get("jwt")}';
    var data = await getData(header, 'me');
    var _data = jsonDecode(utf8.decode(data));
    fNameDataElm.text = _data['first_name'];
    sNameDataElm.text = _data['last_name'];
    emailDataElm.text = _data['email'];
    cityDataElm.text = _data['city'];
    addressDataElm.text = _data['address'];
    phoneNumDataElm.text = _data['phone'];
    PageState.role = _data['role'];
    //print((int.parse(await FlutterSession().get("role"))).toString());
    PageState.id = _data['id'];
  }
}
