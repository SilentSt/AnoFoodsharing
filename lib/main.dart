import 'package:flutter/material.dart';
import 'pages/pages.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}



class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    //getData();

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'cifra',
      home: HomePage(),
    );
  }
}


