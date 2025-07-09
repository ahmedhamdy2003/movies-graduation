// import '../../../../data/model/browse_movie_model.dart';
//
// abstract class BrowseState {}
//
// class BrowseInitial extends BrowseState {}
//
// class BrowseLoading extends BrowseState {}
//
// class BrowseLoaded extends BrowseState {
//   final List<Movie> movies;
//   final Set<String> genres;
//
//   BrowseLoaded(this.movies)
//       : genres = movies.expand((movie) => movie.genres).toSet();
// }
//
// class BrowseError extends BrowseState {
//   final String message;
//   BrowseError(this.message);
// }
// //

part of 'browse_cubit.dart';

abstract class BrowseState {}

class BrowseInitial extends BrowseState {}

class BrowseLoading extends BrowseState {}

class BrowseLoaded extends BrowseState {
  final List<MovieModel> movies;
  BrowseLoaded(this.movies);
}

class BrowseError extends BrowseState {
  final String message;
  BrowseError(this.message);
}
