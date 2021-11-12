import 'package:cifra/widgets/static/on_hover.dart';
import 'package:flutter/material.dart';
import '../../data/data.dart';

class Button extends StatefulWidget {
  static const Color green = Color(0xff08A88A);
  final String text;
  final double width;
  final Function onTap;
  final Color backgroundColor;
  final Color fontColor;
  final Color borderColor;
  final double fontSize;
  final Color hoveredBackgroundColor;
  final Color hoveredBorderColor;

  const Button({Key? key,
    required this.text,
    required this.width,
    required this.onTap,
    required this.backgroundColor,
    this.hoveredBackgroundColor = green,
    required this.fontColor,
    required this.borderColor,
    required this.hoveredBorderColor,
    required this.fontSize})
      : super(key: key);

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return OnHover(
      builder: (bool isHovered) {
        return TextButton(
            onPressed: () => widget.onTap(context),
            child: Container(
              width: widget.width,
              margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              decoration: BoxDecoration(
                border: Border.all(color: isHovered?widget.hoveredBorderColor:widget.borderColor, width: 1),
                color: isHovered?widget.hoveredBackgroundColor:widget.backgroundColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  widget.text,
                  style: TextStyle(
                      color: widget.fontColor,
                      fontWeight: FontWeight.w400,
                      fontSize: widget.fontSize,
                      fontFamily: 'GothamPro'),
                ),
              ),
            ));
      },
    );
  }
}
