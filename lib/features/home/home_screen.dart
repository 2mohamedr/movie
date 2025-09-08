import 'package:flutter/material.dart';
import 'package:movies_app/core/theme_manager/color_palette.dart';
import 'package:movies_app/features/home/widgets/home_movie_category_widget.dart';
import 'package:movies_app/features/home/widgets/slider_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsPallete.Dark,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [SliderWidget(), HomeMovieCategoryWidget()],
        ),
      ),
    );
  }
}
