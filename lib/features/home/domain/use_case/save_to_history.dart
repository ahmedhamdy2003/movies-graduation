import 'package:injectable/injectable.dart';

import '../entity/movie_entity.dart';
import '../repository/movie_repository.dart';

@lazySingleton
class SaveToHistory {
  final MovieRepository repository;

  SaveToHistory(this.repository);

  Future<void> call(MovieEntity movie) async {
    await repository.saveToHistory(movie);
  }
}
