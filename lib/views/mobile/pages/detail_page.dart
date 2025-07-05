import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:project_dicoding/theme/theme.dart';
import 'package:project_dicoding/widgets/custom_text.dart';
import 'package:widget_zoom/widget_zoom.dart';
// import 'package:project_dicoding/views/mobile/widgets/button.dart';

class DetailPage extends StatelessWidget {
  final String name;
  final String jobDesk;
  final String desk;
  final String image;
  final String companyImg;
  final String companyDetail;

  const DetailPage({
    super.key,
    required this.name,
    required this.jobDesk,
    required this.desk,
    required this.image,
    required this.companyImg,
    required this.companyDetail,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 22,
          ),
          child: Detail(
              image: image,
              name: name,
              jobDesk: jobDesk,
              desk: desk,
              companyImg: companyImg,
              companyDetail: companyDetail),
        ),
      ),
    );
  }
}

class Detail extends StatelessWidget {
  const Detail({
    super.key,
    required this.image,
    required this.name,
    required this.jobDesk,
    required this.desk,
    required this.companyImg,
    required this.companyDetail,
  });

  final String image;
  final String name;
  final String jobDesk;
  final String desk;
  final String companyImg;
  final String companyDetail;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
              const Gap(60),
              BlackText(
                text: 'Profile Consultan',
                styleForText: StyleForText(
                  semiBold,
                  18,
                ),
              ),
            ],
          ),
        ),
        const Gap(40),
        Stack(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: greyColor,
                  image: DecorationImage(
                    image: AssetImage(
                      image,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 90),
                      spreadRadius: 1,
                      blurRadius: 6,
                      offset: const Offset(-1, -1),
                    ),
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 90),
                      spreadRadius: 1,
                      blurRadius: 6,
                      offset: const Offset(1, 1),
                    ),
                  ]),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 270,
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 36,
                  ),
                  decoration: BoxDecoration(
                    color: whiteGrey,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: primaryColor,
                      width: 1,
                    ),
                  ),
                  child: Column(
                    children: [
                      BlackText(
                        text: name,
                        styleForText: StyleForText(
                          bold,
                          18,
                        ),
                      ),
                      GreyText(
                        text: jobDesk,
                        styleForText: StyleForText(
                          regular,
                          14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        const Gap(22),
        BlackText(
          text: 'About',
          styleForText: StyleForText(
            bold,
            18,
          ),
        ),
        const Gap(4),
        GreyText(
          text: desk,
          styleForText: StyleForText(
            regular,
            16,
          ),
        ),
        const Gap(10),
        BlackText(
          text: 'Company',
          styleForText: StyleForText(
            bold,
            18,
          ),
        ),
        const Gap(4),
        WidgetZoom(
          heroAnimationTag: 'tag',
          zoomWidget: Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage(
                  companyImg,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const Gap(4),
        GreyText(
          text: companyDetail,
          styleForText: StyleForText(
            regular,
            16,
          ),
        ),
        const Gap(20),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: WhiteText(
              text: 'Contact Here',
              styleForText: StyleForText(
                bold,
                24,
              ),
            ),
          ),
        ),
        const Gap(20),
      ],
    );
  }
}
