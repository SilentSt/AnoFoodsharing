import 'package:cifra/pages/getters_page.dart';
import 'package:cifra/pages/statistics_page.dart';
import 'package:flutter/material.dart';

void goGettersPage(BuildContext context)
{
  Navigator.push(context, MaterialPageRoute(builder: (context) => const GettersPage(gridColumns: [],)));
}