import 'package:flutter/material.dart';
import 'package:project_dicoding/theme/theme.dart';
import 'package:project_dicoding/views/mobile/widgets/custom_text.dart';

class ProfileWidget extends StatelessWidget {
  final String username;
  final String email;
  final String tglGabung;
  const ProfileWidget({
    super.key,
    required this.username,
    required this.email,
    required this.tglGabung,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        // constraints: BoxConstraints(
        //   minWidth: 800,
        //   minHeight: 500,
        // ),
        width: 800,
        height: 500,
        decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              width: 2,
            )),
        child: Column(
          children: [
            BlackText(
              text: username,
              styleForText: StyleForText(
                bold,
                20,
              ),
            ),
            BlackText(
              text: email,
              styleForText: StyleForText(
                bold,
                20,
              ),
            ),
            BlackText(
              text: tglGabung,
              styleForText: StyleForText(
                bold,
                20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
