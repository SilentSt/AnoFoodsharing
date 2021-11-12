import 'package:flutter/material.dart';
import '../widgets.dart';

class CCard extends StatelessWidget {
  final List<String> imgPath;
  final List<String> text;
  final String title;

  const CCard({
    Key? key,
    required this.imgPath,
    required this.text,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pageWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black,
              fontFamily: "GothamPro"),
        ),
        pageWidth > 1320
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: imgPath
                    .map((e) =>
                        CardItem(imgPath: e, text: text[imgPath.indexOf(e)]))
                    .toList())
            : Column(
                children: imgPath
                    .map((e) =>
                        CardItem(imgPath: e, text: text[imgPath.indexOf(e)]))
                    .toList())
      ],
    );
  }
}
