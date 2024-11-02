import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:project_dicoding/theme/theme.dart';
import 'package:project_dicoding/views/widgets/button.dart';
import 'package:project_dicoding/views/widgets/customText.dart';
import 'package:project_dicoding/views/widgets/customTextField.dart';

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
          top: 100,
        ),
        child: Column(
          children: <Widget>[
            Image.asset(
              'assets/icons/logoGuide.png',
            ),
            WhiteText(
              text: 'Login',
              styleForText: StyleForText(
                semiBold,
                24.0,
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
                  const Gap(14),
                  CustomButton(
                    userNameController: _userNameController,
                    text: 'Masuk',
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
                          12.0,
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
              text: 'Belum Punya Akun?',
              textValidate: 'Register',
            )
          ],
        ),
      ),
    );
  }
}
