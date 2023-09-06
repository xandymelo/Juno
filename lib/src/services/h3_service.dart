import 'package:http/http.dart' as http;

import 'config.dart';

Future<String> fetchData(String bairroPartida, String bairroDestino) async {
  final Uri uri = Uri.http(
    AppConfig.serverIp,
    '/bairrosAoRedor/$bairroPartida/$bairroDestino',
  );

  final response = await http.get(uri);

  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Failed to load data. Status code: ${response.statusCode}');
  }
}
