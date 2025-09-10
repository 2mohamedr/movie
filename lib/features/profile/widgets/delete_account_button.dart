import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme_manager/color_palette.dart';
import '../bloc/profile_bloc.dart';

class DeleteAccountButton extends StatelessWidget {
  const DeleteAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        minimumSize: Size(double.infinity, 50),
      ),
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
                  Text("This Action Cannot be undone"),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 20.w,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorsPallete.danger,
                          foregroundColor: ColorsPallete.white,
                          elevation: 0,
                        ),
                        onPressed: () {
                          outerContext.read<ProfileBloc>().add(
                            DeleteProfileButtonClicked(),
                          );
                          Navigator.pop(context);
                        },
                        child: Text("Delete Now"),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorsPallete.Dark,
                          foregroundColor: ColorsPallete.PrimaryColor,
                          elevation: 0,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Cancel"),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Text("Delete Account"),
    );
  }
}
