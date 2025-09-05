import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/constants/app_images.dart';
import 'package:movies_app/core/routes/routes_name.dart';

import '../../core/theme_manager/color_palette.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ZoomIn(
                      duration: Duration(seconds: 1),
                      child: Bounce(
                        duration: Duration(seconds: 1),
                        child: Image.asset(
                          AppImages.logo,
                          fit: BoxFit.cover,
                          height: 100,
                        ),
                      ),
                    ),

                    ElasticIn(
                      child: AnimatedTextKit(
                        animatedTexts: [
                          ColorizeAnimatedText(
                            'Movie',
                            textStyle: theme.textTheme.titleLarge!,
                            colors: [
                              ColorsPallete.PrimaryColor,
                              Colors.white,
                              ColorsPallete.PrimaryColor,
                              ColorsPallete.PrimaryColor,
                            ],
                          ),
                        ],
                        repeatForever: true,
                        isRepeatingAnimation: true,
                        pause: Duration(seconds: 5),
                      ),
                    ),
                  ],
                ),
              ),
              FadeInUp(
                onFinish: (direction) {
                  Navigator.pushReplacementNamed(context, RoutesName.onboarding);
                },
                delay: Duration(seconds: 3),
                child: Column(
                  children: [
                    Image.asset(
                      AppImages.logoRoute,
                      fit: BoxFit.cover,
                      width: 230,
                    ),
                    Text(
                      "Supervised by Mohamed Nabil",
                      style: theme.textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
