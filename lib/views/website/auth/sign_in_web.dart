import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:project_dicoding/shared/shared_preferences.dart';
import 'package:project_dicoding/shared/snackbar.dart';
import 'package:project_dicoding/theme/theme.dart';

import 'package:project_dicoding/views/mobile/widgets/custom_text.dart';
import 'package:project_dicoding/views/mobile/widgets/custom_text_field.dart';
import 'package:project_dicoding/views/website/pages/home_web.dart';

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
            builder: (context) => const HomeWeb(),
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

        CustomSnackbar.showToast(ctx, 'Berhasil simpan!,');
      } else {
        CustomSnackbar.showToast(ctx, 'You should make this form full');
      }
    }
  }

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final TextEditingController userNameController = TextEditingController();
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
            const Gap(60),
            Center(
                child: Container(
              color: Colors.black12,
              constraints: const BoxConstraints(
                maxWidth: 400,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 20,
                ),
                child: Column(
                  children: [
                    Container(
                      constraints: const BoxConstraints(maxWidth: 180),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: secondColor,
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: List.generate(2, (index) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  selectedIndex =
                                      index; // Perbarui tombol yang dipilih
                                });
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: selectedIndex == index
                                    ? primaryColor
                                    : Colors.white,
                                foregroundColor: selectedIndex == index
                                    ? Colors.white
                                    : primaryColor,
                              ),
                              child: Text(
                                index == 0 ? ' Login  ' : 'Register',
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    selectedIndex == 0
                        ? Column(
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
                          )
                        : Column(
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
                                controller: userNameController,
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
                                controller: emailController,
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
                                controller: passController,
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
                                  color: secondColor,
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    register(
                                      context,
                                      userNameController.text,
                                      emailController.text,
                                      passController.text,
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
                  ],
                ),
              ),
            )),
            const Gap(60),
          ],
        ),
      ),
    );
  }
}
