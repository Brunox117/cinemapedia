import 'package:cinemapedia/presentation/providers/movies/movies_providers.dart';

import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../config/helpers/enumerations/movies_categories_enum.dart';
import '../../../domain/entities/movie.dart';

class MoviesView extends ConsumerStatefulWidget {
  final String category;
  const MoviesView({super.key, required this.category});

  @override
  MoviesViewState createState() => MoviesViewState();
}

class MoviesViewState extends ConsumerState<MoviesView> {
  String title = '';

  @override
  void initState() {
    super.initState();
  }

  //REGRESA LAS PELICULAS SEGUND EL PARAMETRO CATEGORY
  Widget obtenerMasonry() {
    if (widget.category ==
        MoviesCategoriesEnum.nowPlayingMovies.toString().split('.').last) {
      List<Movie> movies = ref.watch(nowPlayingMoviesProvider);
      void loadNextPage() =>
          ref.watch(nowPlayingMoviesProvider.notifier).loadNextPage();
      String title = 'En cines';
      return _MovieMasonryWithTitle(
          title: title, movies: movies, loadNextPage: loadNextPage);
    }
    if (widget.category ==
        MoviesCategoriesEnum.upcomingMovies.toString().split('.').last) {
      List<Movie> movies = ref.watch(upcomingMoviesProvider);
      void loadNextPage() =>
          ref.watch(upcomingMoviesProvider.notifier).loadNextPage();
      String title = 'Próximamente';
      return _MovieMasonryWithTitle(
          title: title, movies: movies, loadNextPage: loadNextPage);
    }
    if (widget.category ==
        MoviesCategoriesEnum.topRatedMovies.toString().split('.').last) {
      List<Movie> movies = ref.watch(topRatedMoviesProvider);
      void loadNextPage() =>
          ref.watch(topRatedMoviesProvider.notifier).loadNextPage();
      String title = 'Mejor calificadas';
      return _MovieMasonryWithTitle(
          title: title, movies: movies, loadNextPage: loadNextPage);
    }
    if (widget.category ==
        MoviesCategoriesEnum.popularMovies.toString().split('.').last) {
      List<Movie> movies = ref.watch(popularMoviesProvider);
      void loadNextPage() =>
          ref.watch(popularMoviesProvider.notifier).loadNextPage();
      String title = 'Populares';
      return _MovieMasonryWithTitle(
          title: title, movies: movies, loadNextPage: loadNextPage);
    }
    return const Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text('Algo salio mal :(')],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return obtenerMasonry();
  }
}

class _MovieMasonryWithTitle extends StatelessWidget {
  const _MovieMasonryWithTitle({
    required this.title,
    required this.movies,
    required this.loadNextPage,
  });

  final String title;
  final List<Movie> movies;
  final VoidCallback loadNextPage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          title,
          style: const TextStyle(fontSize: 20),
        ),
      ),
      body: MovieMasonry(
        movies: movies,
        loadNextPage: loadNextPage,
      ),
    );
  }
}
