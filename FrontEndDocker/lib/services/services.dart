import 'dart:developer';
import 'package:frontend_docker/model/comida.dart';
import 'package:frontend_docker/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/comida.dart';

class ApiService {
  Future<http.Response> insertarComida(Comida comida) {
    var url = Uri.parse(
        ApiConstants.baseUrl + ApiConstants.endPoint + ApiConstants.insert);
    return http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(comida.toJson()),
    );
  }

  Future<List<Comida>?> getComidas() async {
    try {
      var url = Uri.parse(
          ApiConstants.baseUrl + ApiConstants.endPoint + ApiConstants.list);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Comida> comidas = List<Comida>.from(
            json.decode(response.body).map((e) => Comida.fromJson(e)));
        return comidas;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
