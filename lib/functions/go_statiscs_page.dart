import 'package:cifra/pages/statistics_page.dart';
import 'package:flutter/material.dart';

void goStatisticsPage(BuildContext context)
{
  Navigator.push(context, MaterialPageRoute(builder: (context) => const StatisticsPage()));
}