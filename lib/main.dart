import 'package:flutter/material.dart';
import 'package:mvvm_viblo_flutter/view/movie_list_page.dart';
import 'package:mvvm_viblo_flutter/view_models/movie_list_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies',
      home: ChangeNotifierProvider(
        create: (context) => MovieListViewModel(),
        child: const MovieListPage(),
      ),
    );
  }
}

