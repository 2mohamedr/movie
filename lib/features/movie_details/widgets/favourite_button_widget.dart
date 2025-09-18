import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app/core/models/movie_details_model.dart';
import 'package:movies_app/features/movie_details/bloc/favourite/favourite_bloc.dart';
import 'package:toastification/toastification.dart';

import '../../../core/constants/app_images.dart';
import '../../../core/theme_manager/color_palette.dart';

class FavouriteButtonWidget extends StatelessWidget {
  final MovieDetailsModel movieModel;

  const FavouriteButtonWidget({super.key, required this.movieModel});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavouriteBloc()..add(FavouriteInit(movieModel)),
      child: BlocConsumer<FavouriteBloc, FavouriteState>(
        listener: (context, state) {
          if (state is FavouriteError) {
            toastification.show(
              type: ToastificationType.error,
              title: Text(state.message),
              icon: Icon(Icons.error_outlined),
              autoCloseDuration: Duration(seconds: 5),
            );
          }
        },
        builder: (context, state) {
          if (state is FavouriteLoading) {
            return Lottie.asset(
              AppImages.loadingJson,
              backgroundLoading: false,
              width: 29,
            );
          }
          if (state is FavouriteSuccess) {
            bool isFavourite = state.isFavourite;
            return IconButton(
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
              style: IconButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: () {
                context.read<FavouriteBloc>().add(
                  FavouriteToggle(movieModel, isFavourite),
                );
              },
              icon: Icon(
                state.isFavourite
                    ? Icons.bookmark_added
                    : Icons.bookmark_border_outlined,
                size: 29,
                color: ColorsPallete.white,
              ),
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
