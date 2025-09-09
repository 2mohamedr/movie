import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/constants/app_images.dart';
import 'package:movies_app/core/models/movie_model.dart';
import 'package:movies_app/core/widgets/movie_box_widget.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key, required this.movies});

  final List<MovieModel> movies;

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  int indexOfContainerBackground = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(widget.movies[indexOfContainerBackground].poster),
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
                items: widget.movies.map((e) {
                  return MovieBoxWidget(posterImg: e.poster, rating: e.rating);
                }).toList(),
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
