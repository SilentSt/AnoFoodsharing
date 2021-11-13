import 'package:cifra/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:cifra/pages/pages.dart';

class ColumnAppTitle extends StatelessWidget {
  final List<String> titles;
  const ColumnAppTitle({
    Key? key, required this.titles,
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
                            children: titles
                        .map(
                        (e) => FlexLink(
                      text: e,
                      onTap: (context) => {},
                      fontSize: 15,
                      fontColor: Colors.black,
                    ),
                    )
                        .toList(),
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
