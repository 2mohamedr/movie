import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/constants/app_images.dart';
import 'package:movies_app/core/routes/routes_name.dart';
import 'package:movies_app/core/theme_manager/color_palette.dart';

class StartScreens extends StatelessWidget {
  const StartScreens({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: Container(
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.onBoarding1),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              FadeInLeftBig(
                child: Column(
                  children: [
                    Text(
                      "Find Your Next \nFavorite Movie Here",
                      style: theme.textTheme.titleMedium,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Get access to a huge library of movies\n to suit all tastes. You will surely like it.",
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.white60,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              SizedBox(
                width: double.infinity,
                child: CupertinoButton(
                  color: ColorsPallete.PrimaryColor,
                  child: Text(
                    'Explore Now',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, RoutesName.onboardingContent);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
