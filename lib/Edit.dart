// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:todo/home.dart';
// import 'package:todo/createpage.dart';

// class Work extends StatefulWidget {
//   const Work({Key? key}) : super(key: key);

//   @override
//   State<Work> createState() => _WorkState();
// }

// class _WorkState extends State<Work> {
  
//   List<String> customItems = [];

//   @override
//   void initState() {
//     super.initState();  
//     getTaskDetails();
//   }

//   Future<void> getTaskDetails() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       customItems = prefs.getStringList('my_tasks_key')?.toList() ?? [];
//     });
//   }

//   Future<void> addTask(String newTask) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       customItems.add(newTask);
//       prefs.setStringList('my_tasks_key', customItems.toList());
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.blue,
//         onPressed: () {
//           Navigator.push(context,
//               MaterialPageRoute(builder: (context) => Create()));
//         },
//         child: const Icon(
//           Icons.add,
//           color: Colors.white,
//         ),
//       ),
//       body: Column(
//         children: [
//           Container(
//             height: MediaQuery.of(context).size.height * 0.4,
//             width: MediaQuery.of(context).size.width,
//             decoration: const BoxDecoration(
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(25),
//                 bottomRight: Radius.circular(25),
//               ),
//               color: Colors.blue,
//             ),
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(left: 18.0, top: 20),
//                       child: IconButton(
//                         icon: const Icon(Icons.arrow_back_ios),
//                         onPressed: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => Home()));
//                         },
//                       ),
//                     ),
//                     const Padding(
//                       padding: EdgeInsets.only(right: 18.0, top: 20),
//                       child: Icon(
//                         Icons.more_vert,
//                         size: 30,
//                       ),
//                     )
//                   ],
//                 ),
//                 const Padding(
//                   padding: EdgeInsets.only(top: 90, right: 210),
//                   child: Icon(
//                     Icons.card_travel,
//                     color: Colors.white,
//                     size: 40,
//                   ),
//                 ),
//                 const Padding(
//                   padding: EdgeInsets.only(top: 30, right: 210),
//                   child: Text(
//                     'All',
//                     style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
//                   ),
//                 )
//               ],
//             ),
//           ),
//           Expanded(

//             child: ListView.builder(
//               itemCount: customItems.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return ListTile(
//                   title: GestureDetector(
//                     onTap: () {
//                       Navigator.push(context, MaterialPageRoute(builder:(context) => Create(),));
//                     },
//                     child: Text(customItems[index],)),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
