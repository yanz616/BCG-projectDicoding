import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:project_dicoding/models/model.dart';
import 'package:project_dicoding/theme/theme.dart';
import 'package:project_dicoding/views/mobile/widgets/customText.dart';
import 'package:project_dicoding/views/mobile/widgets/customTextField.dart';

class Home extends StatelessWidget {
  final String name;
  const Home({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(60),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.blue,
                      ),
                      const Gap(6),
                      BlackText(
                        text: name,
                        styleForText: StyleForText(
                          semiBold,
                          16,
                        ),
                      ),
                    ],
                  ),
                  const Gap(14),
                  CustomTextField(
                    prefixIcon: const Icon(
                      Icons.search,
                      color: primaryColor,
                    ),
                    horizontal: 16,
                    vertikal: 14,
                    color: whiteGrey,
                    filled: true,
                    hintText: 'Search Your Bussines Consultation',
                    hintStyle: StyleForText(
                      regular,
                      12,
                    ),
                    radius: 12,
                  )
                ],
              ),
            ),
            const Gap(14),
            const BannerSlider(),
            // SizedBox(
            //   height: 120,
            //   child: Container(
            //     height: 80,
            //     width: 100,
            //     decoration: BoxDecoration(color: primaryColor, boxShadow: [
            //       BoxShadow(
            //         color: Colors.black.withOpacity(0.3),
            //         spreadRadius: 3,
            //         blurRadius: 2,
            //         offset: const Offset(3, 9),
            //       ),
            //     ]),
            //   ),
            // ),
            const Gap(20),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 22,
              ),
              child: Column(
                children: MyData.data_2.map(
                  (item) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                      ),
                      child: Container(
                        height: 130,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                          color: whiteColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 3,
                              blurRadius: 4,
                              offset: const Offset(6, 4),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BannerSlider extends StatelessWidget {
  const BannerSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: List.generate(
        MyData.data.length,
        (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 20,
            ),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 3,
                    blurRadius: 6,
                    offset: const Offset(6, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      top: 24,
                    ),
                    child: Image.asset(
                      MyData.data[index].image,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 46,
                      left: 10,
                    ),
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 230),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          WhiteText(
                            text: MyData.data[index].word,
                            styleForText: StyleForText(
                              semiBold,
                              18,
                            ),
                          ),
                          const Gap(8),
                          WhiteText(
                            text: MyData.data[index].name,
                            styleForText: StyleForText(
                              medium,
                              14,
                            ),
                          ),
                          WhiteText(
                            text: MyData.data[index].jobDesk,
                            styleForText: StyleForText(
                              regular,
                              10,
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              bottom: 4,
                            ),
                            child: DScriptText(
                              text: 'Bussiness Consultation Group',
                              styleForText: StyleForText(
                                medium,
                                12,
                              ),
                              color: orangeColor,
                            ),
                          ),
                          //   Padding(
                          //     padding: const EdgeInsets.only(
                          //       left: 20,
                          //     ),
                          //     child:
                          //     ),
                          //   ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      options: CarouselOptions(
        autoPlay: true,
        viewportFraction: 1,
        enlargeCenterPage: true,
        autoPlayInterval: const Duration(
          seconds: 5,
        ),
      ),
    );
  }
}
