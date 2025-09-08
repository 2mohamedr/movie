import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/core/failure/failure.dart';
import 'package:movies_app/core/models/user_model.dart';
import 'package:movies_app/core/network/auth/base.dart';
import 'package:movies_app/core/params/register_parameters.dart';

class Request {
  static final dio = Dio();

  static Future<Either<Failure, String>> checkLoginInfo(
    String email,
    String password,
  ) async {
    try {
      final response = await dio.post(
        "${Base.url}/${Endpoint.login}",
        data: {"email": email, "password": password},
      );
      return Right(response.data['data'] as String);
    } on DioException catch (e) {
      return Left(Failure.fromJson(e.response?.data));
    } catch (e) {
      return Left(Failure(statusCode: "500", message: e.toString()));
    }
  }

  static Future<Either<Failure, UserModel>> getProfile(String token) async {
    try {
      final response = await dio.get(
        "${Base.url}/${Endpoint.getProfile}",
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      UserModel user = UserModel.fromJson(response.data);
      user.token = token;
      return Right(user);
    } on DioException catch (e) {
      return Left(Failure.fromJson(e.response?.data));
    } catch (e) {
      return Left(Failure(message: e.toString(), statusCode: "500"));
    }
  }
  //

  static Future<Either<Failure, bool>> register(
    RegisterParameters params,
  ) async {
    try {
      await dio.post("${Base.url}/${Endpoint.register}", data: params.toJson());
      return Right(true);
    } on DioException catch (e) {
      return Left(Failure.fromJson(e.response?.data));
    } catch (e) {
      return Left(Failure(statusCode: "500", message: "Unhandled Error: $e"));
    }
  }
}
