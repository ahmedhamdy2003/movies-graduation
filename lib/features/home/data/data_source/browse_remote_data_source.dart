// import 'package:dio/dio.dart';
// import '../model/browse_response.dart';
//
// class BrowseRemoteDataSource {
//   final Dio dio;
//
//   BrowseRemoteDataSource(this.dio);
//
//   Future<MovieResponse> fetchMovies() async {
//     final response = await dio.get('https://yts.mx/api/v2/list_movies.json');
//
//     if (response.statusCode == 200) {
//       return MovieResponse.fromJson(response.data);
//     } else {
//       throw Exception('Failed to load movies');
//     }
//   }
// }
// import 'package:dio/dio.dart';
// import '../model/browse_movie_model.dart';
//
// class BrowseRemoteDataSource {
//   final Dio dio;
//
//   BrowseRemoteDataSource(this.dio);
//
//   Future<List<MovieModel>> getMoviesByGenre(String genre) async {
//     final response = await dio.get(
//       'https://yts.mx/api/v2/list_movies.json',
//       queryParameters: {'genre': genre},
//     );
//
//     final movies = response.data['data']['movies'] as List;
//
//     return movies.map((movieJson) => MovieModel.fromJson(movieJson)).toList();
//   }
// }
import 'package:dio/dio.dart';

import '../model/browse_movie_model.dart';

abstract class BrowseRemoteDataSource {
  Future<List<MovieModel>> getMovies();
}

class BrowseRemoteDataSourceImpl implements BrowseRemoteDataSource {
  final Dio dio;

  BrowseRemoteDataSourceImpl(this.dio);

  @override
  Future<List<MovieModel>> getMovies() async {
    final response = await dio.get('https://yts.mx/api/v2/list_movies.json');

    final moviesJson = response.data['data']['movies'] as List;
    return moviesJson.map((movie) => MovieModel.fromJson(movie)).toList();
  }
}
