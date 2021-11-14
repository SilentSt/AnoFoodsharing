import 'dart:convert';
import 'dart:io';
import 'package:cifra/connectors/send_data.dart';
import 'package:cifra/data/page_state.dart';
import 'package:cifra/headers/login_headers.dart';
import 'package:cifra/widgets/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;

Future getData(Map<String,String> headers, String command, ) async {
  final uri = Uri.parse('https://foodsharing.shitposting.team/api/v1/'+command);
  final response = await http.get(uri, headers: headers);
  //print(response.statusCode);
  //print(response.body);
  if(response.statusCode==200||response.statusCode==201)
    {
      return response.bodyBytes;
    }
  else if(response.statusCode==401)
    {
      var res = await sendData(loginHeaders, 'login', 'grant_type=&username=${emailController.text}&password=${passwordController.text}&scope=&client_id=&client_secret=');
      if(!res.contains("NO_RESULT"))
      {
        var val = await jsonDecode(res);
        await FlutterSession().set("jwt", val['access_token']);
        PageState.logged = true;
      }
      return getData(headers, command);
    }
  else{

  }
  return "NO_RESULT_GET";

}
