import 'package:cifra/data/data.dart';
import 'package:cifra/functions/functions.dart';
import 'package:cifra/functions/go_getters_page.dart';
import 'package:cifra/functions/go_orgs_page.dart';
import 'package:cifra/functions/go_statiscs_page.dart';
import 'package:cifra/functions/go_test_page.dart';
import 'package:cifra/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

class OrgsPage extends StatefulWidget {
  final List<String> gridColumns;

  const OrgsPage({Key? key, required this.gridColumns}) : super(key: key);

  @override
  State<OrgsPage> createState() => _OrgsPageState();
}

class _OrgsPageState extends State<OrgsPage> {
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
            titles: [
              'Пользователи',
              'Получатели',
              'Организации',
              'Статистика'
            ],func: [goAdminPage, goGettersPage, goOrgsPage, goStatisticsPage],
          )
              : const ColumnAppTitle(titles: [
            'Пользователи',
            'Получатели',
            'Организации',
            'Статистика'
          ],func: [goAdminPage, goGettersPage, goOrgsPage, goStatisticsPage]),
          actions: [
            IconButton(
                onPressed: () => {
                  showDialog(
                      context: context,
                      builder: (context) => Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white),
                        alignment: Alignment.center,
                        child: const AlertDialog(
                          actions: [
                            Button(
                                text: "Выйти",
                                width: 150,
                                onTap: goHomePage,
                                backgroundColor: Colors.white,
                                fontColor: Colors.black,
                                borderColor: Colors.black,
                                hoveredBorderColor: Colors.white,
                                fontSize: 15)
                          ],
                        ),
                      ))
                },
                icon: const PngGif(
                  imgPath: "assets/imgs/profile",
                  height: 54,
                  width: 54,
                )),
          ]),
      body: SafeArea(
        child: Container(
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                    color: Color(0x0F000000),
                    blurRadius: 10.0,
                    spreadRadius: 7.0,
                    offset: Offset(
                      0,
                      10.0,
                    ))
              ],
            ),
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 100),
            child: Column(
              children: [
                SizedBox(height: 20,),
                DataTable(
                  dividerThickness: 3,
                  headingRowHeight: 50,
                  columnSpacing: 10,
                  dataRowHeight: 100,

                  rows: [
                    DataRow(cells: [
                      DataCell(Row(
                        children: [
                          Image.asset(
                            "assets/imgs/edit.png",
                            width: 50,
                            height: 50,
                          ),
                          Padding(padding: EdgeInsets.all(30),
                              child:Column(
                                children: const [
                                  Expanded(
                                    child: Text(
                                      "Кекс",
                                      style: TextStyle(
                                          color: Color(0xff08A88A),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15,
                                          fontFamily: "GothamPro"),
                                    ),
                                  ),
                                  Expanded(child:
                                  Text(
                                    "Булочная, пекарня",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15,
                                        fontFamily: "GothamPro"),
                                  )),
                                ],
                              ))
                        ],
                      )),
                      const DataCell(Padding(padding: EdgeInsets.all(30),
                          child:Text(
                            "Ворошиловский проспект, 53/22",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                fontFamily: "GothamPro"),
                          )),),
                      DataCell(Padding(padding: EdgeInsets.all(30),
                        child: Column(
                          children: const [
                            Text(
                              "И.М. Седлак",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  fontFamily: "GothamPro"),
                            ),
                            Text(
                              "+7 978 565 65 74",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  fontFamily: "GothamPro"),
                            ),
                          ],
                        ),
                      )),
                      DataCell(
                          Padding(padding: EdgeInsets.all(30),
                              child:Column(
                                children: const [
                                  Expanded(child: Text(
                                    "Леонова Наталья Леонидовна",
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15,
                                        fontFamily: "GothamPro"),
                                  )),
                                ],
                              ))
                      )
                    ]),
                  ],
                  columns: const [
                    DataColumn(label: Text("Название")),
                    DataColumn(label: Text("Адрес")),
                    DataColumn(label: Text("Контакты")),
                    DataColumn(label: Text("Куратор"))
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
