import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:project_dicoding/theme/theme.dart';
import 'package:project_dicoding/views/widgets/button.dart';
import 'package:project_dicoding/views/widgets/customText.dart';
import 'package:project_dicoding/views/widgets/customTextField.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(
          top: 100,
        ),
        child: Column(
          children: <Widget>[
            Image.asset(
              'assets/icons/logoGuide.png',
            ),
            WhiteText(
              text: 'Register',
              styleForText: StyleForText(
                semiBold,
                24,
              ),
            ),
            const Gap(30),
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
                      16,
                    ),
                  ),
                  const Gap(4),
                  CustomTextField(
                    controller: _userNameController,
                    prefixIcon: const Icon(
                      Icons.person,
                      color: primaryColor,
                    ),
                    horizontal: 16,
                    vertikal: 0,
                    color: whiteColor,
                    filled: true,
                    hintText: 'Enter Your Name',
                    hintStyle: StyleForText(
                      regular,
                      12,
                    ),
                    radius: 12,
                  ),
                  const Gap(14),
                  WhiteText(
                    text: 'Email Address',
                    styleForText: StyleForText(
                      medium,
                      16,
                    ),
                  ),
                  const Gap(4),
                  CustomTextField(
                    controller: _emailController,
                    prefixIcon: const Icon(
                      Icons.email_outlined,
                      color: primaryColor,
                    ),
                    color: whiteColor,
                    filled: true,
                    horizontal: 16,
                    vertikal: 0,
                    hintText: 'Enter Your Email Address',
                    hintStyle: StyleForText(regular, 12),
                    radius: 12,
                  ),
                  const Gap(14),
                  WhiteText(
                    text: 'Password',
                    styleForText: StyleForText(
                      medium,
                      12,
                    ),
                  ),
                  const Gap(4),
                  CustomTextField(
                    controller: _passController,
                    obScure: true,
                    prefixIcon: const Icon(
                      Icons.key,
                      color: primaryColor,
                    ),
                    color: whiteColor,
                    filled: true,
                    horizontal: 16,
                    vertikal: 0,
                    hintText: 'Enter Your Password',
                    hintStyle: StyleForText(
                      regular,
                      12,
                    ),
                    radius: 12,
                  ),
                  const Gap(14),
                  CustomButton(
                    userNameController: _userNameController,
                    text: 'Daftar',
                  ),
                  const Gap(14),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 2,
                        width: 110,
                        color: greyColor,
                      ),
                      const Gap(22),
                      GreyText(
                        text: 'Atau',
                        styleForText: StyleForText(
                          medium,
                          12,
                        ),
                      ),
                      const Gap(22),
                      Container(
                        height: 2,
                        width: 110,
                        color: greyColor,
                      )
                    ],
                  ),
                  const Gap(14),
                  const GoogleButton(),
                ],
              ),
            ),
            const Spacer(),
            const RouteValidate(
              text: 'Sudah Punya Akun?',
              textValidate: 'Login',
            ),
          ],
        ),
      ),
    );
  }
}
