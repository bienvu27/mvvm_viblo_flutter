import 'dart:convert';

import 'package:mvvm_viblo_flutter/model/movie.dart';
import 'package:http/http.dart' as http;

class WebService {
  String apiKey = '48461b56';


  Future<List<Movie>> fetchMovies(String keyword) async {
    final url = 'https://www.omdbapi.com/?s=$keyword&apikey=$apiKey';
    final respose = await http.get(Uri.parse(url));
    if (respose.statusCode == 200) {
      final body = jsonDecode(respose.body);
      final Iterable json = body["Search"];
      return json.map((e) => Movie.fromJson(e)).toList();
    } else {
      throw Exception('Unable to perform request!');
    }
  }
}
