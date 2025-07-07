import '../entity/movie_entity.dart';

abstract class MovieRepository {
  Future<List<MovieEntity>> getMovies();

  Future<List<MovieEntity>> getSuggestions();
}
