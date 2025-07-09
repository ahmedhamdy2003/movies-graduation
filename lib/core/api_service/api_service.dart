import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../features/home/data/model/browse_movie_model.dart';

@lazySingleton
class ApiService {
  final Dio dio;

  ApiService(this.dio);

  Future<List<MovieModel>> getMoviesByGenre(String genre) async {
    try {
      final response = await dio.get(
        'https://yts.mx/api/v2/list_movies.json',
        queryParameters: {
          'genre': genre,
        },
      );

      final moviesJson = response.data['data']['movies'] as List;
      return moviesJson
          .map((movieJson) => MovieModel.fromJson(movieJson))
          .toList();
    } catch (e) {
      throw Exception('Failed to load movies: $e');
    }
  }
}
