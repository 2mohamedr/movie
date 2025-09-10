import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/widgets/custom_text_field.dart';
import 'package:movies_app/features/profile/bloc/profile_bloc.dart';

import '../../../core/theme_manager/color_palette.dart';

class ResetPasswordButton extends StatelessWidget {
  const ResetPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController currentPassField = TextEditingController();
    TextEditingController newPassField = TextEditingController();
    return TextButton(
      onPressed: () {
        final outerContext = context;
        showModalBottomSheet(
          backgroundColor: ColorsPallete.darkTwo,
          context: context,
          builder: (BuildContext context) {
            return Container(
              width: double.infinity,
              padding: EdgeInsets.all(22).w,
              child: Column(
                spacing: 15.h,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomTextField(
                    icon: Icons.no_encryption,
                    controller: currentPassField,
                    isPassword: true,
                    hintText: "Current Password",
                  ),
                  CustomTextField(
                    icon: Icons.enhanced_encryption,
                    isPassword: true,
                    controller: newPassField,
                    hintText: "New Password",
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsPallete.Dark,
                      foregroundColor: ColorsPallete.PrimaryColor,
                      elevation: 0,
                    ),
                    onPressed: () {
                      outerContext.read<ProfileBloc>().add(
                        ResetPasswordAction(
                          currentPassField.text,
                          newPassField.text,
                        ),
                      );
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(13).w,
                      child: Text("Reset"),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Text("Reset Password", style: TextStyle(color: Colors.grey)),
    );
  }
}
