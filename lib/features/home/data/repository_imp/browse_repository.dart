// import '../data_source/browse_remote_data_source.dart';
// import '../model/browse_movie_model.dart';
//
// class BrowseRepository {
//   final BrowseRemoteDataSource remoteDataSource;
//
//   BrowseRepository(this.remoteDataSource);
//
//   Future<List<Movie>> getMovies() async {
//     final response = await remoteDataSource.fetchMovies();
//     return response.movies;
//   }
// }
import '../model/browse_movie_model.dart';

abstract class BrowseRepository {
  Future<List<MovieModel>> getMoviesByGenre(String genre);
}
