import 'package:cifra/data/data.dart';
import 'package:cifra/functions/functions.dart';
import 'package:cifra/functions/go_test_page.dart';
import 'package:cifra/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

class AdminPage extends StatefulWidget {
  final List<String> gridColumns;

  const AdminPage({Key? key, required this.gridColumns}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
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
                  titles: [
                    'Пользователи',
                    'Получатели',
                    'Организации',
                    'Статистика'
                  ],
                )
              : const ColumnAppTitle(titles: [
                  'Пользователи',
                  'Получатели',
                  'Организации',
                  'Статистика'
                ]),
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
            child: DataTable(
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
                              "Первушин Максим Русланович",
                              style: TextStyle(
                                  color: Color(0xff08A88A),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  fontFamily: "GothamPro"),
                            ),
                          ),
                          Expanded(child:
                          Text(
                            "+7 800 535 35 35",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                fontFamily: "GothamPro"),
                          )),
                          Expanded(
                            child: Text(
                              "frontend@ya.ru",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  fontFamily: "GothamPro"),
                            ),
                          ),
                        ],
                      ))
                    ],
                  )),
                  const DataCell(Padding(padding: EdgeInsets.all(30),
                      child:Text(
                    "г. Ростов-на-Дону, Большая Садовая, 69",
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
                          "Картошкина Н.Ю.",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              fontFamily: "GothamPro"),
                        ),
                        Text(
                          "Иванов И.И.",
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
                          "Леонова Наталья Владимировна",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              fontFamily: "GothamPro"),
                        )),
                        Expanded(
                          child: Text(
                            "+7 960 253 36 97",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                fontFamily: "GothamPro"),
                          ),
                        ),
                        Expanded( child:Text(
                          "leonova_055@mail.ru",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              fontFamily: "GothamPro"),
                        ))
                      ],
                    ))
                  )
                ]),
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
                              "Светличная Карина Степановна",
                              style: TextStyle(
                                  color: Color(0xff08A88A),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  fontFamily: "GothamPro"),
                            ),
                          ),
                          Expanded(child:Text(
                            "+7 800 353 35 35",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                fontFamily: "GothamPro"),
                          )),
                          Expanded(
                            child: Text(
                              "karikari@ya.ru",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  fontFamily: "GothamPro"),
                            ),
                          ),
                        ],
                      ))
                    ],
                  )),
                  const DataCell(Padding(padding: EdgeInsets.all(30),
                      child:Text(
                    "г. Ростов-на-Дону, Красноармейская, 129",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        fontFamily: "GothamPro"),
                  ))),
                  DataCell(Column(
                    children: const [

                    ],
                  )),
                  const DataCell(
                      Icon(Icons.add, size: 20,)
                  )
                ]),
              ],
              columns: const [
                DataColumn(label: Text("ФИО")),
                DataColumn(label: Text("Адрес")),
                DataColumn(label: Text("Получатели")),
                DataColumn(label: Text("Куратор"))
              ],
            )),
      ),
    );
  }
}
