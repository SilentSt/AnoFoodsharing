import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  final Widget child;
  const CardContainer({
    Key? key,
    required this.pageSize, required this.child,
  }) : super(key: key);

  final Size pageSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: pageSize.width * 0.75,
      padding: EdgeInsets.symmetric(
          vertical: 0.03 * pageSize.width,
          horizontal: 0.05 * pageSize.width),
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
              ))
        ],
      ),
      child: Center(child: child),
    );
  }
}