import 'package:flutter/cupertino.dart';
import '../widgets.dart';

class PngGif extends StatelessWidget {
  final double width;
  final double height;

  const PngGif({
    Key? key,
    required this.imgPath,
    required this.width,
    required this.height,
  }) : super(key: key);

  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return OnHover(builder: (bool isHovered) {
      return Image.asset(isHovered ? imgPath + ".gif" : imgPath + ".png",
          width: width, height: height);
    });
  }
}
