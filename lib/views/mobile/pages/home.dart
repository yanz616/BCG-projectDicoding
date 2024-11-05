import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:project_dicoding/models/model.dart';
import 'package:project_dicoding/theme/theme.dart';
import 'package:project_dicoding/views/mobile/widgets/customText.dart';
import 'package:project_dicoding/views/mobile/widgets/customTextField.dart';

class Home extends StatelessWidget {
  final List<String> items = [
    'Lombok Timur',
    'Lombok Barat',
    'Lombok Tengah',
    'Lombok Utara',
    'Mataram',
  ];
  final String name;
  final CarausolItem? data;

  Home({
    super.key,
    required this.name,
    this.data,
  });

  // int _selectedIndex = 0;

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
                        backgroundColor: redColor,
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
                    hintText: 'Search Your Guide',
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
            SizedBox(
              height: 184,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 140.0,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  autoPlayInterval: const Duration(seconds: 10),
                ),
                items: [].map((item) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 6,
                        ),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 3,
                              blurRadius: 6,
                              offset: const Offset(3, 3),
                            ),
                          ],
                        ),
                        child: Text(
                          item.toString(),
                          style: whiteTextStyle.copyWith(
                            fontWeight: bold,
                            fontSize: 20,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),

            const Gap(10),
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Row(
            //       children: items.map((item) {
            //     return Padding(
            //       padding: EdgeInsets.only(
            //         left: item == 0 ? 10 : 20,
            //       ),
            //       child: HomeButton(
            //         color: primaryColor,
            //         onPressed: () {
            //           if (item == 'Lombok Timur' && item == true) {
            //             Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                 builder: (context) => const SignInPage(),
            //               ),
            //             );
            //           } else {
            //             SizedBox.shrink();
            //           }
            //         },
            //         child: Text(
            //           item,
            //           style: TextStyle(

            //           ),
            //         ),
            //       ),
            //     );
            //   }).toList()),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GreenText(
                    text: 'Popular Guide',
                    styleForText: StyleForText(
                      medium,
                      16,
                    ),
                  ),
                  Column(
                    children: items.map((item) {
                      return Padding(
                        padding: EdgeInsets.only(
                          top: item == item[0] ? 20 : 10,
                        ),
                        child: Container(
                          height: 150,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: whiteGrey,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: blackColor,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  )
                ],
              ),
            ),
            const Gap(20),
          ],
        ),
      ),
    );
  }
}
