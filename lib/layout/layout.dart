import 'package:flutter/material.dart';
import 'package:project_dicoding/views/mobile/auth/sign_in.dart';
import 'package:project_dicoding/views/website/auth/sign_in_web.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      double deviceWidth = constraints.maxWidth;
      // double deviceHeight = constraints.maxHeight;

      if (deviceWidth >= 500) {
        return const WebSignInPage();
      } else {
        return const SignInPage();
      }
    });
  }
}
