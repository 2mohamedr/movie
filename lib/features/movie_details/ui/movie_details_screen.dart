import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/constants/app_icons.dart';
import 'package:movies_app/core/theme_manager/color_palette.dart';
import 'package:movies_app/features/movie_details/widgets/cast_box_widget.dart';

import '../../../core/widgets/movie_box_widget.dart';

class MovieDetailsScreen extends StatelessWidget {
  final String poster;

  const MovieDetailsScreen({super.key, required this.poster});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> tempMovies = [
      {
        "rating": 5.4,
        "img":
            "https://yts.mx/assets/images/movies/the_divorce_lawyer_2025/large-cover.jpg",
      },
      {
        "rating": 7.3,
        "img":
            "https://yts.mx/assets/images/movies/journey_to_mecca_2009/large-cover.jpg",
      },
      {
        "rating": 5.3,
        "img":
            "https://yts.mx/assets/images/movies/instintos_2025/large-cover.jpg",
      },
      {
        "rating": 5.3,
        "img":
            "https://yts.mx/assets/images/movies/on_the_shore_2023/large-cover.jpg",
      },
    ];
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: ColorsPallete.Dark,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 645.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(poster),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(),
                              style: IconButton.styleFrom(
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
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
                          child: Image.asset(
                            AppIcons.playIcon,
                            width: 97.w,
                            height: 97.h,
                          ),
                        ),
                        BounceInUp(
                          child: Column(
                            children: [
                              Text(
                                'Movie Test',
                                style: theme.textTheme.headlineSmall,
                              ),
                              Text(
                                '2022',
                                style: theme.textTheme.bodyMedium?.copyWith(
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
                        child: Text('Watch', style: theme.textTheme.bodyMedium),
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
                              spacing: 14.w,
                              children: [
                                Image.asset(
                                  AppIcons.favIcon,
                                  width: 28.w,
                                  height: 25.h,
                                ),
                                Text('15'),
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
                              spacing: 14.w,
                              children: [
                                Image.asset(
                                  AppIcons.runtimeIcon,
                                  width: 28.w,
                                  height: 25.h,
                                ),
                                Text('90'),
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
                              spacing: 14.w,
                              children: [
                                Image.asset(
                                  AppIcons.ratingIcon,
                                  width: 28.w,
                                  height: 25.h,
                                ),
                                Text('7.6'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text('Screen Shots', style: theme.textTheme.headlineSmall),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      "https://yts.mx/assets/images/movies/16_Blocks_2006/large-screenshot1.jpg",
                      fit: BoxFit.cover,
                      height: 167.h,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      "https://yts.mx/assets/images/movies/16_Blocks_2006/large-screenshot2.jpg",
                      fit: BoxFit.cover,
                      height: 167.h,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      "https://yts.mx/assets/images/movies/16_Blocks_2006/large-screenshot3.jpg",
                      fit: BoxFit.cover,
                      height: 167.h,
                    ),
                  ),
                  Text('Similar', style: theme.textTheme.headlineSmall),
                  GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16.h,
                      crossAxisSpacing: 20.w,
                      childAspectRatio: 189.w / 299.h,
                    ),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: tempMovies.length,
                    itemBuilder: (context, index) {
                      return MovieBoxWidget(
                        posterImg: tempMovies[index]['img'],
                        rating: tempMovies[index]['rating'].toString(),
                      );
                    },
                  ),
                  Text('Summary', style: theme.textTheme.headlineSmall),
                  Text(
                    'Following the events of Spider-Man No Way Home, Doctor Strange unwittingly casts a forbidden spell that accidentally opens up the multiverse. With help from Wong and Scarlet Witch, Strange confronts various versions of himself as well as teaming up with the young America Chavez while traveling through various realities and working to restore reality as he knows it. Along the way, Strange and his allies realize they must take on a powerful new adversary who seeks to take over the multiverse.—Blazer346',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text('Cast', style: theme.textTheme.headlineSmall),
                  CastBoxWidget(
                    avatar:
                        "https://yts.mx/assets/images/actors/thumb/nm0000246.jpg",
                    name: "Bruce Willis",
                    character: "Det. Jack Mosley",
                  ),
                  CastBoxWidget(
                    avatar:
                        "https://yts.mx/assets/images/actors/thumb/nm0001556.jpg",
                    name: "David Morse",
                    character: "Det. Frank Nugent",
                  ),
                  CastBoxWidget(
                    avatar:
                        "https://yts.mx/assets/images/actors/thumb/nm0574513.jpg",
                    name: "Peter McRobbie",
                    character: "Mike Sheehan",
                  ),
                  CastBoxWidget(
                    avatar:
                        "https://yts.mx/assets/images/actors/thumb/nm0953882.jpg",
                    name: "David Zayas",
                    character: "Det. Robert Torres",
                  ),
                  Text('Genres', style: theme.textTheme.headlineSmall),
                  GridView.builder(
                    shrinkWrap: true,
                    itemCount: 5,
                    padding: EdgeInsets.only(bottom: 13.h),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 122.w / 36.h,
                      crossAxisSpacing: 16.w,
                      mainAxisSpacing: 11.h,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: ColorsPallete.darkTwo,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'Action',
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
      ),
    );
  }
}
