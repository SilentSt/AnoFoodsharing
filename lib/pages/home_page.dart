import 'package:cifra/data/data.dart';
import 'package:cifra/functions/functions.dart';
import 'package:flutter/material.dart';
import 'package:cifra/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var pageSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: const Logo(),
        title: pageSize.width > 850
            ? const RowAppTitle(
                titles: ['Контакты', 'Описание', 'Статистика', 'Органицазиям'],
              )
            : const ColumnAppTitle(),
        actions: [
          !PageState.logged
              ? pageSize.width > 500
                  ? const FullSizeAuthorizePanel()
                  : const LowSizeAuthorizePanel()
              : IconButton(
                  onPressed: () => {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return userSubMenu();
                            })
                      },
                  icon: const PngGif(imgPath: "assets/imgs/profile", height: 54,width: 54,)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ProductBanner(pageSize: pageSize),
              const SizedBox(height: 30),
              Button(
                text: PageState.logged
                    ? "ПРИСОЕДИНИТЬСЯ К ДВИЖЕНИЮ!"
                    : "ПЕРЕЙТИ К РАСПИСАНИЮ!",
                width: 340,
                fontSize: 15,
                backgroundColor: Colors.black,
                fontColor: Colors.white,
                hoveredBorderColor: const Color(0xff08A88A),
                onTap: loginButtonPressed,
                borderColor: Colors.black,

              ),
              const SizedBox(height: 150),
              //graphic card here
              const SizedBox(
                height: 120,
              ),
              CardContainer(
                  pageSize: pageSize,
                  child: const CCard(
                    title: 'Как стать волонтером?',
                    text: [
                      "Необходимо ознакомиться с правилами, изучить их и убедиться, что они вам подходят.",
                      "Успешно пройти тестирование. У вас есть возможность пройти тест еще раз, если не получилось с первого раза.",
                      "С вами свяжется координатор, который объяснит дальнейшие действия и ответит на вопросы."
                    ],
                    imgPath: [
                      "assets/imgs/eye",
                      "assets/imgs/doc",
                      "assets/imgs/dialog"
                    ],
                  )),
              const SizedBox(
                height: 120,
              ),
              CardContainer(
                  pageSize: pageSize,
                  child: const CCard(
                    title: 'Как работают волонтеры?',
                    text: [
                      "В назначеное время забирают продукты питания и готовые блюда из определенных магазинов, кафе и пекарен.",
                      "Доставляют подопечным, которые за ними закреплены.",
                      "Заполняют акт о выполненой работе и загружают его в свой профиль на сайте."
                    ],
                    imgPath: [
                      "assets/imgs/sign",
                      "assets/imgs/bycycle",
                      "assets/imgs/approve"
                    ],
                  )),
              const SizedBox(
                height: 120,
              ),
              CardContainer(
                  pageSize: pageSize,
                  child: const CCard(
                    title: 'Польза от фудшеринга',
                    text: [
                      "Полезный опыт общения с людьми, новые знакомства, время проведенное с максимальной пользой.",
                      "Продукты не пропадают зря! Они попадают нуждающимся.",
                      "Сокращение выделения улекислого газа, сгенерированного пищевыми отходами. Умеренное использование ресурсов, которые затрачиваются на производство продуктов."
                    ],
                    imgPath: [
                      "assets/imgs/heart",
                      "assets/imgs/shelf",
                      "assets/imgs/globe"
                    ],
                  )),
              const SizedBox(height: 120),
              const Footer()
            ],
          ),
        ),
      ),
    );
  }

  Container subUserMenuButton(String text) {
    return Container(
      width: 250,
      child: TextButton(
          onPressed: () => {
                //opens next page or AlertDialog
              },
          child: Text(
            text,
            textAlign: TextAlign.left,
            style: const TextStyle(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.w400),
          )),
      decoration: const BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 1, color: Color(0xffFFE17D)))),
    );
  }
}
