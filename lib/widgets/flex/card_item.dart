import 'package:flutter/material.dart';
import '../widgets.dart';

class CardItem extends StatelessWidget {
  final String imgPath;
  final String text;
  const CardItem({
    Key? key, required this.imgPath, required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PngGif(imgPath: imgPath, width: 200, height: 200),
        SizedBox(
          width: 285,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontFamily: "GothamPro",
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.black,
                fontStyle: FontStyle.italic),
          ),
        )
      ],
    );
  }
}

