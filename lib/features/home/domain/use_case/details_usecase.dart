import 'package:injectable/injectable.dart';

import '../entity/movie_entity.dart';
import '../repository/movie_repository.dart';

@injectable
class DetailsUseCase {
  final MovieRepository _repo;

  DetailsUseCase(this._repo);

  Future<MovieEntity> call(int id) {
    return _repo.getMovieDetails(id);
  }
}
