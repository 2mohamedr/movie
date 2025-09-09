import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/features/browse/widgets/tab_indicator_widget.dart';

import '../../../core/widgets/movie_box_widget.dart';

class BrowseScreen extends StatefulWidget {
  const BrowseScreen({super.key});

  @override
  State<BrowseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  int tabIndex = 0;
  final List<String> tempCategories = [
    "Action",
    "Adventure",
    "Animation",
    "Biography",
    "Comedy",
    "Crime",
    "Documentary",
    "Drama",
    "Family",
    "Fantasy",
    "History",
    "Horror",
    "Music",
    "Musical",
    "Mystery",
    "Romance",
    "Sci-Fi",
    "Sport",
    "Thriller",
    "War",
    "Western",
    "Superhero",
    "Teen",
    "Political",
    "Period Drama",
    "Psychological",
    "Slasher",
    "Disaster",
    "Heist",
    "Martial Arts",
    "Spy",
    "Noir",
    "Experimental",
    "Short Film",
    "Silent Film",
    "Road Movie",
    "Satire",
    "Survival",
    "Cyberpunk",
    "Post-Apocalyptic",
  ];
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
    {
      "rating": 6.6,
      "img": "https://yts.mx/assets/images/movies/hakki_2024/large-cover.jpg",
    },
    {
      "rating": 4.6,
      "img":
          "https://yts.mx/assets/images/movies/genis_aile_4_cevahir_ulvi_2024/large-cover.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16).w,
        child: Column(
          children: [
            DefaultTabController(
              length: tempCategories.length,
              initialIndex: tabIndex,
              child: TabBar(
                isScrollable: true,
                overlayColor: WidgetStateProperty.all(Colors.transparent),
                dividerColor: Colors.transparent,
                padding: EdgeInsets.zero,
                indicator: BoxDecoration(color: Colors.transparent),
                labelPadding: EdgeInsets.zero,
                tabAlignment: TabAlignment.start,
                onTap: (value) {
                  setState(() {
                    tabIndex = value;
                  });
                },
                tabs: tempCategories
                    .asMap()
                    .entries
                    .map(
                      (e) => TabIndicatorWidget(
                        isActive: e.key == tabIndex,
                        label: e.value,
                      ),
                    )
                    .toList(),
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.only(bottom: 100.h),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8.h,
                  childAspectRatio: 191.w / 279.h,
                ),
                shrinkWrap: true,
                itemCount: tempMovies.length,
                itemBuilder: (context, index) {
                  return MovieBoxWidget(
                    posterImg: tempMovies[index]['img'],
                    rating: tempMovies[index]['rating'].toString(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
