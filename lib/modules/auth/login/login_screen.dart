import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/constants/app_icons.dart';
import 'package:movies_app/core/constants/app_images.dart';
import 'package:movies_app/core/routes/routes_name.dart';
import 'package:movies_app/core/theme_manager/color_palette.dart';

import 'custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String current = "AR";

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 16),
        child: ListView(
          children: [
            Column(
              spacing: 16,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ZoomIn(
                      duration: const Duration(seconds: 1),
                      child: Bounce(
                        duration: const Duration(seconds: 1),
                        child: Image.asset(
                          AppImages.logo,
                          fit: BoxFit.cover,
                          height: 120,
                        ),
                      ),
                    ),
                    ElasticIn(
                      child: AnimatedTextKit(
                        animatedTexts: [
                          ColorizeAnimatedText(
                            'Movie',
                            textStyle: theme.textTheme.titleLarge!,
                            colors: [
                              ColorsPallete.PrimaryColor,
                              ColorsPallete.white,
                              ColorsPallete.PrimaryColor,
                              ColorsPallete.PrimaryColor,
                            ],
                          ),
                        ],
                        repeatForever: true,
                        pause: const Duration(seconds: 5),
                      ),
                    ),
                  ],
                ),

                const CustomTextField(
                  hintText: "Email",
                  imagePath: AppIcons.iconEmail,
                ),

                const CustomTextField(
                  hintText: "Password",
                  imagePath: AppIcons.iconPassword,
                  isPassword: true,
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        RoutesName.forgetPassword,
                      );
                    },
                    child: const Text(
                      "Forget Password ?",
                      style: TextStyle(color: ColorsPallete.PrimaryColor),
                    ),
                  ),
                ),

                ElevatedButton(
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
                      RoutesName.profileScreen,
                    );
                  },
                  child: const Text("Login"),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don’t Have Account ? ",
                      style: TextStyle(color: ColorsPallete.white),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                          context,
                          RoutesName.registerScreen,
                        );
                      },
                      child: const Text(
                        "Create One",
                        style: TextStyle(
                          color: ColorsPallete.PrimaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Divider(color: ColorsPallete.PrimaryColor),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: const Text(
                          "OR",
                          style: TextStyle(color: ColorsPallete.PrimaryColor),
                        ),
                      ),
                      const Expanded(
                        child: Divider(color: ColorsPallete.PrimaryColor),
                      ),
                    ],
                  ),
                ),

                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorsPallete.PrimaryColor,
                    foregroundColor: ColorsPallete.Dark,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {},
                  icon: Image.asset(AppIcons.iconGoogle, width: 24, height: 24),
                  label: const Text("Login With Google"),
                ),
                Center(
                  child: AnimatedToggleSwitch<String>.rolling(
                    current: current,
                    values: const ["AR", "ER"],
                    iconList: [
                      Image.asset(AppIcons.iconLr, width: 30, height: 30),
                      Image.asset(AppIcons.iconEg, width: 30, height: 30),
                    ],
                    indicatorSize: const Size(40, 40),
                    height: 40,
                    style: ToggleStyle(
                      backgroundColor: Colors.transparent,
                      borderColor: ColorsPallete.PrimaryColor,
                      indicatorColor: ColorsPallete.PrimaryColor,
                    ),
                    onChanged: (value) {
                      setState(() {
                        current = value;
                      });
                      debugPrint("Selected Language: $value");
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
