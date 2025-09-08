import 'package:flutter/material.dart';
import 'package:movies_app/core/theme_manager/color_palette.dart';
import 'package:movies_app/core/widgets/movie_box_widget.dart';

class HomeMovieCategoryWidget extends StatefulWidget {
  const HomeMovieCategoryWidget({super.key});

  @override
  State<HomeMovieCategoryWidget> createState() =>
      _HomeMovieCategoryWidgetState();
}

class _HomeMovieCategoryWidgetState extends State<HomeMovieCategoryWidget> {
  List<Map<String, dynamic>> tempMovies = [
    {
      "title": "Vice Is Broke",
      "img":
          "https://yts.mx/assets/images/movies/vice_is_broke_2024/large-cover.jpg",
    },
    {
      "title": "Ooh the Banter",
      "img":
          "https://yts.mx/assets/images/movies/the_dresser_1983/large-cover.jpg",
    },
    {
      "title": "Simon",
      "img": "https://yts.mx/assets/images/movies/simon_2023/large-cover.jpg",
    },
    {
      "title": "Killer Witches from Outer Space",
      "img":
          "https://yts.mx/assets/images/movies/killer_witches_from_outer_space_2024/large-cover.jpg",
    },
    {
      "title": "Dakar: Race Against the Desert",
      "img":
          "https://yts.mx/assets/images/movies/dakar_race_against_the_desert_2025/large-cover.jpg",
    },
    {
      "title": "Cougars Inc.",
      "img":
          "https://yts.mx/assets/images/movies/cougars_inc_2011/large-cover.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        spacing: 12,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Action",
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
                  spacing: 2,
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
            height: 220,
            child: ListView.builder(
              itemCount: tempMovies.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return MovieBoxWidget(
                  posterImg: tempMovies[index]['img'],
                  rating: "7.7",
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
