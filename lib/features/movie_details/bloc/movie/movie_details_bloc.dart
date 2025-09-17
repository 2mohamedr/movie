import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/models/movie_details_model.dart';
import 'package:movies_app/core/models/movie_model.dart';
import 'package:movies_app/core/network/core/movie_details/movie_details_request.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc() : super(MovieDetailsInitial()) {
    on<MovieDetailsEvent>((event, emit) {});
    on<MovieDetailsInit>(_getMovieDetails);
  }

  FutureOr<void> _getMovieDetails(
    MovieDetailsInit event,
    Emitter<MovieDetailsState> emit,
  ) async {
    emit(Loading());
    final res = await MovieDetailsRequest.getMovieDetails(event.movieId);
    await res.fold(
      (l) async {
        emit(ErrorFetch("${l.message} ${event.movieId}"));
      },
      (movieDetails) async {
        final similar = await MovieDetailsRequest.getMovieSimilar(
          event.movieId,
        );
        similar.fold(
          (l) async {
            emit(ErrorFetch(l.message));
          },
          (movieSimilar) {
            emit(SuccessFetch(movieDetails, movieSimilar));
          },
        );
      },
    );
  }
}
