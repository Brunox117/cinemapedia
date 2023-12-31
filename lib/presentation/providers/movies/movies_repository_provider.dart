import 'package:cinemapedia/infrastructure/datasources/movidedb_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/movie_repository_implementation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Este repository es inmutable
final movieRepositoryProvider = Provider((ref){

  return MovieRepositoryImpl(MoviedbDatasource());
});