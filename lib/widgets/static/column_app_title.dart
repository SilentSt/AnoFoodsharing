import 'package:cifra/functions/go_admin_page.dart';
import 'package:cifra/functions/go_home_page.dart';
import 'package:cifra/functions/go_statiscs_page.dart';
import 'package:cifra/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:cifra/pages/pages.dart';

class ColumnAppTitle extends StatelessWidget {
  final List<String> titles;
  final List<Function> func;
  const ColumnAppTitle({
    Key? key, required this.titles, required this.func,
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
                      onTap: func[titles.indexOf(e)],
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
