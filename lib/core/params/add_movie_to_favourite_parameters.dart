class AddMovieToFavouriteParameters {
  final String movieId, name, imageURL, year;
  final double rating;

  AddMovieToFavouriteParameters({
    required this.movieId,
    required this.name,
    required this.rating,
    required this.imageURL,
    required this.year,
  });

  Map<String, dynamic> toJson() {
    return {
      "movieId": movieId,
      "name": name,
      "rating": rating,
      "imageURL": imageURL,
      "year": year,
    };
  }
}
