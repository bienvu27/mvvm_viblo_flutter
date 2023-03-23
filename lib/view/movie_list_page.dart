import 'package:flutter/material.dart';
import 'package:mvvm_viblo_flutter/view_models/movie_list_view_model.dart';
import 'package:provider/provider.dart';

import '../widgets/movie_list.dart';

class MovieListPage extends StatefulWidget {
  const MovieListPage({Key? key}) : super(key: key);

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<MovieListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10)
              ),
              child: TextField(
                controller: _controller,
                onSubmitted: (value){
                  if(value.isNotEmpty){
                    vm.fetchMovies(value);
                    _controller.clear();
                  }
                },
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none
                ),
              ),
            ),
            Expanded(
                child: MovieList(movies: vm.movies,))
          ],
        ),
      ),
    );
  }
}
