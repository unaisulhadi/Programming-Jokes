import 'dart:convert';

import 'package:jokes_app/model/jokes_response.dart';
import 'package:http/http.dart' as http;

class APIManager {
  String URL = "https://v2.jokeapi.dev/joke/Programming?type=single";

  Future<JokeResponse> getJoke() async {
    JokeResponse jokesResponse;

    try {
      var client = http.Client();
      var response = await client.get(Uri.parse(URL));

      if (response.statusCode == 200) {
        var jsonString = response.body;
        print(jsonString);
        var jsonMap = json.decode(jsonString);

        jokesResponse = JokeResponse.fromJson(jsonMap);
      }
    } catch (error) {
      return jokesResponse;
    }
    return jokesResponse;
  }
}
