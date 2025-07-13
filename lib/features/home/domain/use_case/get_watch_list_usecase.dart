import 'package:injectable/injectable.dart';

import '../entity/movie_entity.dart';
import '../repository/movie_repository.dart';

@lazySingleton
class GetWatchList {
  final MovieRepository repository;

  GetWatchList(this.repository);

  Future<List<MovieEntity>> call() async {
    return await repository.getWatchList();
  }
}
