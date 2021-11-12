import 'package:cifra/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:cifra/pages/pages.dart';

class ColumnAppTitle extends StatelessWidget {
  const ColumnAppTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side:
                              const BorderSide(color: Colors.white, width: 1)),
                      actions: [
                        Center(
                          child: Column(
                            children: [
                              Link(
                                text: "Контакты",
                                onTap: (context) => {},
                                fontSize: 15,
                                fontColor: Colors.black,
                              ),
                              Link(
                                text: "Описание",
                                onTap: (context) => {},
                                fontSize: 15,
                                fontColor: Colors.black,
                              ),
                              Link(
                                text: "Статистика",
                                onTap: (context) => {},
                                fontSize: 15,
                                fontColor: Colors.black,
                              ),
                              Link(
                                text: "Организациям",
                                onTap: (context) => {},
                                fontSize: 15,
                                fontColor: Colors.black,
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.center,
                          ),
                        )
                      ],
                    );
                  })
            },
        icon: const Icon(
          Icons.menu,
          color: Colors.black,
        ));
  }
}
