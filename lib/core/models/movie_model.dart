class MovieModel {
  final int id;
  final String title;
  final String rating;
  final String poster;
  final List<String> genres;

  MovieModel({
    required this.id,
    required this.title,
    required this.rating,
    required this.poster,
    required this.genres,
  });

  factory MovieModel.fromJson(Map<String, dynamic> map) {
    return MovieModel(
      id: map['id'],
      title: map['title'],
      rating: map['rating'].toString(),
      poster:
          map['large_cover_image'] ??
          map['medium_cover_image'] ??
          map['small_cover_image'],
      genres: List<String>.from(map['genres'] ?? []),
    );
  }
}
