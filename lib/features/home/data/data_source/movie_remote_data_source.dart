import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../model/movie_model.dart';

abstract class MoviesRemoteDataSource {
  Future<List<MovieModel>> getMovies();

  Future<List<MovieModel>> getSuggestions(int id);

  Future<List<MovieModel>> searchMovies(String query);

  Future<MovieModel> getMovieDetails(int id);

  Future<List<MovieModel>> getMostDownloadedMovies();
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
  Future<List<MovieModel>> getSuggestions(int id) async {
    final response = await dio.get(
      'https://yts.mx/api/v2/movie_suggestions.json?movie_id=10',
      queryParameters: {'movie_id': id},
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

  @override
  Future<MovieModel> getMovieDetails(int id) async {
    final response = await dio.get(
      'https://yts.mx/api/v2/movie_details.json',
      queryParameters: {
        'movie_id': id,
        'with_images': true,
        'with_cast': false,
      },
    );

    final data = response.data['data']['movie'];
    return MovieModel.fromJson(data);
  }

  @override
  Future<List<MovieModel>> getMostDownloadedMovies() async {
    final response = await dio.get(
      'https://yts.mx/api/v2/list_movies.json',
      queryParameters: {
        'sort_by': 'download_count',
      },
    );

    final List data = response.data['data']['movies'];
    return data.map((json) => MovieModel.fromJson(json)).toList();
  }


}
