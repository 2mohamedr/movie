import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/constants/app_icons.dart';
import 'package:movies_app/core/constants/app_images.dart';
import 'package:movies_app/core/routes/routes_name.dart';
import 'package:movies_app/core/theme_manager/color_palette.dart';
import 'package:movies_app/modules/auth/login/custom_button.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 30,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
        ZoomIn(
        duration: const Duration(seconds: 1),
        child: BackInLeft(
          duration: const Duration(seconds: 1),
          child: Image.asset(
            AppImages.ForgotPassword,
            fit: BoxFit.cover,
            // height: 150,
          ),
        )
        ),

            ZoomIn(
              duration: const Duration(seconds: 1),
              child: const CustomTextField(
                hintText: "Email",
                imagePath: AppIcons.iconEmail,
              ),
            ),
            ZoomIn(
              duration: const Duration(seconds: 1),
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
                  Navigator.pushReplacementNamed(
                    context,
                    RoutesName.loginScreen,
                  );
                },
                child: const Text("Verify Email"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
