import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

Future<String> getData(Map<String,String> headers, String command, ) async {
  final uri = Uri.parse('https://foodsharing.shitposting.team/'+command);
  final response = await http.get(uri, headers: headers);
  print(response.statusCode);
  if(response.statusCode==200||response.statusCode==201)
    {
      return response.body;
    }
  return "NO_RESULT_GET";
  //print(response.statusCode);
  //print(response.body);
}
