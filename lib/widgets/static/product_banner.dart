import 'package:cifra/widgets/flex/png_gif.dart';
import 'package:cifra/widgets/flex/png_gif.dart';
import 'package:cifra/widgets/flex/png_gif.dart';
import 'package:flutter/material.dart';

class ProductBanner extends StatelessWidget {
  const ProductBanner({
    Key? key,
    required this.pageSize,
  }) : super(key: key);

  final Size pageSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: pageSize.width * 0.75,
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
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: pageSize.width*0.09, vertical: pageSize.width*0.03),
        child: Column(
          children: [
            pageSize.width>400?Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PngGif(imgPath: "assets/imgs/packet", width: pageSize.width*0.12,height: pageSize.width*0.12,),
                PngGif(imgPath: "assets/imgs/pizza", width: pageSize.width*0.12,height: pageSize.width*0.12,),
                PngGif(imgPath: "assets/imgs/apple", width: pageSize.width*0.12,height: pageSize.width*0.12,)
              ],
            ):Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PngGif(imgPath: "assets/imgs/packet", width: pageSize.width*0.18,height: pageSize.width*0.18,),
                PngGif(imgPath: "assets/imgs/potato", width: pageSize.width*0.18,height: pageSize.width*0.18,),
              ],
            ),
            pageSize.width>450?Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: pageSize.width*0.018,
                ),
                PngGif(imgPath: "assets/imgs/potato", width: pageSize.width*0.12,height: pageSize.width*0.12,),
                PngGif(imgPath: "assets/imgs/sossige", width: pageSize.width*0.12,height: pageSize.width*0.12,),
                PngGif(imgPath: "assets/imgs/branch", width: pageSize.width*0.12,height: pageSize.width*0.12,),
              ],
            ):const SizedBox(height: 1,),
            SizedBox(
              width: pageSize.width*0.02,
            ),
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  TextSpan(
                      text: "Вместе спасаем",
                      style: TextStyle(
                          fontSize: pageSize.width>600?60:30,
                          fontWeight: FontWeight.w700)),
                  TextSpan(
                      text: " ПРОДУКТЫ",
                      style: TextStyle(
                          fontSize: pageSize.width>600?60:30,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.italic)),
                ])),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Каждый день магазины, кафе и производители выбрасывают тонны продуктов и готовых\n блюд, которые не были проданы вовремя или имеют незначительные дефекты.\nЗачем выбрасывать еду, если можно поделиться с нуждающимися?",
              style: TextStyle(fontSize: pageSize.width>600?20:15, fontWeight: FontWeight.w400), textAlign: TextAlign.center,),
          ],
        ),
      ),
    );
  }
}