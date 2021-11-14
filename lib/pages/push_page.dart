import 'package:cifra/data/data.dart';
import 'package:cifra/functions/go_admin_page.dart';
import 'package:cifra/functions/go_getters_page.dart';
import 'package:cifra/functions/go_orgs_page.dart';
import 'package:cifra/functions/go_push_page.dart';
import 'package:cifra/functions/go_statiscs_page.dart';
import 'package:cifra/widgets/static/push_wait.dart';
import 'package:cifra/widgets/widgets.dart';
import 'package:flutter/material.dart';

class PushPage extends StatefulWidget {
  const PushPage({Key? key}) : super(key: key);

  @override
  State<PushPage> createState() => _PushPageState();
}

class _PushPageState extends State<PushPage> {
  @override
  Widget build(BuildContext context) {
    var pageSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: const Logo(),
        title: RowAppTitle(
          titles: ['Уведомления'],
          func: [goPushPage],
        ),
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
                  icon: const PngGif(
                    imgPath: "assets/imgs/profile",
                    height: 54,
                    width: 54,
                  )),
        ],
      ),
      body: PageState.role > 1
          ? Center(
              child: Container(
                width: pageSize.width * 0.7,
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
                        ))
                  ],
                ),
                child: DataTable(
                  dividerThickness: 3,
                  headingRowHeight: 50,
                  columnSpacing: 10,
                  dataRowHeight: 200,
                  rows: [
                    DataRow(cells: [
                      DataCell(
                        IconButton(
                          icon: Image.asset("assets/imgs/edit.png"),
                          iconSize: 50,
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    actions: [
                                      Center(
                                        child: Container(
                                          padding: const EdgeInsets.all(40),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Column(
                                            children: [
                                              const Text(
                                                'Уведомление куратору!',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              const SizedBox(height: 30,),
                                              const Text(
                                                  'Отправьте своему куратору сообщение по этому запросу'),
                                              const SizedBox(height: 30,),
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(15),
                                                  border: Border.fromBorderSide(BorderSide(color: Colors.black, width: 2)),
                                                ),
                                                child: TextFormField(
                                                  minLines: 8,
                                                  // any number you need (It works as the rows for the textarea)
                                                  keyboardType:
                                                      TextInputType.multiline,
                                                  maxLines: null,
                                                ),
                                              ),
                                              const SizedBox(height: 50,),
                                              const Button(
                                                  text: "Отправить",
                                                  width: 150,
                                                  onTap: goPushPage,
                                                  backgroundColor:
                                                      Colors.black,
                                                  fontColor: Colors.white,
                                                  borderColor: Colors.black,
                                                  hoveredBorderColor:
                                                      Colors.white,
                                                  fontSize: 15,
                                              hoveredBackgroundColor: Colors.green,)
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  );
                                });
                          },
                        ),
                      ),
                      DataCell(Row(
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(30),
                              child: Column(
                                children: const [
                                  Expanded(
                                    child: Text(
                                      "14.11.2021",
                                      style: TextStyle(
                                          color: Color(0xff08A88A),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15,
                                          fontFamily: "GothamPro"),
                                    ),
                                  ),
                                ],
                              ))
                        ],
                      )),
                      DataCell(
                        Column(
                          children: const [
                            Padding(
                                padding: EdgeInsets.all(30),
                                child: Text(
                                  "Ворошиловский проспект, 53/22",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                      fontFamily: "GothamPro"),
                                )),
                            Padding(
                                padding: EdgeInsets.all(30),
                                child: Text(
                                  "16:00 - 16:30",
                                  style: TextStyle(
                                      color: Color(0xff08A88A),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                      fontFamily: "GothamPro"),
                                )),
                          ],
                        ),
                      ),
                      DataCell(Padding(
                        padding: const EdgeInsets.all(30),
                        child: Column(
                          children: [
                            IconButton(
                                onPressed: () => {},
                                icon: Image.asset("assets/imgs/act.png"))
                          ],
                        ),
                      )),
                      DataCell(Padding(
                          padding: EdgeInsets.all(30),
                          child: Column(
                            children: const [
                              Expanded(
                                  child: Text(
                                "Красноармейская улица, 210/117, кв. 67",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                    fontFamily: "GothamPro"),
                              )),
                              Expanded(
                                child: Text(
                                  "17:00 - 17:30",
                                  style: TextStyle(
                                      color: Color(0xff08A88A),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                      fontFamily: "GothamPro"),
                                ),
                              ),
                              Expanded(
                                  child: Text(
                                "Крыловский переулок, 105, кв.6",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                    fontFamily: "GothamPro"),
                              )),
                              Expanded(
                                child: Text(
                                  "18:00 - 18:30",
                                  style: TextStyle(
                                      color: Color(0xff08A88A),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                      fontFamily: "GothamPro"),
                                ),
                              ),
                            ],
                          ))),
                      DataCell(Padding(
                          padding: EdgeInsets.all(30),
                          child: Column(
                            children: [
                              IconButton(
                                  onPressed: () => {},
                                  icon: Image.asset("assets/imgs/act.png")),
                              IconButton(
                                  onPressed: () => {},
                                  icon: Image.asset("assets/imgs/act.png"))
                            ],
                          )))
                    ]),
                  ],
                  columns: const [
                    DataColumn(label: Text("")),
                    DataColumn(label: Text("Дата")),
                    DataColumn(label: Text("Где забрать")),
                    DataColumn(label: Text("Акт")),
                    DataColumn(label: Text("Куда доставить")),
                    DataColumn(label: Text("Акт"))
                  ],
                ),
              ),
            )
          : SingleChildScrollView(
              child: Center(
                  child: PushWait(
              pageSize: pageSize,
            ))),
    );
  }
}
