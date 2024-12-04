import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
// import 'package:project_dicoding/shared/date_time.dart';
import 'package:project_dicoding/shared/shared_preferences.dart';
import 'package:project_dicoding/shared/snackbar.dart';
import 'package:project_dicoding/theme/theme.dart';
import 'package:project_dicoding/views/mobile/pages/home.dart';
import 'package:project_dicoding/views/mobile/widgets/button.dart';
import 'package:project_dicoding/views/mobile/widgets/custom_text.dart';
import 'package:project_dicoding/views/mobile/widgets/custom_text_field.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  void login(BuildContext ctx, String email, String pass) async {
    if (email.isEmpty && pass.isEmpty) {
      CustomSnackbar.showToast(ctx, 'Inputan masih kosong!');
    } else {
      String? pEmail = await SharedPreUtils.readEmail();
      String? pPassword = await SharedPreUtils.readPass();
      if (email == pEmail && pass == pPassword) {
        // ignore: use_build_context_synchronously
        CustomSnackbar.showToast(ctx, 'Login Berhasil');
        Navigator.pushReplacement(
          // ignore: use_build_context_synchronously
          ctx,
          MaterialPageRoute(
            builder: (context) => const Home(),
          ),
        );
      } else {
        // ignore: use_build_context_synchronously
        CustomSnackbar.showToast(ctx, 'Login Gagal!');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Gap(120),
            Image.asset(
              'assets/icons/BCG-logo.png',
              width: 80,
            ),
            DScriptText(
              text: 'Bussines Consultation Group',
              styleForText: StyleForText(
                medium,
                12,
              ),
              color: orangeColor,
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
                    text: 'Email',
                    styleForText: StyleForText(
                      medium,
                      16.0,
                    ),
                  ),
                  const Gap(4),
                  CustomTextField(
                    controller: emailController,
                    prefixIcon: const Icon(
                      Icons.email_outlined,
                      color: primaryColor,
                    ),
                    hintText: 'Enter Your Email',
                    hintStyle: StyleForText(
                      regular,
                      12.0,
                    ),
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
                    controller: passController,
                    obScure: true,
                    prefixIcon: const Icon(
                      Icons.key,
                      color: primaryColor,
                    ),
                    hintText: 'Enter Your Password',
                    hintStyle: StyleForText(
                      regular,
                      12.0,
                    ),
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
                        login(
                          context,
                          emailController.text,
                          passController.text,
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
            const Gap(100),
            const RouteValidate(
              text: 'Belum Punya Akun?',
              textValidate: 'Register',
            ),
          ],
        ),
      ),
    );
  }
}
