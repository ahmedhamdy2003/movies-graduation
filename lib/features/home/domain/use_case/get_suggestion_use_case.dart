import 'package:injectable/injectable.dart';

import '../entity/movie_entity.dart';
import '../repository/movie_repository.dart';

@lazySingleton
class GetSuggestionsUseCase {
  final MovieRepository _repository;

  GetSuggestionsUseCase(this._repository);

  Future<List<MovieEntity>> call() async {
    return await _repository.getSuggestions();
  }
}
