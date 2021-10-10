import 'dart:convert';
import 'dart:io';

import 'package:acropolis/helper/model.dart';

import 'package:http/http.dart' as http;

class ApiServices {
  Future<DataM> question() async {
    var responseJson;
    try {
      var uri = Uri.https(
        'aman317.000webhostapp.com',
        'astro/acro.json',
      );

      var response = await http.get(uri);

      if (response.statusCode == 200) {
        final jsonBody = jsonDecode(response.body);
        responseJson = DataM.fromJson(jsonBody);
      } else {
        final jsonBody = json.decode(response.body);

        responseJson = jsonBody;
      }
    } catch (e) {}
    return responseJson;
  }
}
