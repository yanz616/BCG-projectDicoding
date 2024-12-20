import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:project_dicoding/models/model.dart';
import 'package:project_dicoding/theme/theme.dart';
import 'package:project_dicoding/views/mobile/widgets/custom_text.dart';
import 'package:widget_zoom/widget_zoom.dart';

class MiddelConsultantList extends StatefulWidget {
  const MiddelConsultantList({super.key});

  @override
  State<MiddelConsultantList> createState() => _MiddelConsultantListState();
}

class _MiddelConsultantListState extends State<MiddelConsultantList> {
  ItemData? selectedItem;
  int selectedIndex = 0;
  int startIndex = 0;
  final int itemsPerPage = 2;

  void showNextItems() {
    setState(() {
      if (startIndex + itemsPerPage < MyData.data_2.length) {
        startIndex += itemsPerPage;
      }
    });
  }

  void showPreviousItems() {
    setState(() {
      if (startIndex - itemsPerPage >= 0) {
        startIndex -= itemsPerPage;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: itemsPerPage,
                  itemBuilder: (context, index) {
                    int itemIndex = startIndex + index;
                    if (itemIndex >= MyData.data_2.length) {
                      return const SizedBox();
                    }
                    final item = MyData.data_2[itemIndex];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                      ),
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: whiteColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withAlpha(40),
                              spreadRadius: 3,
                              blurRadius: 4,
                              offset: const Offset(6, 4),
                            ),
                            BoxShadow(
                              color: Colors.black.withAlpha(40),
                              spreadRadius: 3,
                              blurRadius: 4,
                              offset: const Offset(-1, -1),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 20),
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
                                    image: AssetImage(item.image),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
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
                                      minSize: 8,
                                      maxSize: 20,
                                    ),
                                    const Gap(2),
                                    AutoSizeGreyText(
                                      text: item.jobDesk,
                                      fontWeight: medium,
                                      maxLine: 1,
                                      minSize: 8,
                                      maxSize: 20,
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
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (startIndex > 0)
                    TextButton(
                      onPressed: showPreviousItems,
                      style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(primaryColor),
                      ),
                      child: const Text(
                        'Previous',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  const SizedBox(width: 10),
                  if (startIndex + itemsPerPage < MyData.data_2.length)
                    TextButton(
                      onPressed: showNextItems,
                      style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(primaryColor),
                      ),
                      child: const Text(
                        'Next',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
        Container(
          height: double.infinity,
          width: 2,
          color: greyColor,
        ),
        Flexible(
          child: selectedItem != null
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
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
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AutoSizeBlackText(
                                  text: selectedItem!.name,
                                  maxLines: 1,
                                  maxSize: 14,
                                  minSize: 10,
                                  fontWeight: semiBold,
                                ),
                                AutoSizeGreyText(
                                  text: selectedItem!.jobDesk,
                                  maxLine: 1,
                                  maxSize: 14,
                                  minSize: 10,
                                  fontWeight: semiBold,
                                ),
                              ],
                            ),
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
                              20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : const Center(
                  child: Text(
                    'Select Item For Detail',
                  ),
                ),
        )
      ],
    );
  }
}
