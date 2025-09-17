import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app/core/constants/app_icons.dart';
import 'package:movies_app/core/theme_manager/color_palette.dart';
import 'package:movies_app/features/movie_details/widgets/cast_box_widget.dart';
import 'package:toastification/toastification.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../core/constants/app_images.dart';
import '../../../core/widgets/movie_box_widget.dart';
import '../bloc/movie/movie_details_bloc.dart';

class MovieDetailsScreen extends StatelessWidget {
  final int id;

  const MovieDetailsScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: ColorsPallete.Dark,
      body: BlocConsumer<MovieDetailsBloc, MovieDetailsState>(
        listener: (context, state) {
          if (state is ErrorFetch) {
            toastification.show(
              type: ToastificationType.error,
              title: Text(state.message),
              icon: Icon(Icons.error_outlined),
              autoCloseDuration: Duration(seconds: 5),
            );
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          if (state is Loading) {
            return Center(
              child: Lottie.asset(
                AppImages.loadingJson,
                backgroundLoading: false,
                width: 120.w,
              ),
            );
          }
          if (state is SuccessFetch) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 645.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(state.movieDetailsModel.cover),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromRGBO(18, 19, 18, 0.2),
                            Color.fromRGBO(18, 19, 18, 1),
                          ],
                        ),
                      ),
                      child: SafeArea(
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    padding: EdgeInsets.zero,
                                    constraints: BoxConstraints(),
                                    style: IconButton.styleFrom(
                                      tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(
                                      Icons.keyboard_arrow_left_outlined,
                                      size: 29,
                                      color: ColorsPallete.white,
                                    ),
                                  ),
                                  Icon(
                                    Icons.bookmark_border_outlined,
                                    size: 29,
                                    color: ColorsPallete.white,
                                  ),
                                ],
                              ),
                              Pulse(
                                child: InkWell(
                                  onTap: () {
                                    YoutubePlayerController controller =
                                        YoutubePlayerController(
                                          initialVideoId: state
                                              .movieDetailsModel
                                              .ytTrailerCode,
                                          flags: YoutubePlayerFlags(
                                            useHybridComposition: true,
                                            autoPlay: true,
                                            mute: false,
                                          ),
                                        );
                                    showModalBottomSheet(
                                      context: context,
                                      backgroundColor: Colors.transparent,
                                      isScrollControlled: true,
                                      builder: (context) {
                                        return YoutubePlayer(
                                          controller: controller,
                                          showVideoProgressIndicator: true,
                                          progressIndicatorColor: Colors.amber,
                                          progressColors:
                                              const ProgressBarColors(
                                                playedColor: Colors.amber,
                                                handleColor: Colors.amberAccent,
                                              ),
                                        );
                                      },
                                    );
                                  },
                                  child: Image.asset(
                                    AppIcons.playIcon,
                                    width: 97.w,
                                    height: 97.h,
                                  ),
                                ),
                              ),
                              BounceInUp(
                                child: Column(
                                  children: [
                                    Text(
                                      state.movieDetailsModel.title,
                                      textAlign: TextAlign.center,
                                      style: theme.textTheme.headlineSmall,
                                    ),
                                    Text(
                                      state.movieDetailsModel.year,
                                      style: theme.textTheme.bodyMedium
                                          ?.copyWith(
                                            color: ColorsPallete.hintColor,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      spacing: 16.h,
                      children: [
                        FadeInRight(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: ContinuousRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              backgroundColor: ColorsPallete.danger,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                'Watch',
                                style: theme.textTheme.bodyMedium,
                              ),
                            ),
                          ),
                        ),
                        FadeInLeft(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            spacing: 16.w,
                            children: [
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 11),
                                  decoration: BoxDecoration(
                                    color: ColorsPallete.darkTwo,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    spacing: 11.w,
                                    children: [
                                      Image.asset(
                                        AppIcons.favIcon,
                                        width: 28.w,
                                        height: 25.h,
                                      ),
                                      Text(state.movieDetailsModel.likeCount),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 11),
                                  decoration: BoxDecoration(
                                    color: ColorsPallete.darkTwo,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    spacing: 11.w,
                                    children: [
                                      Image.asset(
                                        AppIcons.runtimeIcon,
                                        width: 28.w,
                                        height: 25.h,
                                      ),
                                      Text(state.movieDetailsModel.runtime),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 11),
                                  decoration: BoxDecoration(
                                    color: ColorsPallete.darkTwo,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    spacing: 11.w,
                                    children: [
                                      Image.asset(
                                        AppIcons.ratingIcon,
                                        width: 28.w,
                                        height: 25.h,
                                      ),
                                      Text(state.movieDetailsModel.rating),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          'Screen Shots',
                          style: theme.textTheme.headlineSmall,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            state.movieDetailsModel.screenShotImageOne,
                            fit: BoxFit.cover,
                            height: 167.h,
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            state.movieDetailsModel.screenShotImageTwo,
                            fit: BoxFit.cover,
                            height: 167.h,
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            state.movieDetailsModel.screenShotImageThree,
                            fit: BoxFit.cover,
                            height: 167.h,
                          ),
                        ),
                        Text('Similar', style: theme.textTheme.headlineSmall),
                        GridView.builder(
                          padding: EdgeInsets.zero,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 16.h,
                                crossAxisSpacing: 20.w,
                                childAspectRatio: 189.w / 299.h,
                              ),
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: state.movieSimilar.length,
                          itemBuilder: (context, index) {
                            return MovieBoxWidget(
                              posterImg: state.movieSimilar[index].poster,
                              rating: state.movieSimilar[index].rating,
                              id: state.movieSimilar[index].id,
                            );
                          },
                        ),
                        Text('Summary', style: theme.textTheme.headlineSmall),
                        Text(
                          state.movieDetailsModel.description,
                          style: theme.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text('Cast', style: theme.textTheme.headlineSmall),
                        ListView.separated(
                          itemCount: state.movieDetailsModel.casts.length,
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            var cast = state.movieDetailsModel.casts[index];
                            return CastBoxWidget(
                              name: cast.name,
                              character: cast.characterName,
                              avatar: cast.image,
                            );
                          },
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 11.h),
                        ),

                        Text('Genres', style: theme.textTheme.headlineSmall),
                        GridView.builder(
                          shrinkWrap: true,
                          itemCount: state.movieDetailsModel.genres.length,
                          padding: EdgeInsets.only(bottom: 13.h),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                childAspectRatio: 122.w / 36.h,
                                crossAxisSpacing: 16.w,
                                mainAxisSpacing: 11.h,
                              ),
                          itemBuilder: (context, index) {
                            var genre = state.movieDetailsModel.genres[index];
                            return Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: ColorsPallete.darkTwo,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                genre,
                                style: theme.textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return SizedBox.shrink();
          }
        },
      ),
    );
  }
}
