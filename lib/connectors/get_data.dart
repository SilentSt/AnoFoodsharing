import 'package:http/http.dart' as http;

Future<void> getData()
async {
  var response = await http.get('https://json.flutter.su/echo');
  print("Response status: ${response.statusCode}");
  print("Response body: ${response.body}");
}