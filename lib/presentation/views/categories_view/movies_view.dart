import 'package:cinemapedia/presentation/providers/movies/initial_loading_provider.dart';
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
  @override
  void initState() {
    super.initState();
    if(widget.category == MoviesCategoriesEnum.nowPlayingMovies.toString().split('.').last){
        ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
      }
    if(widget.category == MoviesCategoriesEnum.upcomingMovies.toString().split('.').last){ 
      ref.read(upcomingMoviesProvider.notifier).loadNextPage();
      }
    if(widget.category == MoviesCategoriesEnum.topRatedMovies.toString().split('.').last){ 
      ref.read(topRatedMoviesProvider.notifier).loadNextPage();
      }
    if(widget.category == MoviesCategoriesEnum.popularMovies.toString().split('.').last){ 
      ref.read(popularMoviesProvider.notifier).loadNextPage();
      }

  }
  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvier);

    if(initialLoading) return const FullScreenLoader();

    List<Movie> movies = [];
    VoidCallback callback = ref.watch(nowPlayingMoviesProvider.notifier).loadNextPage;
    if(widget.category == MoviesCategoriesEnum.nowPlayingMovies.toString().split('.').last){
      movies = ref.read(nowPlayingMoviesProvider);
      }
    if(widget.category == MoviesCategoriesEnum.upcomingMovies.toString().split('.').last){ 
      movies = ref.read(upcomingMoviesProvider);
      callback = ref.read(upcomingMoviesProvider.notifier).loadNextPage;
      }
    if(widget.category == MoviesCategoriesEnum.topRatedMovies.toString().split('.').last){ 
      movies = ref.read(topRatedMoviesProvider);
      callback = ref.read(topRatedMoviesProvider.notifier).loadNextPage;
      }
    if(widget.category == MoviesCategoriesEnum.popularMovies.toString().split('.').last){ 
      movies = ref.read(popularMoviesProvider);
      callback = ref.read(popularMoviesProvider.notifier).loadNextPage;
      }
    
    
    return MovieMasonry(
      movies: movies, 
      loadNextPage: callback,
      );
  }
}