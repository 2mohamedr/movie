import 'package:animate_do/animate_do.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app/core/constants/app_icons.dart';
import 'package:movies_app/core/constants/app_images.dart';
import 'package:movies_app/core/routes/routes_name.dart';
import 'package:movies_app/core/theme_manager/color_palette.dart';
import 'package:movies_app/core/widgets/custom_text_field.dart';
import 'package:toastification/toastification.dart';

import '../bloc/auth_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String current = "AR";
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthRegisterSuccess) {
            toastification.show(
              title: Text("Account Created"),
              icon: Icon(Icons.check_circle),
              type: ToastificationType.success,
              autoCloseDuration: Duration(seconds: 5),
            );
            Navigator.pushReplacementNamed(context, RoutesName.loginScreen);
          }
          if (state is AuthFailure) {
            toastification.show(
              title: Text(state.fail.message),
              icon: Icon(Icons.error),
              type: ToastificationType.error,
              autoCloseDuration: Duration(seconds: 5),
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Scaffold(
              backgroundColor: ColorsPallete.Dark,
              body: Center(
                child: Lottie.asset(
                  AppImages.loadingJson,
                  backgroundLoading: false,
                  width: 120,
                ),
              ),
            );
          }
          return Form(
            key: formKey,
            child: Padding(
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

                      CustomTextField(
                        hintText: "Name",
                        controller: nameController,
                        imagePath: AppIcons.iconIdentification,
                      ),
                      CustomTextField(
                        hintText: "Email",
                        controller: emailController,
                        imagePath: AppIcons.iconEmail,
                      ),
                      CustomTextField(
                        hintText: "Password",
                        controller: passwordController,
                        imagePath: AppIcons.iconPassword,
                        isPassword: true,
                      ),
                      CustomTextField(
                        hintText: "Confirm Password",
                        controller: confirmPasswordController,
                        imagePath: AppIcons.iconPassword,
                        isPassword: true,
                      ),
                      CustomTextField(
                        hintText: "Phone",
                        controller: phoneController,
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
                          context.read<AuthBloc>().add(
                            RegisterEvent(
                              nameController.text.trim(),
                              emailController.text.trim(),
                              phoneController.text.trim(),
                              passwordController.text.trim(),
                              confirmPasswordController.text.trim(),
                            ),
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
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                context,
                                RoutesName.loginScreen,
                              );
                            },
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
        },
      ),
    );
  }
}
