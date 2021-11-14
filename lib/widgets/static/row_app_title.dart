import 'package:cifra/functions/functions.dart';
import 'package:cifra/functions/go_push_page.dart';
import 'package:cifra/widgets/widgets.dart';
import 'package:flutter/material.dart';

class RowAppTitle extends StatefulWidget {
  final List<String> titles;
  final Function func;
  const RowAppTitle({
    Key? key,

    required this.titles, this.func = goHomePage,
  }) : super(key: key);

  @override
  State<RowAppTitle> createState() => _RowAppTitleState();
}

class _RowAppTitleState extends State<RowAppTitle> {
  @override
  Widget build(BuildContext context) {
    var names = widget.titles;
    return Row(
        children: names
            .map(
              (e) => FlexLink(
                text: e,
                onTap: e=="Статистика"?goAdminPage:widget.func,
                fontSize: 15,
                fontColor: Colors.black,
              ),
            )
            .toList());
  }
}
