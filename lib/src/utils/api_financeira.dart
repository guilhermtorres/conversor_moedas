import 'package:http/http.dart' as http;
import 'dart:convert';

const request = 'https://api.hgbrasil.com/finance?format=json-cors&key=b23e1158';

void apiRequest() async {
  await getData();
}

Future<Map> getData() async {
  http.Response response = await http.get(request);
  return json.decode(response.body);
}
