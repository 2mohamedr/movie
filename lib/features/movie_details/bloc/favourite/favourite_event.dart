part of 'favourite_bloc.dart';

sealed class FavouriteEvent extends Equatable {
  const FavouriteEvent();
}

final class FavouriteInit extends FavouriteEvent {
  final MovieDetailsModel movieModel;

  const FavouriteInit(this.movieModel);

  @override
  List<Object?> get props => [movieModel];
}

final class FavouriteToggle extends FavouriteEvent {
  final MovieDetailsModel movieModel;
  final bool isFavourite;

  const FavouriteToggle(this.movieModel, this.isFavourite);

  @override
  List<Object?> get props => [movieModel, isFavourite];
}
