import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../model/movie_model.dart';

abstract class MoviesRemoteDataSource {
  Future<List<MovieModel>> getMovies();

  Future<List<MovieModel>> getSuggestions();

  Future<List<MovieModel>> searchMovies(String query);
}

@LazySingleton(as: MoviesRemoteDataSource)
class MoviesRemoteDataSourceImpl implements MoviesRemoteDataSource {
  final Dio dio;

  MoviesRemoteDataSourceImpl(this.dio);

  @override
  Future<List<MovieModel>> getMovies() async {
    final response = await dio.get('https://yts.mx/api/v2/list_movies.json');
    final List data = response.data['data']['movies'];
    return data.map((json) => MovieModel.fromJson(json)).toList();
  }

  @override
  Future<List<MovieModel>> getSuggestions() async {
    final response = await dio.get(
      'https://yts.mx/api/v2/movie_suggestions.json?movie_id=10',
    );
    final List data = response.data['data']['movies'];
    return data.map((json) => MovieModel.fromJson(json)).toList();
  }

  @override
  Future<List<MovieModel>> searchMovies(String query) async {
    final response = await dio.get(
      'https://yts.mx/api/v2/list_movies.json',
      queryParameters: {'query_term': query},
    );

    final List movies = response.data['data']['movies'] ?? [];
    return movies.map((json) => MovieModel.fromJson(json)).toList();
  }
}
