import 'package:flutter/material.dart';
import 'package:project_dicoding/theme/theme.dart';
import 'package:project_dicoding/views/mobile/widgets/customText.dart';

class CustomTextField extends StatelessWidget {
  final bool obScure;
  final TextEditingController? controller;
  final Icon prefixIcon;
  final Color? color;
  final bool? filled;
  final double horizontal;
  final double vertikal;
  final String hintText;
  final StyleForText hintStyle;
  final double radius;

  const CustomTextField({
    super.key,
    this.obScure = false,
    this.controller,
    required this.prefixIcon,
    this.color,
    this.filled,
    required this.horizontal,
    required this.vertikal,
    required this.hintText,
    required this.hintStyle,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 400,
        child: TextField(
          obscureText: obScure,
          controller: controller,
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            fillColor: color,
            filled: filled,
            contentPadding: EdgeInsets.symmetric(
              horizontal: horizontal,
              vertical: vertikal,
            ),
            hintText: hintText,
            hintStyle: greyTextStyle.copyWith(
              fontSize: hintStyle.fontSize,
              fontWeight: hintStyle.fontWeight,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
          ),
        ),
      ),
    );
  }
}
