import 'package:cifra/pages/home_page.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Image.asset("assets/imgs/logo.png", width: 55,height: 55,),
      onPressed: () => {
        Navigator.push(context,
            MaterialPageRoute(builder: (context)=>const HomePage()))
      },
    );
  }
}