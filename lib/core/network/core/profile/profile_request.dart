import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/core/failure/failure.dart';
import 'package:movies_app/core/network/auth/base.dart';
import 'package:movies_app/core/params/update_profile_parameters.dart';

class ProfileRequest {
  static final dio = Dio();

  static Future<Either<Failure, bool>> updateProfileRequest(
    UpdateProfileParameters params,
    String token,
  ) async {
    try {
      await dio.patch(
        "${Base.url}/${Endpoint.updateProfile}",
        data: params.toJson(),
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
      return Right(true);
    } on DioException catch (e) {
      return Left(Failure.fromJson(e.response?.data));
    } catch (e) {
      return Left(Failure(statusCode: "500", message: e.toString()));
    }
  }

  static Future<Either<Failure, bool>> deleteProfileRequest(
    String token,
  ) async {
    try {
      await dio.delete(
        "${Base.url}/${Endpoint.deleteProfile}",
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
      return Right(true);
    } on DioException catch (e) {
      return Left(Failure.fromJson(e.response?.data));
    } catch (e) {
      return Left(Failure(statusCode: "500", message: e.toString()));
    }
  }

  static Future<Either<Failure, bool>> resetProfilePasswordRequest(
    String currentPassword,
    String newPassword,
    String token,
  ) async {
    try {
      await dio.patch(
        "${Base.url}/${Endpoint.resetPassword}",
        data: {"oldPassword": currentPassword, "newPassword": newPassword},
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
      return Right(true);
    } on DioException catch (e) {
      return Left(Failure.fromJson(e.response?.data));
    } catch (e) {
      return Left(Failure(statusCode: "500", message: e.toString()));
    }
  }
}
