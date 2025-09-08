
import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/constants/app_images.dart';
import 'package:movies_app/core/routes/routes_name.dart';
import 'package:movies_app/core/theme_manager/color_palette.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List<Map<String, dynamic>> contents = [
    {
      "title": "Discover Movies",
      "desc":
          "Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.",
      "imgPath": AppImages.onBoarding2,
    },
    {
      "title": "Explore All Genres",
      "desc":
          "Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.",
      "imgPath": AppImages.onBoarding3,
    },
    {
      "title": "Create Watchlists",
      "desc":
          "Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.",
      "imgPath": AppImages.onBoarding4,
    },
    {
      "title": "Rate, Review, and Learn",
      "desc":
          "Share your thoughts on the movies you've watched. Dive deep into film details and help others discover great movies with your reviews.",
      "imgPath": AppImages.onBoarding5,
    },
    {
      "title": "Start Watching Now",
      "desc": "",
      "imgPath": AppImages.onBoarding6,
    },
  ];
  int currentIndex = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    for (var content in contents) {
      precacheImage(AssetImage(content['imgPath']), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            contents[currentIndex]['imgPath'],
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.8,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: ColorsPallete.Dark,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                spacing: 16,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ZoomIn(
                    key: ValueKey(currentIndex),
                    child: Column(
                      children: [
                        Text(
                          contents[currentIndex]['title'],
                          style: theme.textTheme.headlineSmall,
                          textAlign: TextAlign.center,
                        ),
                        if (contents[currentIndex]['desc'] != "")
                          Text(
                            contents[currentIndex]['desc'],
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
                        (currentIndex < contents.length - 1)
                            ? 'Next'
                            : "Finish",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        if (currentIndex < contents.length - 1) {
                          setState(() {
                            currentIndex++;
                          });
                        } else {
                          Navigator.pushReplacementNamed(
                           context,
                           RoutesName.loginScreen,);
                        }
                      },
                    ),
                  ),
                  if (currentIndex != 0)
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          width: 2,
                          color: ColorsPallete.PrimaryColor,
                        ),
                      ),
                      width: double.infinity,
                      child: CupertinoButton(
                        color: Colors.transparent,
                        child: Text(
                          'Back',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          setState(() {
                            currentIndex--;
                          });
                        },
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


