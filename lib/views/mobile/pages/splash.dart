import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:project_dicoding/views/mobile/auth/sign_in.dart';
import 'package:project_dicoding/theme/theme.dart';
import 'package:project_dicoding/views/mobile/widgets/custom_text.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 10),
      () {
        Navigator.pushReplacement(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => const SignInPage(),
          ),
        );
      }, //onpressed
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/BCG-logo.png',
            ),
            const Gap(4),
            DScriptText(
              text: 'BCG',
              styleForText: StyleForText(
                bold,
                40,
              ),
              color: whiteColor,
            ),
            const Gap(4),
            DScriptText(
              text: 'Bussines Consultation Group',
              styleForText: StyleForText(
                semiBold,
                20,
              ),
              color: whiteColor,
            ),
          ],
        ),
      ),
    );
  }
}
