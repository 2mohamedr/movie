import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app/core/constants/app_images.dart';

class MovieBoxWidget extends StatelessWidget {
  const MovieBoxWidget({
    super.key,
    required this.posterImg,
    required this.rating,
  });

  final String posterImg;
  final String rating;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(right: 16.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              posterImg,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return Center(
                  child: Lottie.asset(AppImages.loadingJson, width: 100),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(AppImages.ForgotPassword);
              },
            ),
          ),
          Positioned(
            top: 11,
            left: 9,
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(18, 19, 18, 0.71),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(5),
              child: Row(
                spacing: 5,
                children: [
                  Text(
                    rating,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Icon(Icons.star, size: 23, color: Colors.amber),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
