import '../../domain/entity/movie_entity.dart';

class MovieModel {
  final int id;
  final String title;
  final String poster;
  final double rating;

  MovieModel({
    required this.id,
    required this.title,
    required this.poster,
    required this.rating,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['title'],
      poster: json['medium_cover_image'],
      rating: (json['rating'] as num).toDouble(),
    );
  }

  MovieEntity toEntity() {
    return MovieEntity(id: id, title: title, poster: poster, rating: rating);
  }
}
