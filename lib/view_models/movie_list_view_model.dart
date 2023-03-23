import 'package:flutter/material.dart';
import 'package:mvvm_viblo_flutter/services/web_service.dart';
import 'movie_view_model.dart';

class MovieListViewModel extends ChangeNotifier {
  List<MovieViewModel> movies = <MovieViewModel>[];

  Future<void> fetchMovies(String keyword) async {
    final results = await WebService().fetchMovies(keyword);
    movies = results.map((e) => MovieViewModel(movie: e)).toList();
    notifyListeners();
  }
}
