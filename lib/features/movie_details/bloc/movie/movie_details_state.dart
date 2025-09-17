part of 'movie_details_bloc.dart';

sealed class MovieDetailsState extends Equatable {
  const MovieDetailsState();
}

final class MovieDetailsInitial extends MovieDetailsState {
  @override
  List<Object> get props => [];
}

final class Loading extends MovieDetailsState {
  @override
  List<Object?> get props => [];
}

final class SuccessFetch extends MovieDetailsState {
  final MovieDetailsModel movieDetailsModel;
  final List<MovieModel> movieSimilar;

  const SuccessFetch(this.movieDetailsModel, this.movieSimilar);

  @override
  List<Object?> get props => [movieDetailsModel, movieSimilar];
}

final class ErrorFetch extends MovieDetailsState {
  final String message;

  const ErrorFetch(this.message);

  @override
  List<Object?> get props => [message];
}
