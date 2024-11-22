import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:project_dicoding/theme/theme.dart';
import 'package:project_dicoding/views/mobile/auth/sign_in.dart';
import 'package:project_dicoding/views/mobile/widgets/custom_text.dart';

class ProfilePage extends StatelessWidget {
  final String name;
  final String email;
  final String tgl;

  const ProfilePage({
    super.key,
    required this.name,
    required this.email,
    required this.tgl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 22,
        ),
        child: Column(
          children: [
            const Gap(16),
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: whiteGrey,
              ),
              child: Row(
                children: [
                  const Gap(6),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                    ),
                  ),
                  const Gap(90),
                  BlackText(
                    text: 'My Profile',
                    styleForText: StyleForText(
                      semiBold,
                      18,
                    ),
                  ),
                ],
              ),
            ),
            const Gap(40),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  8,
                ),
                color: whiteGrey,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 70,
                      child: Image(
                        image: AssetImage('assets/icons/Google.png'),
                      ),
                    ),
                    const Gap(20),
                    BlackText(
                      text: name,
                      styleForText: StyleForText(
                        semiBold,
                        18,
                      ),
                    ),
                    const Gap(4),
                    BlackText(
                      text: email,
                      styleForText: StyleForText(
                        medium,
                        12,
                      ),
                    ),
                    const Gap(52),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.person_add_alt_outlined,
                              size: 30,
                            ),
                            const Gap(16),
                            BlackText(
                              text: 'Bergabung Sejak',
                              styleForText: StyleForText(
                                medium,
                                12,
                              ),
                            ),
                          ],
                        ),
                        Text(tgl)
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignInPage(),
                          ),
                          (route) => false,
                        );
                      },
                      child: const Row(
                        children: [
                          Icon(
                            Icons.logout_outlined,
                          ),
                          Gap(16),
                          Text('Logout')
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
