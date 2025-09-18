import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/models/movie_details_model.dart';
import 'package:movies_app/core/models/user_model.dart';
import 'package:movies_app/core/network/core/movie_details/movie_details_request.dart';
import 'package:movies_app/core/params/add_movie_to_favourite_parameters.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  FavouriteBloc() : super(FavouriteInitial()) {
    on<FavouriteEvent>((event, emit) {});
    on<FavouriteInit>(_fetchFavouriteStatus);
    on<FavouriteToggle>(_toggleFavouriteStatus);
  }

  FutureOr<void> _fetchFavouriteStatus(
    FavouriteInit event,
    Emitter<FavouriteState> emit,
  ) async {
    emit(FavouriteLoading());
    final prefs = await SharedPreferences.getInstance();
    final userShared = prefs.getString("user_detail");
    if (userShared != null) {
      UserModel user = UserModel.fromJson(jsonDecode(userShared));
      final res = await MovieDetailsRequest.isFavourite(
        event.movieModel.id,
        user.token!,
      );
      res.fold(
        (l) => emit(FavouriteError(l.message)),
        (r) => emit(FavouriteSuccess(r)),
      );
    }
  }

  FutureOr<void> _toggleFavouriteStatus(
    FavouriteToggle event,
    Emitter<FavouriteState> emit,
  ) async {
    emit(FavouriteLoading());
    final prefs = await SharedPreferences.getInstance();
    final userShared = prefs.getString("user_detail");
    if (userShared != null) {
      UserModel user = UserModel.fromJson(jsonDecode(userShared));
      if (event.isFavourite) {
        final res = await MovieDetailsRequest.unMarkFavourite(
          event.movieModel.id.toString(),
          user.token!,
        );
        res.fold(
          (l) => emit(FavouriteError(l.message)),
          (r) => emit(FavouriteSuccess(false)),
        );
      } else {
        final res = await MovieDetailsRequest.markAsFavourite(
          AddMovieToFavouriteParameters(
            movieId: event.movieModel.id.toString(),
            name: event.movieModel.title,
            rating: double.parse(event.movieModel.rating),
            imageURL: event.movieModel.cover,
            year: event.movieModel.year,
          ),
          user.token!,
        );
        res.fold(
          (l) => emit(FavouriteError(l.message)),
          (r) => emit(FavouriteSuccess(true)),
        );
      }
    }
  }
}
