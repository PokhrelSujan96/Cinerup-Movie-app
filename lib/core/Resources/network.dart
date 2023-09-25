import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:movieapp/core/Resources/Apis.dart';
import 'package:movieapp/core/Resources/Movie.dart';

List<Movie> parseMovie(String responseBody) {
  var list = jsonDecode(responseBody) as List<dynamic>;

  List<Movie> movies = list.map((model) => Movie.fromJson(model)).toList();

  return movies;
}

Future<List<Movie>> fetchMovie() async {
  final response =
      await http.get(Uri.parse(urlApi));

  if (response.statusCode == 200) {
    return compute(parseMovie, response.body);
  } else {
    throw Exception("Request Api Error");
  }
}
