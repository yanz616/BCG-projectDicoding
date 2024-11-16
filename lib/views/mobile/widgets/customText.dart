import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_dicoding/theme/theme.dart';

class StyleForText {
  final FontWeight fontWeight;
  final double fontSize;

  StyleForText(
    this.fontWeight,
    this.fontSize,
  );
}

class DScriptText extends StatelessWidget {
  final String text;
  final StyleForText styleForText;
  final Color? color;
  const DScriptText({
    super.key,
    required this.text,
    required this.styleForText,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.dancingScript(
        fontWeight: styleForText.fontWeight,
        fontSize: styleForText.fontSize,
        color: color,
      ),
    );
  }
}

class WhiteText extends StatelessWidget {
  final String text;
  final StyleForText styleForText;

  const WhiteText({
    super.key,
    required this.text,
    required this.styleForText,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: whiteTextStyle.copyWith(
        fontSize: styleForText.fontSize,
        fontWeight: styleForText.fontWeight,
      ),
    );
  }
}

class GreyText extends StatelessWidget {
  final String text;
  final StyleForText styleForText;
  const GreyText({
    super.key,
    required this.text,
    required this.styleForText,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: greyTextStyle.copyWith(
        fontSize: styleForText.fontSize,
        fontWeight: styleForText.fontWeight,
      ),
    );
  }
}

class GreenText extends StatelessWidget {
  final String text;
  final StyleForText styleForText;
  const GreenText({
    super.key,
    required this.text,
    required this.styleForText,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: greenTextStyle.copyWith(
        fontSize: styleForText.fontSize,
        fontWeight: styleForText.fontWeight,
      ),
    );
  }
}

class BlackText extends StatelessWidget {
  final String text;
  final StyleForText styleForText;
  const BlackText({
    super.key,
    required this.text,
    required this.styleForText,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: blackTextStyle.copyWith(
        fontSize: styleForText.fontSize,
        fontWeight: styleForText.fontWeight,
      ),
    );
  }
}
