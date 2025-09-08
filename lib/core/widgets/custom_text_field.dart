import 'package:flutter/material.dart';
import 'package:movies_app/core/theme_manager/color_palette.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final IconData? icon;
  final String? imagePath;
  final bool isPassword;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.icon,
    this.imagePath,
    this.isPassword = false,
    this.validator,
    this.controller,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      obscureText: _obscureText,
      controller: widget.controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorsPallete.Dark,
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: ColorsPallete.white),

        prefixIcon: widget.icon != null
            ? Icon(widget.icon, color: ColorsPallete.white)
            : (widget.imagePath != null
                  ? Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset(
                        widget.imagePath!,
                        width: 24,
                        height: 24,
                        color: ColorsPallete.white,
                      ),
                    )
                  : null),

        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText
                      ? Icons.visibility_off_rounded
                      : Icons.visibility_rounded,
                  color: ColorsPallete.white,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
      style: const TextStyle(color: ColorsPallete.white),
    );
  }
}
