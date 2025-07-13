import '../../domain/entity/movie_entity.dart';

class MovieModel {
  final int id;
  final String title;
  final String poster;
  final double rating;
  int? runtime;
  int? likeCount;

  String? year;
  List<String>? genres;
  String? description;
  String? backgroundImage;
  List<String>? screenshots;

  MovieModel({
    required this.id,
    required this.title,
    required this.poster,
    required this.rating, this.runtime, this.likeCount,
    this.year,
    this.genres,
    this.description,
    this.backgroundImage,
    this.screenshots,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {

    return MovieModel(
      id: json['id'],
      runtime: json['runtime'],
      likeCount: json['like_count'],
      title: json['title'],
      year: json['year'].toString(),
      rating: (json['rating'] as num).toDouble(),
      genres: List<String>.from(json['genres'] ?? []),
      description: json['description_full']?.toString().trim(),
      poster: json['medium_cover_image'] ?? '',
      backgroundImage: json['background_image'] ?? '',
      screenshots: [ json['medium_screenshot_image1'],
        json['medium_screenshot_image2'],
        json['medium_screenshot_image3'],
      ].whereType<String>().toList(),

    );
  }

  factory MovieModel.fromMinimalJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['title'],
      poster: json['poster'],
      rating: (json['rating'] as num).toDouble(),
      runtime: null,
      likeCount: null,
      year: null,
      genres: [],
      description: null,
      backgroundImage: null,
      screenshots: [],
    );
  }

  MovieEntity toEntity() {
    return MovieEntity(
        id: id,
        title: title,
        year: year,
        rating: rating,
        genres: genres,
        description: description,
        poster: poster,
        backgroundImage: backgroundImage,
        screenshots: screenshots,
        runtime: runtime,
        likeCount: likeCount

    );
  }
}
