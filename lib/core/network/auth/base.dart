class Base {
  static const String url = "https://route-movie-apis.vercel.app";
}

class Endpoint {
  static const String login = "auth/login";
  static const String register = "auth/register";
  static const String resetPassword = "auth/reset-password";
  //
  static const String updateProfile = "profile";
  static const String getProfile = "profile";
  static const String deleteProfile = "profile";
  //
  static const String getAllFavorites = "favorites/all";
  static const String addToFavorites = "favorites/add";
  static const String removeFromFavorites = "favorites/remove/movieId";
  static const String isFavorites = "favorites/is-favorite/movieId";
}
