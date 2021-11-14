import 'package:cifra/functions/functions.dart';
import 'package:cifra/functions/go_account_page.dart';
import 'package:cifra/functions/go_push_page.dart';
import 'package:cifra/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    bool testPassed = false;
    var pageSize = MediaQuery.of(context).size;
    var names = ['вариант 1', 'вариант 2', 'вариант 3', 'вариант 4'];
    return Scaffold(
      appBar: AppBar(
          shadowColor: Colors.transparent,
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: const Logo(),
          title: const RowAppTitle(
            titles: ['Расписание', 'Уведомления'],
            func: [goHomePage, goPushPage],
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
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Container(
                width: pageSize.width > 820 ? 1170 : pageSize.width - 100,
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
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Тестирование",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        Column(
                          children: [
                            MultipleChoiceQuestion(
                                text: "Первый вопрос", names: names),
                            const SizedBox(
                              height: 20,
                            ),
                            OwnAnswerQuestion(
                              text: "Особый вопрос",
                              pageSize: pageSize,
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                          ],
                        )
                      ]),
                ),
              ),
            ),
            Button(
                text: "Завершить",
                width: 170,
                onTap: (context) => {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),

                              /// get answer from the server how user finished test
                              actions: [
                                testPassed
                                    ? TestFailedDialog()
                                    : TestPassedDialog()
                              ],
                            );
                          })
                    },
                hoveredBorderColor: const Color(0xff08A88A),
                backgroundColor: Colors.black,
                fontColor: Colors.white,
                borderColor: Colors.black,
                fontSize: 20)
          ],
        ),
      ),
    );
  }
}

class TestPassedDialog extends StatelessWidget {
  const TestPassedDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          const Text(
            "Вы отлично справились!",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                fontFamily: 'GothamPro'),
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            "Поздравляем! Теперь ты Волонтер. Добро пожаловать в команду :)",
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                fontFamily: 'GothamPro'),
          ),
          const SizedBox(height: 30),
          Image.asset(
            "assets/imgs/star.gif",
            width: 150,
            height: 150,
          ),
          const SizedBox(height: 50),
          const Button(
              text: "Ура",
              width: 130,
              hoveredBorderColor: Color(0xff08A88A),
              onTap: goAccountPage,
              backgroundColor: Colors.white,
              fontColor: Colors.black,
              borderColor: Colors.black,
              fontSize: 15),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

class TestFailedDialog extends StatelessWidget {
  const TestFailedDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          const Text(
            "К сожалению, вы не прошли тест",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                fontFamily: 'GothamPro'),
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            "Вы можете лучше ознакомиться с правилами и пройти тест еще раз :)",
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                fontFamily: 'GothamPro'),
          ),
          const SizedBox(height: 30),
          Image.asset(
            "assets/imgs/puzzle.gif",
            width: 150,
            height: 150,
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Button(
                  text: "Правила",
                  width: 130,
                  onTap: goRulesPage,
                  backgroundColor: Colors.black,
                  fontColor: Colors.white,
                  borderColor: Colors.black,
                  hoveredBorderColor: Color(0xff08A88A),
                  fontSize: 15),
              Button(
                  text: "Позже",
                  width: 130,
                  onTap: goHomePage,
                  backgroundColor: Colors.white,
                  fontColor: Colors.black,
                  borderColor: Colors.black,
                  hoveredBackgroundColor: Color(0xff323232),
                  hoveredBorderColor: Color(0xff323232),
                  fontSize: 15)
            ],
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
