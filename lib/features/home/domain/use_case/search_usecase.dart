import 'package:injectable/injectable.dart';

import '../entity/movie_entity.dart';
import '../repository/movie_repository.dart';

@injectable
class SearchUseCase {
  final MovieRepository _repo;

  SearchUseCase(this._repo);

  Future<List<MovieEntity>> call(String title) {
    return _repo.searchMovies(title);
  }
}
