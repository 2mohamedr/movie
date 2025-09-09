import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app/core/theme_manager/color_palette.dart';
import 'package:movies_app/features/home/widgets/home_movie_category_widget.dart';
import 'package:movies_app/features/home/widgets/slider_widget.dart';

import '../../core/constants/app_images.dart';
import 'bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(HomeFetchData()),
      child: Scaffold(
        backgroundColor: ColorsPallete.Dark,
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeFetchDataState) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SliderWidget(movies: state.slider),
                    ...state.genreMovie.entries.map(
                      (e) => HomeMovieCategoryWidget(
                        genre: e.key,
                        movies: e.value,
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is HomeLoading) {
              return Center(
                child: Lottie.asset(
                  AppImages.loadingJson,
                  backgroundLoading: false,
                  width: 120,
                ),
              );
            } else if (state is HomeError) {
              return Center(child: Text(state.message));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
