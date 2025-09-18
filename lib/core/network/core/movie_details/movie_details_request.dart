import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/core/failure/failure.dart';
import 'package:movies_app/core/models/movie_details_model.dart';
import 'package:movies_app/core/models/movie_model.dart';
import 'package:movies_app/core/network/auth/base.dart';
import 'package:movies_app/core/network/core/core_base.dart';
import 'package:movies_app/core/params/add_movie_to_favourite_parameters.dart';

class MovieDetailsRequest {
  static final dio = Dio();

  static Future<Either<Failure, MovieDetailsModel>> getMovieDetails(
    int id,
  ) async {
    try {
      final res = await dio.get(
        "${CoreBase.url}/${CoreEndpoint.movieDetails}",
        queryParameters: {
          "movie_id": id.toString(),
          "with_images": "true",
          "with_cast": "true",
        },
      );
      if (res.data['data']['movie']['id'] == 0) {
        return Left(
          Failure(
            message: "Movie doesn't exists",
            statusCode: "INVALID_RESPONSE_ID",
          ),
        );
      }
      return Right(MovieDetailsModel.fromJson(res.data['data']['movie']));
    } on DioException catch (e) {
      return Left(
        Failure(
          statusCode: e.response!.statusCode.toString(),
          message: e.message ?? "Unexpected Error",
        ),
      );
    } catch (e) {
      return Left(Failure(statusCode: "500", message: e.toString()));
    }
  }

  static Future<Either<Failure, List<MovieModel>>> getMovieSimilar(
    int id,
  ) async {
    try {
      final res = await dio.get(
        "${CoreBase.url}/${CoreEndpoint.movieSuggestions}",
        queryParameters: {"movie_id": id},
      );
      if (res.data['data']['movies'][0]['id'] == 0) {
        return Left(
          Failure(
            message: "Movie doesn't exists",
            statusCode: "INVALID_RESPONSE_ID",
          ),
        );
      }
      return Right(
        (res.data['data']['movies'] as List).map((e) {
          return MovieModel.fromJson(e);
        }).toList(),
      );
    } on DioException catch (e) {
      return Left(
        Failure(
          statusCode: e.response!.statusCode.toString(),
          message: e.message ?? "Unexpected Error",
        ),
      );
    } catch (e) {
      return Left(Failure(statusCode: "500", message: e.toString()));
    }
  }

  static Future<Either<Failure, bool>> isFavourite(
    int movieId,
    String token,
  ) async {
    try {
      final res = await dio.get(
        "${Base.url}/${Endpoint.isFavorites}/$movieId",
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
      return Right(res.data['data']);
    } on DioException catch (e) {
      return Left(
        Failure(
          statusCode:
              e.response?.statusCode.toString() ?? 'INVALID_STATUS_CODE',
          message: e.message ?? "Unexpected Error",
        ),
      );
    } catch (e) {
      return Left(
        Failure(statusCode: "INVALID_REQUEST", message: e.toString()),
      );
    }
  }

  static Future<Either<Failure, bool>> markAsFavourite(
    AddMovieToFavouriteParameters params,
    String token,
  ) async {
    try {
      await dio.post(
        "${Base.url}/${Endpoint.addToFavorites}",
        data: params.toJson(),
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
      return Right(true);
    } on DioException catch (e) {
      return Left(
        Failure(
          statusCode:
              e.response?.statusCode.toString() ?? 'INVALID_STATUS_CODE',
          message: e.message ?? "Unexpected Error",
        ),
      );
    } catch (e) {
      return Left(
        Failure(statusCode: "INVALID_REQUEST", message: e.toString()),
      );
    }
  }

  static Future<Either<Failure, bool>> unMarkFavourite(
    String movieId,
    String token,
  ) async {
    try {
      await dio.delete(
        "${Base.url}/${Endpoint.removeFromFavorites}/$movieId",
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
      return Right(true);
    } on DioException catch (e) {
      return Left(
        Failure(
          statusCode:
              e.response?.statusCode.toString() ?? 'INVALID_STATUS_CODE',
          message: e.message ?? "Unexpected Error",
        ),
      );
    } catch (e) {
      return Left(
        Failure(statusCode: "INVALID_REQUEST", message: e.toString()),
      );
    }
  }
}
