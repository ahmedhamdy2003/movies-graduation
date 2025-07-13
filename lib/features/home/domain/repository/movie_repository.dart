import '../entity/movie_entity.dart';

abstract class MovieRepository {
  Future<List<MovieEntity>> getMovies();

  Future<List<MovieEntity>> getSuggestions(int id);

  Future<List<MovieEntity>> searchMovies(String query);

  Future<MovieEntity> getMovieDetails(int id);

  Future<List<MovieEntity>> getWatchList();

  Future<void> saveToHistory(MovieEntity movie);

  Future<List<MovieEntity>> getHistory();
}
