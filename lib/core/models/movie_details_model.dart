class MovieDetailsModel {
  final int id;
  final String url;
  final String title;
  final String year;
  final String rating;
  final String runtime;
  final List<String> genres;
  final String likeCount;
  final String description;
  final String ytTrailerCode;
  final String cover;
  final String screenShotImageOne;
  final String screenShotImageTwo;
  final String screenShotImageThree;
  final List<CastModel> casts;

  MovieDetailsModel({
    required this.id,
    required this.url,
    required this.title,
    required this.year,
    required this.rating,
    required this.runtime,
    required this.genres,
    required this.likeCount,
    required this.description,
    required this.ytTrailerCode,
    required this.cover,
    required this.screenShotImageOne,
    required this.screenShotImageTwo,
    required this.screenShotImageThree,
    required this.casts,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> map) {
    return MovieDetailsModel(
      id: map['id'],
      url: map['url'],
      title: map['title'],
      year: map['year'].toString(),
      rating: map['rating'].toString(),
      runtime: map['runtime'].toString(),
      genres: List<String>.from(map['genres'] ?? []),
      likeCount: map['like_count'].toString(),
      description: map['description_intro'],
      ytTrailerCode: map['yt_trailer_code'],
      cover: map['large_cover_image'],
      screenShotImageOne: map['large_screenshot_image1'],
      screenShotImageTwo: map['large_screenshot_image2'],
      screenShotImageThree: map['large_screenshot_image3'],
      casts: (map['cast'] as List).map((e) {
        return CastModel.fromJson(e);
      }).toList(),
    );
  }
}

class CastModel {
  final String name;
  final String characterName;
  final String image;

  CastModel({
    required this.name,
    required this.characterName,
    required this.image,
  });

  factory CastModel.fromJson(Map<String, dynamic> map) {
    return CastModel(
      name: map['name'],
      characterName: map['character_name'],
      image: map['url_small_image'] ?? '',
    );
  }
}
