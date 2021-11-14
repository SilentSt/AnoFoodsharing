import 'package:cifra/functions/functions.dart';
import 'package:cifra/functions/go_getters_page.dart';
import 'package:cifra/functions/go_orgs_page.dart';
import 'package:cifra/functions/go_statiscs_page.dart';
import 'package:cifra/functions/go_test_page.dart';
import 'package:cifra/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RulesPage extends StatefulWidget {
  const RulesPage({Key? key}) : super(key: key);

  @override
  State<RulesPage> createState() => _RulesPageState();
}

class _RulesPageState extends State<RulesPage> {
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
              ? RowAppTitle(
                  titles: ['Расписание', 'Уведомления'],
            func: [goAdminPage, goGettersPage, goOrgsPage, goStatisticsPage],
                )
              : const ColumnAppTitle(
            titles: ['Расписание', 'Уведомления'],
              func: [goAdminPage, goGettersPage, goOrgsPage, goStatisticsPage]
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
        child: Center(
          child: SizedBox(
            width: pageSize.width-100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: pageSize.width*0.1, vertical: 40),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Center(
                        child: Text('Что нужно знать, чтобы стать фудсейвером!',
                            style:
                                TextStyle(fontSize: 16, fontWeight: FontWeight.w900)),
                      ),
                      SizedBox(height: 55,),
                      Text(
                        '1. Пунктуальность',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900),
                      ),
                      SizedBox(height: 5,),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          ' Важно приезжать на встречи точно в назначенное время, своевременно оповещать куратора о вывозе продуктов и любых изменениях.',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      SizedBox(height: 40,),
                      Text('2. Ответственность',
                          style:
                              TextStyle(fontSize: 14, fontWeight: FontWeight.w900)),
                      SizedBox(height: 5,),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          ' Необходимо самостоятельно убедиться в пригодности продуктов в пищу; дальнейшим распределением еды также занимаются сами фудсейверы. У вас должны быть либо свои контакты для распределения продуктов, либо вы должны быть готовы принять наши рекомендации – а мы постараемся сделать так, чтобы всем было удобно.',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      SizedBox(height: 40,),
                      Text('3. Мобильность и гибкость',
                          style:
                              TextStyle(fontSize: 14, fontWeight: FontWeight.w900)),
                      SizedBox(height: 5,),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                            'Иногда необходимо запрашивать подтверждение вывоза за 30-40 минут до назначенного времени. Вы должны быть готовы как к отмене вывоза, так и, наоборот, к увеличенному объему продуктов. Очень важна помощь фудсейверов, готовых заменить товарищей в случае форсмажора или приехать на экстренный вывоз при необходимости.',
                            style: TextStyle(fontSize: 14)),
                      ),
                      SizedBox(height: 40,),
                      Text('4. Вы можете унести 5-7 кг продуктов',
                          style:
                              TextStyle(fontSize: 14, fontWeight: FontWeight.w900)),
                      SizedBox(height: 5,),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                            'Именно таков средний вес вывоза; иногда он достигает 10-12 кг. Мы подбираем число участников в группе так, чтобы каждый мог унести соответствующий объем продуктов своим ходом без транспортного средства. Если вам по состоянию здоровья нельзя поднимать подобный вес, позаботьтесь о сумке на колесиках или транспортном средстве. В те точки, где вес превышает 12 кг, мы записываем по несколько участников на один вывоз или приглашаем автомобилистов.',
                            style: TextStyle(fontSize: 14)),
                      ),
                      SizedBox(height: 40,),
                      Text('5. Вы терпеливы',
                          style:
                              TextStyle(fontSize: 14, fontWeight: FontWeight.w900)),
                      SizedBox(height: 5,),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                            'Команды собираются по территориальному признаку. Может быть так, что вы пройдете тест и зарегистрируетесь, но в вашем районе ничего не будет происходить долгое время. Если вы ожидаете приглашения в команду сразу после регистрации – сразу скажем, что мы не можем вам этого гарантировать.',
                            style: TextStyle(fontSize: 14)),
                      ),
                      SizedBox(height: 40,),
                      Text(
                          '6. Вы разделяете базовые идеи фудшеринга и готовы ими руководствоваться при участии в проекте',
                          style:
                              TextStyle(fontSize: 14, fontWeight: FontWeight.w900)),
                      SizedBox(height: 5,),
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                            'Нам важно не только спасать конкретные продукты от выбрасывания и раздавать их, но и распространять идеи бережного отношения к ресурсам, взаимопомощи и личной ответственности каждого за происходящее в вашем районе, городе, стране, в мире. Разделяя эти принципы, вы сможете получить от проекта гораздо больше, чем просто бесплатную еду для себя, а также окажете нам помощь и поддержку.',
                            style: TextStyle(fontSize: 14)),
                      ),

                    ],
                  ),
                ),
                const SizedBox(height: 50,),
                const Button(
                    text: 'Пройти тестирование',
                    width: 227,
                    onTap: goTestPage,
                    backgroundColor: Colors.black,
                    fontColor: Colors.white,
                    borderColor: Colors.black,
                    hoveredBorderColor: Color(0xff08A88A),
                    fontSize: 12),
                const SizedBox(height: 70,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
