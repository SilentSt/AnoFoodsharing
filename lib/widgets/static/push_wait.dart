import 'package:flutter/material.dart';
import 'package:cifra/widgets/flex/png_gif.dart';

class PushWait extends StatelessWidget {
  const PushWait({
    Key? key,
    required this.pageSize,
  }) : super(key: key);

  final Size pageSize;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 200.0),
        child: Container(
          width: pageSize.width * 0.5,
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
                  ),
                )
              ]),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Нужно немножко подождать :)',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  PngGif(imgPath: 'assets/imgs/clock', height: 150, width: 150),
                  Text(
                      'Ваша заявка на волонтерство находится на рассмотрении!'),
                  Text('Вам будет назначен куратор.')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
