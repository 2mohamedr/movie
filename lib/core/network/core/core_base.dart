abstract class CoreBase {
  static const String url = "https://yts.mx/api/v2";
}

abstract class CoreEndpoint {
  static const String listMovies = "list_movies.json";
  static const String movieDetails = "movie_details.json";
  static const String movieSuggestions = "movie_suggestions.json";
}
