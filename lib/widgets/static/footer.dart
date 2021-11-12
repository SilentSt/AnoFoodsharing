import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 0),
      color: const Color(0xffFFE17D),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
              child: Text(
                "Контакты",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              )),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () => {},
                  icon: Image.asset("assets/imgs/telegram.png")),
              IconButton(
                  onPressed: () => {},
                  icon: Image.asset("assets/imgs/whatsapp.png")),
              IconButton(
                  onPressed: () => {},
                  icon: Image.asset("assets/imgs/vk.png")),
              IconButton(
                  onPressed: () => {},
                  icon: Image.asset("assets/imgs/instagram.png")),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          const Center(
              child: Text("Тут всякий текст, который обычно снизу",
                  style: TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w400))),
          const Center(
              child: Text("сайта, но я не знаю, что туда писать",
                  style: TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w400)))
        ],
      ),
    );
  }
}
