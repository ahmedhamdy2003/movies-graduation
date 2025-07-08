class MovieEntity {
  final int id;
  final String title;
  final String? year;
  final double rating;
  final List<String>? genres;
  final String? description;
  final String poster;
  final String? backgroundImage;
  final List<String>? screenshots;
  final int? runtime;
  final int? likeCount;
  MovieEntity({
    required this.id,
    required this.title,
    this.year,
    required this.rating,
    this.genres,
    this.description,
    required this.poster,
    this.backgroundImage,
    this.screenshots,
    this.runtime,
    this.likeCount,
  });
}
