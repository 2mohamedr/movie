import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app/core/params/update_profile_parameters.dart';
import 'package:movies_app/core/routes/routes_name.dart';
import 'package:movies_app/core/theme_manager/color_palette.dart';
import 'package:movies_app/features/profile/widgets/delete_account_button.dart';
import 'package:movies_app/features/profile/widgets/reset_password_button.dart';
import 'package:toastification/toastification.dart';

import '../../../core/constants/app_images.dart';
import '../bloc/profile_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int selectedAvatar = 0;
  bool isPickedAvatar = false;
  final List<String> avatars = [
    "assets/avatars/avatar1.png",
    "assets/avatars/avatar2.png",
    "assets/avatars/avatar3.png",
    "assets/avatars/avatar4.png",
    "assets/avatars/avatar5.png",
    "assets/avatars/avatar6.png",
    "assets/avatars/avatar7.png",
    "assets/avatars/avatar8.png",
    "assets/avatars/avatar9.png",
  ];

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return BlocProvider(
      create: (context) => ProfileBloc()..add(OnUpdateProfileOpen()),
      child: Scaffold(
        backgroundColor: ColorsPallete.Dark,
        appBar: AppBar(
          // leading: BackButton(color: Colors.yellow),
          backgroundColor: ColorsPallete.Dark,
          elevation: 0,
          title: Text("Pick Avatar"),
          centerTitle: true,
        ),
        body: BlocConsumer<ProfileBloc, ProfileState>(
          listener: (context, state) {
            if (state is CannotUpdateLocalProfileData) {
              toastification.show(
                type: ToastificationType.warning,
                title: Text(
                  "Profile updated, but Cannot update local date so please log-in again",
                ),
                icon: Icon(Icons.warning_rounded),
                autoCloseDuration: Duration(seconds: 5),
              );
            }
            if (state is ProfileUpdateSuccess) {
              toastification.show(
                type: ToastificationType.success,
                title: Text("Profile updated"),
                icon: Icon(Icons.check_circle),
                autoCloseDuration: Duration(seconds: 5),
              );
            }
            if (state is ProfileError) {
              toastification.show(
                type: ToastificationType.error,
                title: Text(state.message),
                icon: Icon(Icons.error),
                autoCloseDuration: Duration(seconds: 5),
              );
            }
            if (state is ProfileDeleteSuccess) {
              toastification.show(
                type: ToastificationType.success,
                title: Text("Account Deleted Successfully"),
                icon: Icon(Icons.check_circle),
                autoCloseDuration: Duration(seconds: 5),
              );
              Navigator.pushReplacementNamed(
                context,
                RoutesName.registerScreen,
              );
            }
          },
          builder: (context, state) {
            return BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                if (state is ProfileLoading) {
                  return Center(
                    child: Lottie.asset(
                      AppImages.loadingJson,
                      backgroundLoading: false,
                      width: 120.w,
                    ),
                  );
                } else if (state is ProfileError) {
                  return Center(
                    child: Text(
                      state.message,
                      style: theme.textTheme.headlineSmall,
                    ),
                  );
                } else if (state is ProfileSuccess) {
                  nameController.text = state.user.name;
                  phoneController.text = state.user.phone;
                  return SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              elevation: 0,
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (context) {
                                return Container(
                                  margin: EdgeInsets.all(16),
                                  padding: EdgeInsets.all(19),
                                  decoration: BoxDecoration(
                                    color: ColorsPallete.Dark,
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: GridView.builder(
                                    shrinkWrap: true,
                                    itemCount: avatars.length,
                                    physics: NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          mainAxisSpacing: 12,
                                          crossAxisSpacing: 12,
                                        ),
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            isPickedAvatar = true;
                                            selectedAvatar = index;
                                          });
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: selectedAvatar == index
                                                  ? Colors.yellow
                                                  : Colors.transparent,
                                              width: 2,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                            color: Colors.grey[900],
                                          ),
                                          child: Center(
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              child: Image.asset(
                                                avatars[index],
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            );
                          },
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage(
                              isPickedAvatar
                                  ? avatars[selectedAvatar]
                                  : getAvatarPathById(state.user.avatarId),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        TextField(
                          controller: nameController,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person, color: Colors.grey),
                            filled: true,
                            fillColor: Colors.grey[900],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),

                        TextField(
                          controller: phoneController,
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.phone, color: Colors.grey),
                            filled: true,
                            fillColor: Colors.grey[900],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: ResetPasswordButton(),
                        ),

                        const SizedBox(height: 30),

                        // Buttons
                        DeleteAccountButton(),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.yellow,
                            minimumSize: Size(double.infinity, 50),
                          ),
                          onPressed: () {
                            context.read<ProfileBloc>().add(
                              UpdateProfileButtonClicked(
                                UpdateProfileParameters(
                                  name: nameController.text,
                                  phone: phoneController.text,
                                  avatarId: (selectedAvatar + 1).toString(),
                                ),
                              ),
                            );
                          },
                          child: Text(
                            "Update Data",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return SizedBox.shrink();
              },
            );
          },
        ),
      ),
    );
  }

  String getAvatarPathById(String id) {
    switch (id) {
      case "1":
        return "assets/avatars/avatar1.png";
      case "2":
        return "assets/avatars/avatar2.png";
      case "3":
        return "assets/avatars/avatar3.png";
      case "4":
        return "assets/avatars/avatar4.png";
      case "5":
        return "assets/avatars/avatar5.png";
      case "6":
        return "assets/avatars/avatar6.png";
      case "7":
        return "assets/avatars/avatar7.png";
      case "8":
        return "assets/avatars/avatar8.png";
      case "9":
        return "assets/avatars/avatar9.png";
      default:
        return "assets/avatars/avatar1.png";
    }
  }
}
