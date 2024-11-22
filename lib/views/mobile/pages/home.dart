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
            const Gap(60),
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
                // padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                  color: whiteColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 6,
                      offset: const Offset(6, 4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 6,
                              horizontal: 16,
                            ),
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
                          SizedBox(
                            width: 200,
                            child: BlackText(
                              text: item.name,
                              styleForText: StyleForText(
                                semiBold,
                                18,
                              ),
                            ),
                          ),
                          const Gap(2),
                          GreyText(
                            text: item.jobDesk,
                            styleForText: StyleForText(
                              semiBold,
                              12,
                            ),
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
