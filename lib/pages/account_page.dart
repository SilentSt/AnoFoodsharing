import 'package:cifra/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    var pageSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          shadowColor: Colors.transparent,
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: const Logo(),
          title: const RowAppTitle(
            titles: ['Расписание', 'Уведомления'],
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
                icon: const PngGif(imgPath: "assets/imgs/profile", height: 54,width: 54,)),
          ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                pageSize.width > 820
                    ? const ParametersPanel()
                    : IconButton(
                        onPressed: () => {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15))),
                                      actionsAlignment: MainAxisAlignment.center,
                                      actions: [ParametersPanel()],
                                    );
                                  })
                            },
                        icon: const Icon(Icons.menu)),
                const SizedBox(
                  width: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
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
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          UserDataElement(pageSize: pageSize, textKey: 'userFirstName', text: 'Имя',),
                          UserDataElement(pageSize: pageSize, textKey: 'userSecondName', text: 'Фамилия',),
                          UserDataElement(pageSize: pageSize, textKey: 'userCity', text: 'Город',),
                          UserDataElement(pageSize: pageSize, textKey: 'userAddress', text: 'Адрес',),
                          UserDataElement(pageSize: pageSize, textKey: 'userPhoneNum', text: 'Номер телефона',),
                          UserDataElement(pageSize: pageSize, textKey: 'userEmail', text: 'e-mail',)
                        ]
                      ),
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
}


