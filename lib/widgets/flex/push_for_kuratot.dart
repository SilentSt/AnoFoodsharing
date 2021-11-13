import 'package:cifra/functions/go_push_page.dart';
import 'package:flutter/material.dart';
import 'package:cifra/widgets/flex/png_gif.dart';

class PushForKurator extends StatelessWidget {
  const PushForKurator({
    Key? key,
    required this.pageSize,
  }) : super(key: key);
  final Size pageSize;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(100),
        child: Container(
          padding: EdgeInsets.all(40),
          child: Column(
            children: [
              Text('Уведомление куратору!',
              style: TextStyle(fontWeight: FontWeight.w700),
              ),
              Text('Отправьте своему куратору сообщение по этому запросу'),
              TextField(style: TextStyle(height: 500)),
              TextButton(onPressed: goPushPage(context), child: Text('Отправить'))
            ],
          ),
        ),
      ),
    );
  }
}