import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:project_dicoding/theme/theme.dart';
import 'package:project_dicoding/views/mobile/pages/home.dart';
import 'package:project_dicoding/views/mobile/widgets/button.dart';
import 'package:project_dicoding/views/mobile/widgets/customText.dart';
import 'package:project_dicoding/views/mobile/widgets/customTextField.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(
          top: 120,
        ),
        child: Column(
          children: <Widget>[
            Image.asset(
              'assets/icons/BCG-logo.png',
              width: 80,
            ),
            const Gap(10),
            WhiteText(
              text: 'Login',
              styleForText: StyleForText(
                semiBold,
                24.0,
              ),
            ),
            const Gap(80),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  WhiteText(
                    text: 'Username',
                    styleForText: StyleForText(
                      medium,
                      16.0,
                    ),
                  ),
                  const Gap(4),
                  CustomTextField(
                    controller: _userNameController,
                    prefixIcon: const Icon(
                      Icons.person,
                      color: primaryColor,
                    ),
                    horizontal: 16.0,
                    vertikal: 0.0,
                    hintText: 'Enter Your Name',
                    hintStyle: StyleForText(
                      regular,
                      12.0,
                    ),
                    filled: true,
                    color: whiteColor,
                    radius: 12.0,
                  ),
                  const Gap(14),
                  WhiteText(
                    text: 'Password',
                    styleForText: StyleForText(
                      medium,
                      16.0,
                    ),
                  ),
                  const Gap(4),
                  CustomTextField(
                    controller: _passcontroller,
                    obScure: true,
                    prefixIcon: const Icon(
                      Icons.key,
                      color: primaryColor,
                    ),
                    horizontal: 16.0,
                    vertikal: 0.0,
                    hintText: 'Enter Your Password',
                    hintStyle: StyleForText(
                      regular,
                      12.0,
                    ),
                    filled: true,
                    color: whiteColor,
                    radius: 12.0,
                  ),
                  const Gap(40),
                  Container(
                    height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: secondColor,
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Home(
                              name: _userNameController.text,
                            ),
                          ),
                        );
                      },
                      child: WhiteText(
                        text: 'Login',
                        styleForText: StyleForText(
                          medium,
                          14.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            const RouteValidate(
              text: 'Belum Punya Akun?',
              textValidate: 'Register',
            )
          ],
        ),
      ),
    );
  }
}
