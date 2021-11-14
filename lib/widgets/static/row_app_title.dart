import 'package:cifra/functions/functions.dart';
import 'package:cifra/functions/go_push_page.dart';
import 'package:cifra/functions/go_statiscs_page.dart';
import 'package:cifra/widgets/widgets.dart';
import 'package:flutter/material.dart';

class RowAppTitle extends StatefulWidget {
  final List<String> titles;
  final List<Function> func;
  const RowAppTitle({
    Key? key,

    required this.titles, required this.func,
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
                onTap: widget.func[names.indexOf(e)],
                fontSize: 15,
                fontColor: Colors.black,
              ),
            )
            .toList());
  }
}
