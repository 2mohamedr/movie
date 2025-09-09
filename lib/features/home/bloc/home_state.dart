part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();
}

final class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

final class HomeFetchDataState extends HomeState {
  final List<MovieModel> slider;
  final Map<String, List<MovieModel>> genreMovie;

  const HomeFetchDataState({required this.slider, required this.genreMovie});

  @override
  List<Object?> get props => [slider, genreMovie];
}

final class HomeLoading extends HomeState {
  @override
  List<Object?> get props => [];
}

final class HomeError extends HomeState {
  final String message;

  const HomeError({required this.message});

  @override
  List<Object?> get props => [message];
}
