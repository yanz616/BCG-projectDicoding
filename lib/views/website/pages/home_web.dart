import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:project_dicoding/shared/shared_preferences.dart';
import 'package:project_dicoding/theme/theme.dart';
import 'package:project_dicoding/views/website/pages/detail/list_and_detail.dart';
import 'package:project_dicoding/views/website/pages/detail/middle_list_and_detail.dart';
import 'package:project_dicoding/views/website/pages/profile_web.dart';

class HomeWeb extends StatefulWidget {
  const HomeWeb({
    super.key,
  });

  @override
  State<HomeWeb> createState() => _HomeWebState();
}

String userName = '';
String email = '';
String tglGabung = '';

class _HomeWebState extends State<HomeWeb> {
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

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: youngGreen,
              ),
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  2,
                  (index) {
                    // final isActive = selectedIndex ==
                    //     index; --> untuk memeriksa apakah tombol aktif
                    return InkWell(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: CircleAvatar(
                          backgroundColor: selectedIndex == index
                              ? primaryColor
                              : whiteColor,
                          child: Icon(
                            index == 0 ? Icons.home : Icons.person,
                            color: selectedIndex == index
                                ? whiteColor
                                : primaryColor,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const Gap(20),
            selectedIndex == 0
                ? Flexible(
                    child: Container(
                      width: 1000,
                      height: 500,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          double width = constraints.maxWidth;
                          print(width);
                          if (width <= 600) {
                            return const ConsultantList();
                          } else {
                            return const MiddelConsultantList();
                          }
                        },
                      ),
                    ),
                  )
                : ProfileWidget(
                    username: userName,
                    email: email,
                    tglGabung: tglGabung,
                  ),
          ],
        ),
      ),
    );
  }
}
