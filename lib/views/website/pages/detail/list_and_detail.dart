import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:project_dicoding/models/model.dart';
import 'package:project_dicoding/theme/theme.dart';
import 'package:project_dicoding/views/mobile/widgets/custom_text.dart';
import 'package:widget_zoom/widget_zoom.dart';

class ConsultantList extends StatefulWidget {
  const ConsultantList({super.key});

  @override
  State<ConsultantList> createState() => _ConsultantListState();
}

class _ConsultantListState extends State<ConsultantList> {
  int starIndex = 0;
  final int itemPerPage = 2;
  int selectedIndex = 0;
  ItemData? selectedItem;

  void showNextItems() {
    setState(() {
      if (starIndex + itemPerPage < MyData.data_2.length) {
        starIndex += itemPerPage;
      }
    });
  }

  void showPrevoisItems() {
    setState(() {
      if (starIndex - itemPerPage >= 0) {
        starIndex -= itemPerPage;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: selectedIndex == 0
          // Tampilkan List
          ? Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: itemPerPage,
                    itemBuilder: (context, index) {
                      int itemIndex = starIndex + index;
                      if (itemIndex >= MyData.data_2.length) {
                        return const SizedBox();
                      }
                      final item = MyData.data_2[itemIndex];
                      return Container(
                        width: double.infinity,
                        margin: const EdgeInsets.all(8),
                        //   padding: EdgeInsets.symmetric(vertical: 10),
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
                                        setState(() {
                                          selectedIndex = 1;
                                          selectedItem = item;
                                        });
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 10,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
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
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (starIndex > 0)
                      TextButton(
                        onPressed: showPrevoisItems,
                        style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(primaryColor),
                        ),
                        child: WhiteText(
                          text: 'Previous',
                          styleForText: StyleForText(
                            medium,
                            14,
                          ),
                        ),
                      ),
                    const Gap(10),
                    if (starIndex + itemPerPage < MyData.data_2.length)
                      TextButton(
                        onPressed: showNextItems,
                        style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(primaryColor),
                        ),
                        child: WhiteText(
                          text: 'Next',
                          styleForText: StyleForText(
                            medium,
                            14,
                          ),
                        ),
                      ),
                  ],
                )
              ],
            )
          : selectedItem != null
              ? Column(
                  //ini Detail
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
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
                              setState(() {
                                selectedIndex = 0;
                              });
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              size: 20,
                            ),
                          ),
                          const Gap(80),
                          BlackText(
                            text: 'Profile Consultan',
                            styleForText: StyleForText(
                              bold,
                              14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap(10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: 80,
                          height: 120,
                          decoration: BoxDecoration(
                            color: greyColor,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Image.asset(
                            selectedItem!.image,
                          ),
                        ),
                        const Gap(10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BlackText(
                              text: selectedItem!.name,
                              styleForText: StyleForText(
                                semiBold,
                                18,
                              ),
                            ),
                            GreyText(
                              text: selectedItem!.jobDesk,
                              styleForText: StyleForText(
                                semiBold,
                                16,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const Gap(12),
                    BlackText(
                      text: 'About',
                      styleForText: StyleForText(
                        semiBold,
                        18,
                      ),
                    ),
                    const Gap(6),
                    AutoSizeGreyText(
                      text: selectedItem!.desk,
                      maxLine: 5,
                      minSize: 8,
                      maxSize: 14,
                      fontWeight: medium,
                    ),
                    const Gap(12),
                    BlackText(
                      text: 'Company',
                      styleForText: StyleForText(
                        semiBold,
                        18,
                      ),
                    ),
                    const Gap(6),
                    Row(
                      children: [
                        WidgetZoom(
                          heroAnimationTag: 'tag',
                          zoomWidget: Container(
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                image: AssetImage(
                                  selectedItem!.company.img,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const Gap(10),
                        Expanded(
                          child: AutoSizeGreyText(
                            text: selectedItem!.company.detail,
                            maxLine: 4,
                            minSize: 10,
                            maxSize: 14,
                            fontWeight: medium,
                          ),
                        ),
                      ],
                    ),
                    // const Gap(12),
                    const Spacer(),
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
                            semiBold,
                            16,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : const SizedBox.shrink(),
    );
  }
}
