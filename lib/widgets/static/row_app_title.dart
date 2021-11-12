import 'package:cifra/widgets/widgets.dart';
import 'package:flutter/material.dart';

class RowAppTitle extends StatefulWidget {
  final List<String> titles;

  const RowAppTitle({
    Key? key,
    required this.titles,
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
                onTap: (context) => {},
                fontSize: 15,
                fontColor: Colors.black,
              ),
            )
            .toList());
  }
}
