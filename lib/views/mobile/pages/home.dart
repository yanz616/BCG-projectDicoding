import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:project_dicoding/models/model.dart';
import 'package:project_dicoding/shared/shared_preferences.dart';
import 'package:project_dicoding/theme/theme.dart';
import 'package:project_dicoding/views/mobile/pages/detail_page.dart';
import 'package:project_dicoding/views/mobile/pages/profile_page.dart';
import 'package:project_dicoding/views/mobile/widgets/custom_text.dart';
import 'package:project_dicoding/views/mobile/widgets/custom_text_field.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

String userName = '';
String email = '';
String tglGabung = '';

class _HomeState extends State<Home> {
  void getUser() async {
    String? getName = await SharedPreUtils.readName();
    String? getEmail = await SharedPreUtils.readEmail();
    String? getTglGabung = await SharedPreUtils.readTanggalGabung();
    setState(() {
      userName = getName!;
      email = getEmail!;
      tglGabung = getTglGabung!;
    });
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(20),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfilePage(
                            name: userName,
                            email: email,
                            tgl: tglGabung,
                          ),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.blue,
                        ),
                        const Gap(6),
                        BlackText(
                          text: userName,
                          styleForText: StyleForText(
                            semiBold,
                            16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(14),
                  CustomTextField(
                    prefixIcon: const Icon(
                      Icons.search,
                      color: primaryColor,
                    ),
                    hintText: 'Search Your Bussines Consultation',
                    hintStyle: StyleForText(
                      regular,
                      12,
                    ),
                  )
                ],
              ),
            ),
            const Gap(14),
            const BannerSlider(),
            const Gap(10),
            Padding(
              padding: const EdgeInsets.only(
                left: 22,
              ),
              child: GreenText(
                text: 'Chose Your Bussines Consultan',
                styleForText: StyleForText(
                  medium,
                  16,
                ),
              ),
            ),
            const Gap(4),
            const DaftarConsultan(),
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
              horizontal: 16,
              vertical: 20,
            ),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(90),
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
                      left: 14,
                      top: 24,
                    ),
                    child: Image.asset(
                      MyData.data[index].image,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 40,
                      left: 10,
                    ),
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 180),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeWhiteText(
                            text: MyData.data[index].word,
                            fontWeight: semiBold,
                            maxSize: 20,
                            minSize: 14,
                            maxLines: 2,
                          ),
                          const Gap(8),
                          AutoSizeWhiteText(
                            text: MyData.data[index].name,
                            fontWeight: medium,
                            maxSize: 14,
                            maxLines: 2,
                            minSize: 10,
                          ),
                          AutoSizeWhiteText(
                            text: MyData.data[index].jobDesk,
                            fontWeight: regular,
                            maxSize: 14,
                            maxLines: 1,
                            minSize: 10,
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
                                MediaQuery.sizeOf(context).width * 0.03,
                              ),
                              color: orangeColor,
                            ),
                          ),
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
        // autoPlay: true,
        viewportFraction: 1,
        enlargeCenterPage: true,
        aspectRatio: 8.6 / 5.5,
        autoPlayInterval: const Duration(
          seconds: 3,
        ),
      ),
    );
  }
}

class DaftarConsultan extends StatelessWidget {
  const DaftarConsultan({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                  color: whiteColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(90),
                      spreadRadius: 3,
                      blurRadius: 6,
                      offset: const Offset(6, 4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 20,
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        height: 156,
                        decoration: BoxDecoration(
                          color: greyColor,
                          borderRadius: BorderRadius.circular(4),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              item.image,
                            ),
                          ),
                        ),
                      ),
                      const Gap(16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 6,
                                horizontal: 10,
                              ),
                              margin: const EdgeInsets.only(right: 50),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: whiteGrey,
                                border: Border.all(
                                  color: const Color(0xffCDE1DF),
                                  width: 1,
                                ),
                              ),
                              child: Center(
                                child: DarkGreenText(
                                  text: 'Prefosional Consultan',
                                  styleForText: StyleForText(
                                    semiBold,
                                    10,
                                  ),
                                ),
                              ),
                            ),
                            const Gap(6),
                            AutoSizeBlackText(
                              text: item.name,
                              fontWeight: semiBold,
                              maxLines: 1,
                              minSize: 10,
                              maxSize: 16,
                            ),
                            const Gap(2),
                            AutoSizeGreyText(
                              text: item.jobDesk,
                              fontWeight: medium,
                              maxLine: 1,
                              minSize: 8,
                              maxSize: 14,
                            ),
                            const Gap(10),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailPage(
                                      name: item.name,
                                      jobDesk: item.jobDesk,
                                      desk: item.desk,
                                      image: item.image,
                                      companyImg: item.company.img,
                                      companyDetail: item.company.detail,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                width: 210,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: primaryColor,
                                ),
                                child: Center(
                                  child: WhiteText(
                                    text: 'Detail',
                                    styleForText: StyleForText(
                                      bold,
                                      14,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
