import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/constants/app_icons.dart';
import 'package:movies_app/core/constants/app_images.dart';
import 'package:movies_app/core/theme_manager/color_palette.dart';
import 'package:movies_app/core/widgets/custom_text_field.dart';
import 'package:movies_app/core/widgets/movie_box_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String query = "";
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
        padding: const EdgeInsets.all(16).w,
        child: Column(
          spacing: 13.h,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            CustomTextField(
              hintText: "Search",
              backgroundColor: ColorsPallete.darkTwo,
              imagePath: AppIcons.searchPngIcon,
              onChanged: (p0) {
                setState(() {
                  query = p0;
                });
              },
            ),
            (query == "")
                ? Expanded(
                    child: Center(
                      child: Image.asset(
                        AppImages.emptyImg,
                        width: 124.w,
                        height: 124.h,
                      ),
                    ),
                  )
                : Expanded(
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
                          id: 0,
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
