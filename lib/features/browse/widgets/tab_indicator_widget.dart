import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme_manager/color_palette.dart';

class TabIndicatorWidget extends StatelessWidget {
  final String label;
  final bool isActive;

  const TabIndicatorWidget({
    super.key,
    required this.isActive,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return AnimatedContainer(
      duration: Durations.medium1,
      curve: Curves.easeIn,
      padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 22.w),
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ColorsPallete.PrimaryColor, width: 2),
        color: isActive ? ColorsPallete.PrimaryColor : Colors.transparent,
      ),
      child: Text(
        label,
        style: theme.textTheme.bodyMedium?.copyWith(
          color: isActive ? ColorsPallete.Dark : ColorsPallete.PrimaryColor,
        ),
      ),
    );
  }
}
