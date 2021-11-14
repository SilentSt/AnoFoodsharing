import 'dart:math';

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
import 'package:syncfusion_flutter_charts/charts.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
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
                ?  RowAppTitle(
                    titles: [
                      'Пользователи',
                      'Получатели',
                      'Организации',
                      'Статистика'
                    ],
                    func: [goAdminPage, goGettersPage, goOrgsPage, goStatisticsPage],
                  )
                : ColumnAppTitle(titles: [
                    'Пользователи',
                    'Получатели',
                    'Организации',
                    'Статистика'
                  ], func: [goAdminPage, goGettersPage, goOrgsPage, goStatisticsPage]),
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
        body: SingleChildScrollView(
          padding: EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 500,
                child: ListView(scrollDirection: Axis.horizontal, children: [
                  Container(
                    width: pageSize.width / 4,
                    child: SfCartesianChart(
                      borderColor: Colors.red,
                        primaryXAxis: CategoryAxis(labelRotation: -90),
                        title:
                            ChartTitle(text: "График поставки продуктов Январь"),
                        palette: const [
                          Colors.black
                        ],
                        series: <CartesianSeries>[
                          ColumnSeries<ChartData, String>(
                              dataSource: [
                                ChartData("Крупы", 1, 7, 5),
                              ],
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y1),
                          ColumnSeries<ChartData, String>(
                              dataSource: [
                                ChartData("Молочная продукция", 1, 17, 5)
                              ],
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y1),
                          ColumnSeries<ChartData, String>(
                            dataSource: [
                              ChartData("Кондитерские изделия", 1, 9, 5)
                            ],
                            xValueMapper: (ChartData data, _) => data.x,
                            yValueMapper: (ChartData data, _) => data.y1,
                          ),
                          ColumnSeries<ChartData, String>(
                              dataSource: [
                                ChartData("Хлебобулочная продукция", 1, 30, 5),
                              ],
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y1),
                          ColumnSeries<ChartData, String>(
                            dataSource: [ChartData("Сухие завтраки", 1, 3, 5)],
                            xValueMapper: (ChartData data, _) => data.x,
                            yValueMapper: (ChartData data, _) => data.y1,
                          ),
                          ColumnSeries<ChartData, String>(
                              dataSource: [
                                ChartData("Диетическая продукция", 1, 20, 5),
                              ],
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y1),
                          ColumnSeries<ChartData, String>(
                              dataSource: [ChartData("Напитки", 1, 8, 5)],
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y1),
                          ColumnSeries<ChartData, String>(
                            dataSource: [ChartData("Овощи", 1, 10, 5)],
                            xValueMapper: (ChartData data, _) => data.x,
                            yValueMapper: (ChartData data, _) => data.y1,
                          ),
                          ColumnSeries<ChartData, String>(
                              dataSource: [
                                ChartData("Фрукты", 1, 25, 5),
                              ],
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y1),
                          ColumnSeries<ChartData, String>(
                              dataSource: [ChartData("Мясо", 1, 60, 5)],
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y1),
                          ColumnSeries<ChartData, String>(
                            dataSource: [ChartData("Быстрое питание", 1, 15, 5)],
                            xValueMapper: (ChartData data, _) => data.x,
                            yValueMapper: (ChartData data, _) => data.y1,
                          ),
                        ]),
                  ),
                  Container(
                    width: pageSize.width / 4,
                    child: SfCartesianChart(
                        primaryXAxis: CategoryAxis(labelRotation: -90),
                        title:
                            ChartTitle(text: "График поставки продуктов Февраль"),
                        palette: const [
                          Colors.black
                        ],
                        series: <CartesianSeries>[
                          ColumnSeries<ChartData, String>(
                              dataSource: [
                                ChartData("Крупы", 1, 45, 5),
                              ],
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y1),
                          ColumnSeries<ChartData, String>(
                              dataSource: [
                                ChartData("Молочная продукция", 1, 23, 5)
                              ],
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y1),
                          ColumnSeries<ChartData, String>(
                            dataSource: [
                              ChartData("Кондитерские изделия", 1, 32, 5)
                            ],
                            xValueMapper: (ChartData data, _) => data.x,
                            yValueMapper: (ChartData data, _) => data.y1,
                          ),
                          ColumnSeries<ChartData, String>(
                              dataSource: [
                                ChartData("Хлебобулочная продукция", 1, 16, 5),
                              ],
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y1),
                          ColumnSeries<ChartData, String>(
                            dataSource: [ChartData("Сухие завтраки", 1, 12, 5)],
                            xValueMapper: (ChartData data, _) => data.x,
                            yValueMapper: (ChartData data, _) => data.y1,
                          ),
                          ColumnSeries<ChartData, String>(
                              dataSource: [
                                ChartData("Диетическая продукция", 1, 17, 5),
                              ],
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y1),
                          ColumnSeries<ChartData, String>(
                              dataSource: [ChartData("Напитки", 1, 23, 5)],
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y1),
                          ColumnSeries<ChartData, String>(
                            dataSource: [ChartData("Овощи", 1, 11, 5)],
                            xValueMapper: (ChartData data, _) => data.x,
                            yValueMapper: (ChartData data, _) => data.y1,
                          ),
                          ColumnSeries<ChartData, String>(
                              dataSource: [
                                ChartData("Фрукты", 1, 19, 5),
                              ],
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y1),
                          ColumnSeries<ChartData, String>(
                              dataSource: [ChartData("Мясо", 1, 23, 5)],
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y1),
                          ColumnSeries<ChartData, String>(
                            dataSource: [ChartData("Быстрое питание", 1, 17, 5)],
                            xValueMapper: (ChartData data, _) => data.x,
                            yValueMapper: (ChartData data, _) => data.y1,
                          ),
                        ]),
                  ),
                  Container(
                    width: pageSize.width / 4,
                    child: SfCartesianChart(
                        primaryXAxis: CategoryAxis(labelRotation: -90),
                        title: ChartTitle(text: "График поставки продуктов Март"),
                        palette: const [
                          Colors.black
                        ],
                        series: <CartesianSeries>[
                          ColumnSeries<ChartData, String>(
                              dataSource: [
                                ChartData("Крупы", 1, 4, 5),
                              ],
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y1),
                          ColumnSeries<ChartData, String>(
                              dataSource: [
                                ChartData("Молочная продукция", 1, 3, 5)
                              ],
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y1),
                          ColumnSeries<ChartData, String>(
                            dataSource: [
                              ChartData("Кондитерские изделия", 1, 6, 5)
                            ],
                            xValueMapper: (ChartData data, _) => data.x,
                            yValueMapper: (ChartData data, _) => data.y1,
                          ),
                          ColumnSeries<ChartData, String>(
                              dataSource: [
                                ChartData("Хлебобулочная продукция", 1, 12, 5),
                              ],
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y1),
                          ColumnSeries<ChartData, String>(
                            dataSource: [ChartData("Сухие завтраки", 1, 15, 5)],
                            xValueMapper: (ChartData data, _) => data.x,
                            yValueMapper: (ChartData data, _) => data.y1,
                          ),
                          ColumnSeries<ChartData, String>(
                              dataSource: [
                                ChartData("Диетическая продукция", 1, 34, 5),
                              ],
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y1),
                          ColumnSeries<ChartData, String>(
                              dataSource: [ChartData("Напитки", 1, 20, 5)],
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y1),
                          ColumnSeries<ChartData, String>(
                            dataSource: [ChartData("Овощи", 1, 12, 5)],
                            xValueMapper: (ChartData data, _) => data.x,
                            yValueMapper: (ChartData data, _) => data.y1,
                          ),
                          ColumnSeries<ChartData, String>(
                              dataSource: [
                                ChartData("Фрукты", 1, 10, 5),
                              ],
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y1),
                          ColumnSeries<ChartData, String>(
                              dataSource: [ChartData("Мясо", 1, 1, 5)],
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y1),
                          ColumnSeries<ChartData, String>(
                            dataSource: [ChartData("Быстрое питание", 1, 19, 5)],
                            xValueMapper: (ChartData data, _) => data.x,
                            yValueMapper: (ChartData data, _) => data.y1,
                          ),
                        ]),
                  ),
                  Container(
                    width: pageSize.width / 4,
                    child: SfCartesianChart(
                        primaryXAxis: CategoryAxis(labelRotation: -90),
                        title:
                            ChartTitle(text: "График поставки продуктов Апрель"),
                        palette: const [
                          Colors.black
                        ],
                        series: <CartesianSeries>[
                          ColumnSeries<ChartData, String>(
                              dataSource: [
                                ChartData("Крупы", 1, 12, 5),
                              ],
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y1),
                          ColumnSeries<ChartData, String>(
                              dataSource: [
                                ChartData("Молочная продукция", 1, 16, 5)
                              ],
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y1),
                          ColumnSeries<ChartData, String>(
                            dataSource: [
                              ChartData("Кондитерские изделия", 1, 12, 5)
                            ],
                            xValueMapper: (ChartData data, _) => data.x,
                            yValueMapper: (ChartData data, _) => data.y1,
                          ),
                          ColumnSeries<ChartData, String>(
                              dataSource: [
                                ChartData("Хлебобулочная продукция", 1, 15, 5),
                              ],
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y1),
                          ColumnSeries<ChartData, String>(
                            dataSource: [ChartData("Сухие завтраки", 1, 18, 5)],
                            xValueMapper: (ChartData data, _) => data.x,
                            yValueMapper: (ChartData data, _) => data.y1,
                          ),
                          ColumnSeries<ChartData, String>(
                              dataSource: [
                                ChartData("Диетическая продукция", 1, 16, 5),
                              ],
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y1),
                          ColumnSeries<ChartData, String>(
                              dataSource: [ChartData("Напитки", 1, 28, 5)],
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y1),
                          ColumnSeries<ChartData, String>(
                            dataSource: [ChartData("Овощи", 1, 21, 5)],
                            xValueMapper: (ChartData data, _) => data.x,
                            yValueMapper: (ChartData data, _) => data.y1,
                          ),
                          ColumnSeries<ChartData, String>(
                              dataSource: [
                                ChartData("Фрукты", 1, 10, 5),
                              ],
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y1),
                          ColumnSeries<ChartData, String>(
                              dataSource: [ChartData("Мясо", 1, 1, 5)],
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y1),
                          ColumnSeries<ChartData, String>(
                            dataSource: [ChartData("Быстрое питание", 1, 14, 5)],
                            xValueMapper: (ChartData data, _) => data.x,
                            yValueMapper: (ChartData data, _) => data.y1,
                          ),
                        ]),
                  ),
                ]),
              ),
              Text("Таблица получения продуктов Январь", style:const TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black)),
              DataTable(columns: const [
                DataColumn(label: Text("Поставщик")),
                DataColumn(label: Text("Тип продукции")),
                DataColumn(label: Text("Дата")),
                DataColumn(label: Text("Принявший волонтер")),
                DataColumn(label: Text("Ответственный куратор")),
                DataColumn(label: Text("Колличество продукци"))
              ], rows: const [
                DataRow(cells: [
                  DataCell(Text("ИП Сухарецк")),
                  DataCell(Text("Хлебобулочная продукция")),
                  DataCell(Text("5.01.2021")),
                  DataCell(Text("Светличная Карина")),
                  DataCell(Text("Леонова Наталья Владимировна")),
                  DataCell(Text("1 кг")),




                ]),
                DataRow(cells: [
                  DataCell(Text("ИП Сухарецк")),
                  DataCell(Text("Молочная продукция")),
                  DataCell(Text("6.01.2021")),
                  DataCell(Text("Первушин Максим")),
                  DataCell(Text("Васильева Виолетта Андреевна")),
                  DataCell(Text("3 кг")),


                ]),
                DataRow(cells: [
                  DataCell(Text("ИП У дома")),
                  DataCell(Text("Напитки")),
                  DataCell(Text("7.01.2021")),
                  DataCell(Text("Светличная Карина")),
                  DataCell(Text("Леонова Наталья Владимировна")),
                  DataCell(Text("2 кг")),
                ]),
                DataRow(cells: [
                  DataCell(Text("Магнит")),
                  DataCell(Text("Мясо")),
                  DataCell(Text("5.01.2021")),
                  DataCell(Text("Первушин Максим")),
                  DataCell(Text("Васильева Виолетта Андреевна")),
                  DataCell(Text("0.5 кг")),
                ]),
                DataRow(cells: [
                  DataCell(Text("Пятерочка")),
                  DataCell(Text("Быстрые завтраки")),
                  DataCell(Text("9.01.2021")),
                  DataCell(Text("Светличная Карина")),
                  DataCell(Text("Леонова Наталья Владимировна")),
                  DataCell(Text("5 кг"))
                ]),


              ])
            ],
          ),
        ));
  }
}

class ChartData {
  ChartData(this.x, this.y, this.y1, this.y2);

  final String x;
  final double? y;
  final double? y1;
  final double? y2;
}
