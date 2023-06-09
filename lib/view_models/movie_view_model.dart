import 'package:mvvm_viblo_flutter/models/movie.dart';

class MovieViewModel {
  final Movie? movie;

  MovieViewModel({this.movie});

  String? get title {
    return movie?.title;
  }

  String? get poster {
    return movie?.poster;
  }
}