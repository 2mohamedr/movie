import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/theme_manager/color_palette.dart';

class CastBoxWidget extends StatelessWidget {
  final String name;
  final String character;
  final String avatar;

  const CastBoxWidget({
    super.key,
    required this.name,
    required this.character,
    required this.avatar,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(11),
      decoration: BoxDecoration(
        color: ColorsPallete.darkTwo,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        spacing: 10.w,
        children: [
          if (avatar != '')
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                avatar,
                fit: BoxFit.cover,
                width: 70.w,
                height: 70.h,
              ),
            ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name : $name',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  'Character : $character',
                  softWrap: true,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
