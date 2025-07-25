import 'package:injectable/injectable.dart';

import '../../domain/entity/movie_entity.dart';
import '../../domain/repository/movie_repository.dart';
import '../data_source/movie_remote_data_source.dart';

@LazySingleton(as: MovieRepository)
class MovieRepositoryImpl implements MovieRepository {
  final MoviesRemoteDataSource remoteDataSource;

  MovieRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<MovieEntity>> getMovies() async {
    final movieModels = await remoteDataSource.getMovies();
    return movieModels.map((e) => e.toEntity()).toList();
  }

  @override
  Future<List<MovieEntity>> getSuggestions(int id) async {
    final movieModels = await remoteDataSource.getSuggestions(id);
    return movieModels.map((e) => e.toEntity()).toList();
  }

  @override
  Future<List<MovieEntity>> searchMovies(String query) async {
    final movieModels = await remoteDataSource.searchMovies(query);
    return movieModels.map((e) => e.toEntity()).toList();
  }

  @override
  Future<MovieEntity> getMovieDetails(int id) async {
    final movieModel = await remoteDataSource.getMovieDetails(id);
    return movieModel.toEntity();
  }
}
