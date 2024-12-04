import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:project_dicoding/shared/shared_preferences.dart';
import 'package:project_dicoding/shared/snackbar.dart';
import 'package:project_dicoding/theme/theme.dart';
import 'package:project_dicoding/views/mobile/pages/home.dart';
// import 'package:project_dicoding/views/mobile/widgets/button.dart';
import 'package:project_dicoding/views/mobile/widgets/custom_text.dart';
import 'package:project_dicoding/views/mobile/widgets/custom_text_field.dart';

class WebSignInPage extends StatefulWidget {
  const WebSignInPage({super.key});

  @override
  State<WebSignInPage> createState() => _WebSignInPageState();
}

class _WebSignInPageState extends State<WebSignInPage> {
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
        // print(pEmail);
        // print(pPassword);
        // ignore: use_build_context_synchronously
        CustomSnackbar.showToast(ctx, 'Login Gagal!');
      }
    }
  }

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Gap(20),
            Image.asset(
              'assets/icons/BCG-logo.png',
              width: 80,
            ),
            const Gap(4),
            DScriptText(
              text: 'Bussines Consultation Group',
              styleForText: StyleForText(
                medium,
                12,
              ),
              color: orangeColor,
            ),
            const Gap(80),
            Center(
              child: Container(
                color: Colors.transparent,
                constraints: const BoxConstraints(
                  maxWidth: 400,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 90),
                        padding: const EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 6,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: orangeColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: WhiteText(
                                text: 'Login',
                                styleForText: StyleForText(
                                  medium,
                                  16,
                                ),
                              ),
                            ),
                            const Gap(6),
                            TextButton(
                              onPressed: () {},
                              child: WhiteText(
                                text: 'Register',
                                styleForText: StyleForText(
                                  medium,
                                  16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Gap(24),
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
              ),
            ),
            const Gap(60),
          ],
        ),
      ),
    );
  }
}
