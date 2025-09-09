import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/core/constants/app_icons.dart';
import 'package:movies_app/core/theme_manager/color_palette.dart';
import 'package:movies_app/features/browse/ui/browse_screen.dart';
import 'package:movies_app/features/home/home_screen.dart';
import 'package:movies_app/features/search/ui/search_screen.dart';

class LayoutController extends StatefulWidget {
  const LayoutController({super.key});

  @override
  State<LayoutController> createState() => _LayoutControllerState();
}

class _LayoutControllerState extends State<LayoutController> {
  List<Widget> originScreens = [HomeScreen(), SearchScreen(), BrowseScreen()];
  int currentScreenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: originScreens[currentScreenIndex],
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.noAnimation,
      floatingActionButton: Container(
        margin: EdgeInsets.symmetric(horizontal: 9).w,
        padding: EdgeInsets.symmetric(vertical: 19.h, horizontal: 33.w),
        decoration: BoxDecoration(
          color: ColorsPallete.darkTwo,
          borderRadius: BorderRadius.circular(16).r,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  currentScreenIndex = 0;
                });
              },
              child: SvgPicture.asset(
                AppIcons.homeIcon,
                width: 22.w,
                colorFilter: (currentScreenIndex == 0)
                    ? ColorFilter.mode(
                        ColorsPallete.PrimaryColor,
                        BlendMode.srcIn,
                      )
                    : null,
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  currentScreenIndex = 1;
                });
              },
              child: SvgPicture.asset(
                AppIcons.searchIcon,
                width: 22.w,
                colorFilter: (currentScreenIndex == 1)
                    ? ColorFilter.mode(
                        ColorsPallete.PrimaryColor,
                        BlendMode.srcIn,
                      )
                    : null,
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  currentScreenIndex = 2;
                });
              },
              child: SvgPicture.asset(
                AppIcons.exploreIcon,
                width: 22.w,
                colorFilter: (currentScreenIndex == 2)
                    ? ColorFilter.mode(
                        ColorsPallete.PrimaryColor,
                        BlendMode.srcIn,
                      )
                    : null,
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  currentScreenIndex = 3;
                });
              },
              child: SvgPicture.asset(
                AppIcons.userIcon,
                width: 22.w,
                colorFilter: (currentScreenIndex == 3)
                    ? ColorFilter.mode(
                        ColorsPallete.PrimaryColor,
                        BlendMode.srcIn,
                      )
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
