import 'package:injectable/injectable.dart';

import '../entity/movie_entity.dart';
import '../repository/movie_repository.dart';

@lazySingleton
class GetMoviesUseCase {
  final MovieRepository repository;

  GetMoviesUseCase(this.repository);

  Future<List<MovieEntity>> call() => repository.getMovies();
}
