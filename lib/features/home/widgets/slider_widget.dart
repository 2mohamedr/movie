import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/constants/app_images.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  int indexOfContainerBackground = 0;
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
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(tempMovies[indexOfContainerBackground]['img']),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(18, 19, 18, 0.8),
              Color.fromRGBO(18, 19, 18, 0.6),
              Color.fromRGBO(18, 19, 18, 1),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(AppImages.availableNowTextImg, width: 267),
              CarouselSlider(
                items: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          tempMovies[0]['img'],
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 11,
                        left: 9,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(18, 19, 18, 0.71),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.all(5),
                          child: Row(
                            spacing: 5,
                            children: [
                              Text(
                                "7.7",
                                style: theme.textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Icon(Icons.star, size: 23, color: Colors.amber),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          tempMovies[1]['img'],
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 11,
                        left: 9,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(18, 19, 18, 0.71),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.all(5),
                          child: Row(
                            spacing: 5,
                            children: [
                              Text(
                                "7.7",
                                style: theme.textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Icon(Icons.star, size: 23, color: Colors.amber),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          tempMovies[2]['img'],
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 11,
                        left: 9,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(18, 19, 18, 0.71),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.all(5),
                          child: Row(
                            spacing: 5,
                            children: [
                              Text(
                                "7.7",
                                style: theme.textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Icon(Icons.star, size: 23, color: Colors.amber),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          tempMovies[3]['img'],
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 11,
                        left: 9,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(18, 19, 18, 0.71),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.all(5),
                          child: Row(
                            spacing: 5,
                            children: [
                              Text(
                                "7.7",
                                style: theme.textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Icon(Icons.star, size: 23, color: Colors.amber),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          tempMovies[4]['img'],
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 11,
                        left: 9,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(18, 19, 18, 0.71),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.all(5),
                          child: Row(
                            spacing: 5,
                            children: [
                              Text(
                                "7.7",
                                style: theme.textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Icon(Icons.star, size: 23, color: Colors.amber),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          tempMovies[5]['img'],
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 11,
                        left: 9,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(18, 19, 18, 0.71),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.all(5),
                          child: Row(
                            spacing: 5,
                            children: [
                              Text(
                                "7.7",
                                style: theme.textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Icon(Icons.star, size: 23, color: Colors.amber),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 351 / 234,
                  enlargeCenterPage: true,
                  viewportFraction: 0.5,
                  onPageChanged: (index, reason) {
                    setState(() {
                      indexOfContainerBackground = index;
                    });
                  },
                ),
              ),
              Image.asset(AppImages.watchNowTextImg, width: 354),
            ],
          ),
        ),
      ),
    );
  }
}
