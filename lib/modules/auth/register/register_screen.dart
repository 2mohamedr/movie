import 'package:animate_do/animate_do.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/constants/app_icons.dart';

import 'package:movies_app/core/routes/routes_name.dart';
import 'package:movies_app/core/theme_manager/color_palette.dart';
import 'package:movies_app/modules/auth/login/custom_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String current = "AR";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 16),
        child: ListView(
          children: [
            Column(
              spacing: 24,
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
                          AppIcons.iconProfile,
                          fit: BoxFit.cover,
                          height: 150,
                        ),
                      ),
                    ),
                    Text("Avatar"),
                  ],
                ),

                const CustomTextField(
                  hintText: "Name",
                  imagePath: AppIcons.iconIdentification,
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
                const CustomTextField(
                  hintText: "Confirm Password",
                  imagePath: AppIcons.iconPassword,
                  isPassword: true,
                ),
                const CustomTextField(
                  hintText: "Phone",
                  imagePath: AppIcons.iconPhone,
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
                      RoutesName.loginScreen,
                    );
                  },
                  child: const Text("Create Account"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already Have Account ? ",
                      style: TextStyle(color: ColorsPallete.white),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          color: ColorsPallete.PrimaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
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
