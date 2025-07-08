import '../../../../domain/entity/movie_entity.dart';

abstract class MovieDetailsState {}

class MovieDetailsInitial extends MovieDetailsState {}

class MovieDetailsLoading extends MovieDetailsState {}

class MovieDetailsSuccess extends MovieDetailsState {
  final MovieEntity movie;
  final List<MovieEntity> similarMovies;

  MovieDetailsSuccess({required this.movie, required this.similarMovies});
}

class MovieDetailsError extends MovieDetailsState {
  final String message;

  MovieDetailsError(this.message);
}
