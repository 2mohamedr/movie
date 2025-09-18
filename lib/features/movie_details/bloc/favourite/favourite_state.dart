part of 'favourite_bloc.dart';

sealed class FavouriteState extends Equatable {
  const FavouriteState();
}

final class FavouriteInitial extends FavouriteState {
  @override
  List<Object> get props => [];
}

final class FavouriteLoading extends FavouriteState {
  @override
  List<Object?> get props => [];
}

final class FavouriteSuccess extends FavouriteState {
  final bool isFavourite;

  const FavouriteSuccess(this.isFavourite);

  @override
  List<Object?> get props => [isFavourite];
}

final class FavouriteError extends FavouriteState {
  final String message;

  const FavouriteError(this.message);

  @override
  List<Object?> get props => [message];
}
