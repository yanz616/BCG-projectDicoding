import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:project_dicoding/shared/shared_preferences.dart';
import 'package:project_dicoding/shared/snackbar.dart';
import 'package:project_dicoding/theme/theme.dart';
import 'package:project_dicoding/views/mobile/widgets/button.dart';
import 'package:project_dicoding/views/mobile/widgets/custom_text.dart';
import 'package:project_dicoding/views/mobile/widgets/custom_text_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _userNameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passController = TextEditingController();
  void register(
    BuildContext ctx,
    String nama,
    String email,
    String pass,
  ) async {
    if (nama.isEmpty && email.isEmpty && pass.isEmpty) {
      CustomSnackbar.showToast(ctx, 'Cannot be reach null');
    } else {
      if (nama.isNotEmpty && email.isNotEmpty && pass.isNotEmpty) {
        SharedPreUtils.saveName(nama);
        SharedPreUtils.saveEmail(email);
        SharedPreUtils.savePass(pass);
        SharedPreUtils.saveTanggalGabung(
            DateFormat('dd-MM-yyyy').format(DateTime.now()));

        CustomSnackbar.showToast(ctx, 'Register Succes!');

        _userNameController.clear();
        _emailController.clear();
        _passController.clear();
      } else {
        CustomSnackbar.showToast(ctx, 'You should make this form full');
      }
    }
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
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
                text: 'Register',
                styleForText: StyleForText(
                  semiBold,
                  24,
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
                      hintText: 'Enter Your Name',
                      hintStyle: StyleForText(
                        regular,
                        12,
                      ),
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
                      hintText: 'Enter Your Email Address',
                      hintStyle: StyleForText(regular, 12),
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
                      hintText: 'Enter Your Password',
                      hintStyle: StyleForText(
                        regular,
                        12,
                      ),
                    ),
                    const Gap(30),
                    Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: youngGreen,
                      ),
                      child: TextButton(
                        onPressed: () {
                          register(
                            context,
                            _userNameController.text,
                            _emailController.text,
                            _passController.text,
                          );
                        },
                        child: WhiteText(
                          text: 'register',
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
              // const Spacer(),
              const Gap(60),
              const RouteValidate(
                text: 'Sudah Punya Akun?',
                textValidate: 'Login',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
