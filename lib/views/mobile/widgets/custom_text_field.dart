import 'package:flutter/material.dart';
import 'package:project_dicoding/theme/theme.dart';
import 'package:project_dicoding/views/mobile/widgets/custom_text.dart';

class CustomTextField extends StatelessWidget {
  final bool obScure;
  final TextEditingController? controller;
  final Icon prefixIcon;
  final String hintText;
  final StyleForText hintStyle;
  const CustomTextField({
    super.key,
    this.obScure = false,
    this.controller,
    required this.prefixIcon,
    required this.hintText,
    required this.hintStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextFormField(
        onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
        obscureText: obScure,
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          fillColor: whiteColor,
          filled: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 0,
          ),
          hintText: hintText,
          hintStyle: greyTextStyle.copyWith(
            fontSize: hintStyle.fontSize,
            fontWeight: hintStyle.fontWeight,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
