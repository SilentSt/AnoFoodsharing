import 'package:http/http.dart' as http;

Future<String> sendData(Map<String,String> headers,String command,String body ) async {
  //final jsonString = json.encode(toJson());
  final uri = Uri.parse('https://foodsharing.shitposting.team/api/v1/'+command);
  //final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
  final response = await http.post(uri, headers: headers, body: body);
  print(response.statusCode);
  print(response.body);
  if(response.statusCode==200||response.statusCode==201)
  {
    return response.body;
  }
  return "NO_RESULT_SEND";
  //print(response.statusCode);
  //print(response.body);
}
Future<String> sendMapData(Map<String,String> headers,String command,Map<String, dynamic> body ) async {
  //final jsonString = json.encode(toJson());
  final uri = Uri.parse('https://foodsharing.shitposting.team/api/v1/'+command);
  //final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
  final response = await http.post(uri, headers: headers, body: body);
  print(response.statusCode);
  print(response.body);
  if(response.statusCode==200||response.statusCode==201)
  {
    return response.body;
  }
  return "NO_RESULT_SEND";
  //print(response.statusCode);
  //print(response.body);
}
///'grant_type=&username=$userName&password=$password&scope=&client_id=&client_secret='