import '../../data/data.dart';
import 'package:flutter/material.dart';

class Link extends StatelessWidget {
  final String text;
  final Function onTap;
  final Color fontColor;
  final double fontSize;
  final Color borderColor;
  final double width;
  const Link({
    Key? key,
    required this.text,
    required this.onTap,
    required this.fontColor,
    required this.fontSize,
    this.borderColor = Colors.white,
    this.width = 350
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: width,
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: borderColor, width: 1))),
      child: GestureDetector(
        onTap: () => onTap(context),
        child: Text(
          text,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontFamily: 'GothamPro',
            color: fontColor,
            fontSize: fontSize,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
