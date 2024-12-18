// import 'package:flutter/material.dart';

// class ListDetailPage extends StatefulWidget {
//   @override
//   _ListDetailPageState createState() => _ListDetailPageState();
// }

// class _ListDetailPageState extends State<ListDetailPage> {
//   final List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];
//   int selectedIndex = 0;
//   String? selectedItem;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('List and Detail'),
//         leading: selectedIndex == 1
//             ? IconButton(
//                 icon: Icon(Icons.arrow_back),
//                 onPressed: () {
//                   // Kembali ke tampilan daftar
//                   setState(() {
//                     selectedIndex = 0;
//                   });
//                 },
//               )
//             : null,
//       ),
//       body:  Column(
//               children: [
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: itemPerPage,
//                     itemBuilder: (context, index) {
//                       int itemIndex = starIndex + index;
//                       if (itemIndex >= MyData.data_2.length) {
//                         return const SizedBox();
//                       }
//                       final item = MyData.data_2[itemIndex];
//                       return Container(
//                         width: double.infinity,
//                         margin: const EdgeInsets.all(8),
//                         //   padding: EdgeInsets.symmetric(vertical: 10),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(
//                             20,
//                           ),
//                           color: whiteColor,
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black.withOpacity(0.3),
//                               spreadRadius: 3,
//                               blurRadius: 6,
//                               offset: const Offset(6, 4),
//                             ),
//                           ],
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 14,
//                             vertical: 20,
//                           ),
//                           child: Row(
//                             children: [
//                               Container(
//                                 width: 100,
//                                 height: 156,
//                                 decoration: BoxDecoration(
//                                   color: greyColor,
//                                   borderRadius: BorderRadius.circular(4),
//                                   image: DecorationImage(
//                                     fit: BoxFit.cover,
//                                     image: AssetImage(
//                                       item.image,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               const Gap(16),
//                               Expanded(
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Container(
//                                       padding: const EdgeInsets.symmetric(
//                                         vertical: 6,
//                                         horizontal: 10,
//                                       ),
//                                       margin: const EdgeInsets.only(right: 50),
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(8),
//                                         color: whiteGrey,
//                                         border: Border.all(
//                                           color: const Color(0xffCDE1DF),
//                                           width: 1,
//                                         ),
//                                       ),
//                                       child: Center(
//                                         child: DarkGreenText(
//                                           text: 'Prefosional Consultan',
//                                           styleForText: StyleForText(
//                                             semiBold,
//                                             10,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     const Gap(6),
//                                     AutoSizeBlackText(
//                                       text: item.name,
//                                       fontWeight: semiBold,
//                                       maxLines: 1,
//                                       minSize: 10,
//                                       maxSize: 16,
//                                     ),
//                                     const Gap(2),
//                                     AutoSizeGreyText(
//                                       text: item.jobDesk,
//                                       fontWeight: medium,
//                                       maxLine: 1,
//                                       minSize: 8,
//                                       maxSize: 14,
//                                     ),
//                                     const Gap(10),
//                                     InkWell(
//                                       onTap: () {

//                                       },
//                                       child: Container(
//                                         width: 210,
//                                         padding: const EdgeInsets.symmetric(
//                                           vertical: 10,
//                                         ),
//                                         decoration: BoxDecoration(
//                                           borderRadius:
//                                               BorderRadius.circular(8),
//                                           color: primaryColor,
//                                         ),
//                                         child: Center(
//                                           child: WhiteText(
//                                             text: 'Detail',
//                                             styleForText: StyleForText(
//                                               bold,
//                                               14,
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     if (starIndex > 0)
//                       TextButton(
//                         onPressed: showPrevoisItems,
//                         style: const ButtonStyle(
//                           backgroundColor: WidgetStatePropertyAll(primaryColor),
//                         ),
//                         child: WhiteText(
//                           text: 'Previous',
//                           styleForText: StyleForText(
//                             medium,
//                             14,
//                           ),
//                         ),
//                       ),
//                     const Gap(10),
//                     if (starIndex + itemPerPage < MyData.data_2.length)
//                       TextButton(
//                         onPressed: showNextItems,
//                         style: const ButtonStyle(
//                           backgroundColor: WidgetStatePropertyAll(primaryColor),
//                         ),
//                         child: WhiteText(
//                           text: 'Next',
//                           styleForText: StyleForText(
//                             medium,
//                             14,
//                           ),
//                         ),
//                       ),
//                   ],
//                 )
//               ],
//             )
//     );
//   }
// }
