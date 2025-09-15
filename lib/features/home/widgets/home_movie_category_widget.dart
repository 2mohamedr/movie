import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/models/movie_model.dart';
import 'package:movies_app/core/theme_manager/color_palette.dart';
import 'package:movies_app/core/widgets/movie_box_widget.dart';

class HomeMovieCategoryWidget extends StatefulWidget {
  final String genre;
  final List<MovieModel> movies;

  const HomeMovieCategoryWidget({
    super.key,
    required this.genre,
    required this.movies,
  });

  @override
  State<HomeMovieCategoryWidget> createState() =>
      _HomeMovieCategoryWidgetState();
}

class _HomeMovieCategoryWidgetState extends State<HomeMovieCategoryWidget> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(16.0).w,
      child: Column(
        spacing: 12.h,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.genre,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: ColorsPallete.PrimaryColor,
                ),
                child: Row(
                  spacing: 2.w,
                  children: [
                    Text(
                      "See More",
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: ColorsPallete.PrimaryColor,
                      ),
                    ),
                    Icon(Icons.arrow_forward),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 220.h,
            child: ListView.separated(
              itemCount: widget.movies.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return MovieBoxWidget(
                  posterImg: widget.movies[index].poster,
                  rating: widget.movies[index].rating,
                );
              },
              separatorBuilder: (context, index) => SizedBox(width: 20.w),
            ),
          ),
        ],
      ),
    );
  }
}
