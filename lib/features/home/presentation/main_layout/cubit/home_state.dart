import 'package:my_movie_app/features/home/domain/entity/movie_entity.dart';

import '../../../../../core/common/error_handling.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<MovieEntity> movies;
  final List<MovieEntity> suggestions;

  HomeSuccess({required this.movies, required this.suggestions});
}

class HomeFailure extends HomeState {
  final Failure failure;

  HomeFailure(this.failure);
}
