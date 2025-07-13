import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entity/movie_entity.dart';
import '../../domain/repository/movie_repository.dart';
import '../data_source/movie_remote_data_source.dart';
import '../model/movie_model.dart';

@LazySingleton(as: MovieRepository)
class MovieRepositoryImpl implements MovieRepository {
  final MoviesRemoteDataSource remoteDataSource;
  final SharedPreferences sharedPreferences;


  MovieRepositoryImpl(this.remoteDataSource, this.sharedPreferences);

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

  @override
  Future<List<MovieEntity>> getHistory() async {
    final movieStrings = sharedPreferences.getStringList('movie_history') ?? [];

    return movieStrings.map((e) {
      final json = jsonDecode(e);
      final model = MovieModel.fromMinimalJson(json);
      return model.toEntity();
    }).toList();
  }


  @override
  Future<List<MovieEntity>> getWatchList() async {
    final remote = await remoteDataSource.getMostDownloadedMovies();
    return remote.map((e) => e.toEntity()).toList();
  }

  @override
  Future<void> saveToHistory(MovieEntity movie) async {
    final current = sharedPreferences.getStringList('movie_history') ?? [];
    final entry = jsonEncode({
      'id': movie.id,
      'title': movie.title,
      'poster': movie.poster,
      'rating': movie.rating,
    });

    if (!current.contains(entry)) {
      current.insert(0, entry);
      await sharedPreferences.setStringList(
          'movie_history', current.take(10).toList());
    }
  }
}
