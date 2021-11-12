import 'package:cifra/data/data.dart';
import 'package:cifra/functions/functions.dart';
import 'package:flutter/cupertino.dart';

void logout(BuildContext context)
{
  PageState.logged = false;
  goHomePage(context);
}