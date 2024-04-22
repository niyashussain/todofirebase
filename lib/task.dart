// import 'package:flutter/material.dart';
// import 'package:todo/home.dart';
// import 'package:todo/lastpage.dart';

// List items = [];
// class Task extends StatelessWidget {
//   const Task({super.key});



//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: Padding(
//         padding: const EdgeInsets.only(bottom: 30.0, right: 20),
//         child: FloatingActionButton(
//           backgroundColor: Colors.blue,
//           onPressed: () {
//             Navigator.push(
//                 context, MaterialPageRoute(builder: (context) => Create()));
//           },
//           child: Icon(
//             Icons.add,
//             color: Colors.white,
//           ),
//         ),
//       ),
//       body: Column(children: [
//         Container(
//           height: MediaQuery.of(context).size.height * 0.4,
//             width: MediaQuery.of(context).size.width,
//           decoration: const BoxDecoration(
//               borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(25),
//                   bottomRight: Radius.circular(25)),
//               color: Colors.blue),
//           child:  Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(left: 18.0, top: 20),
//                     child: IconButton(icon: const Icon(Icons.arrow_back_ios),onPressed: (){Navigator.push(
//                 context, MaterialPageRoute(builder: (context) => Home()));},  ),
//                     // child: Icon(
//                     //   Icons.arrow_back_ios,
//                     //   size: 30,
//                     // ),
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.only(right: 18.0, top: 20),
//                     child: Icon(
//                       Icons.more_vert,
//                       size: 30,
//                     ),
//                   )
//                 ],
//               ),
//               const Padding(
//                 padding: EdgeInsets.only(top: 90, right: 210),
//                 child: Icon(
//                   Icons.ballot_outlined,
//                   color: Colors.white,
//                   size: 40,
//                 ),
//               ),
//               const Padding(
//                 padding: EdgeInsets.only(top: 30, right: 210),
//                 child: Text(
//                   'All',
//                   style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
//                 ),
//               )
//             ],
//           ),
//         ),
//         ListView.builder(
//           itemCount: items.length,
//           itemBuilder: ( (context, index) {
//             return ListTile(
//               title: Text('Item $index'),
//             );
//           }),)
//         // const Column(
//         //   children: [
//         //     Row(
//         //       children: [
//         //         Padding(
//         //           padding: EdgeInsets.only(top: 18.0, left: 25),
//         //           child: Text(
//         //             'Late',
//         //             style: TextStyle(fontSize: 15),
//         //           ),
//         //         )
//         //       ],
//         //     ),
//         //     Row(
//         //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         //       children: [
//         //         Padding(
//         //           padding: EdgeInsets.only(top: 18.0, left: 25),
//         //           child: Text(
//         //             'Call Max',
//         //             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//         //           ),
//         //         ),
//         //         Padding(
//         //           padding: EdgeInsets.only(right: 18.0),
//         //           child: Icon(Icons.check_box_outline_blank, size: 25),
//         //         ),
//         //       ],
//         //     ),
//         //     Row(
//         //       children: [
//         //         Padding(
//         //           padding: EdgeInsets.only(top: 8.0, left: 25),
//         //           child: Text('time'),
//         //         )
//         //       ],
//         //     ),
//         //     Row(
//         //       children: [
//         //         Padding(
//         //           padding: EdgeInsets.only(top: 18.0, left: 25),
//         //           child: Text(
//         //             'Today',
//         //             style: TextStyle(fontSize: 15),
//         //           ),
//         //         )
//         //       ],
//         //     ),
//         //     Row(
//         //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         //       children: [
//         //         Padding(
//         //           padding: EdgeInsets.only(top: 18.0, left: 25),
//         //           child: Text(
//         //             'Practice Piano',
//         //             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//         //           ),
//         //         ),
//         //         Padding(
//         //           padding: EdgeInsets.only(right: 18.0),
//         //           child: Icon(Icons.check_box_outline_blank, size: 25),
//         //         ),
//         //       ],
//         //     ),
//         //     Row(
//         //       children: [
//         //         Padding(
//         //           padding: EdgeInsets.only(top: 8.0, left: 25),
//         //           child: Text('time'),
//         //         )
//         //       ],
//         //     ),
//         //     Row(
//         //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         //       children: [
//         //         Padding(
//         //           padding: EdgeInsets.only(top: 18, left: 25),
//         //           child: Text('Learn Spanish',
//         //               style:
//         //                   TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//         //         ),
//         //         Padding(
//         //           padding: EdgeInsets.only(right: 18.0),
//         //           child: Icon(
//         //             Icons.check_box_outline_blank,
//         //             size: 25,
//         //           ),
//         //         )
//         //       ],
//         //     ),
//         //     Row(
//         //       children: [
//         //         Padding(
//         //           padding: EdgeInsets.only(top: 8.0, left: 25),
//         //           child: Text('time'),
//         //         )
//         //       ],
//         //     )
//         //   ],
//         // )
//       ]),
//     );
//   }
// }
