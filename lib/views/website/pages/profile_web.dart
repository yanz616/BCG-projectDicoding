import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:project_dicoding/theme/theme.dart';
import 'package:project_dicoding/widgets/custom_text.dart';

class ProfileWeb extends StatelessWidget {
  final String username;
  final String email;
  final String tglGabung;
  const ProfileWeb({
    super.key,
    required this.username,
    required this.email,
    required this.tglGabung,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: 800,
        height: 500,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 250,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                    image: AssetImage(
                      'assets/images/profile-example.jpg',
                    ),
                    fit: BoxFit.cover),
              ),
            ),
            const Gap(20),
            SizedBox(
              width: 350,
              height: 300,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: whiteGrey),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: GreenText(
                        text: 'My Profile',
                        styleForText: StyleForText(medium, 12),
                      ),
                    ),
                  ),
                  const Gap(10),
                  BlackText(
                    text: username,
                    styleForText: StyleForText(
                      bold,
                      20,
                    ),
                  ),
                  const Gap(10),
                  BlackText(
                    text: email,
                    styleForText: StyleForText(
                      bold,
                      20,
                    ),
                  ),
                  const Gap(10),
                  Row(
                    children: [
                      BlackText(
                          text: 'Bergabung Sejak :',
                          styleForText: StyleForText(medium, 18)),
                      BlackText(
                        text: tglGabung,
                        styleForText: StyleForText(
                          medium,
                          18,
                        ),
                      ),
                    ],
                  ),
                  const Gap(10),
                  BlackText(
                    text: 'Description :',
                    styleForText: StyleForText(
                      bold,
                      20,
                    ),
                  ),
                  const Gap(10),
                  BlackText(
                      text:
                          'Lorem ipsum, atau ringkasnya lipsum, adalah teks standar yang ditempatkan untuk mendemostrasikan.',
                      styleForText: StyleForText(medium, 16)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
