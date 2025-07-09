// class Movie {
//   final int id;
//   final String title;
//   final String imageUrl;
//   final List<String> genres;
//   final double rating;
//
//   Movie({
//     required this.id,
//     required this.title,
//     required this.imageUrl,
//     required this.genres,
//     required this.rating,
//   });
//
//   factory Movie.fromJson(Map<String, dynamic> json) {
//     return Movie(
//       id: json['id'],
//       title: json['title'],
//       imageUrl: json['medium_cover_image'] ?? '',
//       genres: List<String>.from(json['genres'] ?? []),
//       rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
//     );
//   }
//
//   String? get mediumCoverImage => null;
// }

// class MovieModel {
//   final int id;
//   final String title;
//   final List<String> genres;
//   final String image;
//
//   MovieModel({
//     required this.id,
//     required this.title,
//     required this.genres,
//     required this.image,
//   });
//
//   factory MovieModel.fromJson(Map<String, dynamic> json) {
//     return MovieModel(
//       id: json['id'],
//       title: json['title'],
//       genres: List<String>.from(json['genres']),
//       image: json['medium_cover_image'],
//     );
//   }
// }

class MovieModel {
  final int id;
  final String title;
  final String image;
  final double rating;

  MovieModel({
    required this.id,
    required this.title,
    required this.image,
    required this.rating,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['title'],
      image: json['medium_cover_image'],
      rating: (json['rating'] as num).toDouble(),
    );
  }
}
