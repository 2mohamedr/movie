import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/core/failure/failure.dart';
import 'package:movies_app/core/models/movie_model.dart';

import '../core_base.dart';

class HomeRequest {
  static final dio = Dio();

  static Future<Either<Failure, List<MovieModel>>> getMovies() async {
    try {
      final response = await dio.get(
        "${CoreBase.url}/${CoreEndpoint.listMovies}?limit=50",
      );
      if (response.data['status'] == "ok" && response.data['data'] != null) {
        return Right(
          (response.data['data']['movies'] as List)
              .map((e) => MovieModel.fromJson(e))
              .toList(),
        );
      }
      return Left(
        Failure(
          message: response.data['status_message'] ?? "Unknown Error",
          statusCode: response.statusCode?.toString() ?? "400",
        ),
      );
    } on DioException catch (e) {
      return Left(
        Failure(
          message: e.response?.data['status_message'],
          statusCode: e.response?.statusCode.toString() ?? "500",
        ),
      );
    } catch (e) {
      return Left(Failure(statusCode: "500", message: e.toString()));
    }
  }
}
