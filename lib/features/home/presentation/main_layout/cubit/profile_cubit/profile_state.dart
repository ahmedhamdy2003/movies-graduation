import '../../../../domain/entity/movie_entity.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final List<MovieEntity> watchList;
  final List<MovieEntity> history;
  final String name;
  final String avatar;

  ProfileLoaded({
    required this.watchList,
    required this.history,
    required this.name,
    required this.avatar,
  });
}

class ProfileLoading extends ProfileState {}

class ProfileError extends ProfileState {
  final String message;

  ProfileError({required this.message});
}
