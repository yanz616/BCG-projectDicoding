// import 'package:flutter/material.dart';

// class TernaryContainerDemo extends StatefulWidget {
//   const TernaryContainerDemo({super.key});
//   @override
//   _TernaryContainerDemoState createState() => _TernaryContainerDemoState();
// }

// class _TernaryContainerDemoState extends State<TernaryContainerDemo> {
//   int selectedIndex = -1; // -1 berarti tidak ada tombol yang dipilih

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Ternary Operator Demo'),
//       ),
//       body: Column(
//         children: [
//           // Barisan tombol
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: List.generate(2, (index) {
//               return ElevatedButton(
//                 onPressed: () {
//                   setState(() {
//                     selectedIndex = index; // Perbarui tombol yang dipilih
//                   });
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor:
//                       selectedIndex == index ? Colors.black : Colors.white,
//                   foregroundColor:
//                       selectedIndex == index ? Colors.white : Colors.black,
//                 ),
//                 child: Text(
//                   index == 0
//                       ? 'button 1'
//                       : index == 1
//                           ? 'button 2'
//                           : 'button 3',
//                 ),
//               );
//             }),
//           ),
//           SizedBox(height: 20),
//           // Menampilkan container berdasarkan tombol yang dipilih
//           selectedIndex == 0
//               ? Container(
//                   margin: EdgeInsets.all(20),
//                   height: 100,
//                   color: Colors.red,
//                   child: Center(
//                     child: Text(
//                       'Container 1',
//                       style: TextStyle(color: Colors.white, fontSize: 18),
//                     ),
//                   ),
//                 )
//               : selectedIndex == 1
//                   ? Container(
//                       margin: EdgeInsets.all(20),
//                       height: 100,
//                       color: Colors.green,
//                       child: Center(
//                         child: Text(
//                           'Container 2',
//                           style: TextStyle(color: Colors.white, fontSize: 18),
//                         ),
//                       ),
//                     )
//                   : selectedIndex == 2
//                       ? Container(
//                           margin: EdgeInsets.all(20),
//                           height: 100,
//                           color: Colors.blue,
//                           child: Center(
//                             child: Text(
//                               'Container 3',
//                               style:
//                                   TextStyle(color: Colors.white, fontSize: 18),
//                             ),
//                           ),
//                         )
//                       : SizedBox
//                           .shrink(), // Tidak menampilkan apa pun jika tidak ada tombol yang dipilih
//         ],
//       ),
//     );
//   }
// }
