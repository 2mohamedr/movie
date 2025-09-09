import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/models/movie_model.dart';
import 'package:movies_app/core/network/core/home/home_request.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});
    on<HomeFetchData>(_fetchDataForHome);
  }

  FutureOr<void> _fetchDataForHome(
    HomeFetchData event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());
    final result = await HomeRequest.getMovies();
    result.fold((l) => emit(HomeError(message: l.message)), (r) {
      final slider = r.take(10).toList();
      final groupedMovies = groupBy<MovieModel, String>(
        r,
        (c) => c.genres.isNotEmpty ? c.genres.first : "Other",
      );
      emit(HomeFetchDataState(slider: slider, genreMovie: groupedMovies));
    });
  }
}
