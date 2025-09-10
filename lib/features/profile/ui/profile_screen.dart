import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/constants/app_icons.dart';
import 'package:movies_app/core/constants/app_images.dart';
import 'package:movies_app/core/routes/routes_name.dart';
import 'package:movies_app/core/theme_manager/color_palette.dart';
import 'package:movies_app/core/widgets/movie_box_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
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
    return DefaultTabController(
      length: 2,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(color: ColorsPallete.darkTwo),
            height: 389.h,
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 23.h,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24).w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Image.asset(
                              "assets/avatars/avatar8.png",
                              width: 118.w,
                              height: 118.h,
                            ),
                            Text(
                              'Ibram Nagy',
                              style: theme.textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text('12', style: theme.textTheme.titleMedium),
                            Text(
                              'Wish List',
                              style: theme.textTheme.headlineSmall,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text('10', style: theme.textTheme.titleMedium),
                            Text(
                              'History',
                              style: theme.textTheme.headlineSmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24).w,
                    child: Row(
                      spacing: 10.w,
                      children: [
                        Expanded(
                          flex: 2,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorsPallete.PrimaryColor,
                              foregroundColor: ColorsPallete.Dark,
                              minimumSize: const Size(double.infinity, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                RoutesName.profileScreen,
                              );
                            },
                            child: Text(
                              "Edit Profile",
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: ColorsPallete.Dark,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorsPallete.danger,
                              foregroundColor: ColorsPallete.Dark,
                              minimumSize: const Size(double.infinity, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {},
                            child: Row(
                              spacing: 5.w,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Exit",
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Image.asset(
                                  AppIcons.exitIcon,
                                  width: 20.w,
                                  height: 20.h,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBar(
                      dividerColor: Colors.transparent,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorColor: ColorsPallete.PrimaryColor,
                      tabs: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          spacing: 10.h,
                          children: [
                            Image.asset(
                              AppIcons.menuPrimaryColorIcon,
                              width: 29.w,
                              height: 22.h,
                            ),
                            Text(
                              'Watch List',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          spacing: 10.h,
                          children: [
                            Image.asset(
                              AppIcons.folderPrimaryColorIcon,
                              width: 29.w,
                              height: 22.h,
                            ),
                            Text(
                              'History',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                Center(
                  child: Image.asset(
                    AppImages.emptyImg,
                    width: 124.w,
                    height: 124.h,
                  ),
                ),
                GridView.builder(
                  padding: EdgeInsets.only(top: 24.h, left: 16, bottom: 100.h),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 122.w / 179.h,
                    crossAxisSpacing: 12.w,
                  ),
                  itemCount: tempMovies.length,
                  itemBuilder: (context, index) {
                    return MovieBoxWidget(
                      posterImg: tempMovies[index]['img'],
                      rating: tempMovies[index]['rating'].toString(),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
