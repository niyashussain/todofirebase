
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class Create extends StatefulWidget {
//   const Create({Key? key}) : super(key: key);

//   @override
//   State<Create> createState() => _CreateState();
// }

// class _CreateState extends State<Create> {
//   TextEditingController taskName = TextEditingController();
//   TextEditingController selectedDateController = TextEditingController();
//   List<String> myTasks = [];

//   @override
//   void initState() {
//     super.initState();
//     getTaskDetails();
//   }

//   void getTaskDetails() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       myTasks = prefs.getStringList('my_tasks_key') ?? [];
//     });
//   }

//   Future<void> addTask(BuildContext context) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     String task = taskName.text;
//     String date = selectedDateController.text; // Get selected date
//     String combinedEntry = "$task | $date"; // Combine task and date

//     myTasks.add(combinedEntry);

//     setState(() {
//       prefs.setStringList('my_tasks_key', myTasks).then((value) {
//         Navigator.pop(context);
//       });
//       taskName.clear();
//       selectedDateController.clear();
//     });
//   }

//   saveTasks() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setStringList('my_tasks_key', myTasks);
//     print(myTasks);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       floatingActionButton: Container(
//         height: 50,
//         margin: const EdgeInsets.all(10),
//         child: ElevatedButton(
//           onPressed: () {
//             addTask(context);
//           },
//           style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
//           child: const Center(
//             child: Text(
//               'Create',
//               style: TextStyle(color: Colors.white),
//             ),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.only(top: 18.0),
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Padding(
//                     padding: EdgeInsets.only(left: 150.0),
//                     child: Text(
//                       'New Task',
//                       style:
//                           TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(right: 20.0),
//                     child: IconButton(
//                       icon: const Icon(Icons.clear),
//                       onPressed: () {
//                         Navigator.of(context).pop();
//                       },
//                     ),
//                   )
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 15,
//                   vertical: 30,
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(18.0),
//                   child: TextField(
//                     controller: taskName,
//                     decoration: const InputDecoration(
//                       border: UnderlineInputBorder(),
//                       hintText: 'What are you Planning?',
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30),
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 1.0, left: 18, right: 18),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: TextFormField(
//                           controller: selectedDateController, // Set controller
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(),
//                             hintText: 'Select date',
//                           ),
//                         ),
//                       ),
//                       IconButton(
//                         icon: Icon(Icons.calendar_today),
//                         onPressed: () {
//                           _selectDate(context);
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 30),
//                 child: Padding(
//                   padding: EdgeInsets.only(top: 1.0, left: 18, right: 18),
//                   child: TextField(
//                     decoration: InputDecoration(
//                       border: UnderlineInputBorder(), hintText: 'Category',
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   DateTime selectedDate = DateTime.now();

//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: selectedDate,
//       firstDate: DateTime(2015, 8),
//       lastDate: DateTime(2101),
//     );
//     if (picked != null && picked != selectedDate)
//       setState(() {
//         selectedDate = picked;
//         selectedDateController.text = "${selectedDate.toLocal()}".split(' ')[0]; // Set selected date to text field
//       });
//   }
// }
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Create extends StatefulWidget {
  const Create({Key? key}) : super(key: key);

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  TextEditingController taskName = TextEditingController();
  TextEditingController selectedDateController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  List<String> myTasks = [];
  List<String> categories = ['Music', 'Travel', 'Style', 'Home'];
  String? selectedCategory;

  @override
  void initState() {
    super.initState();
    getTaskDetails();
  }

  void getTaskDetails() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      myTasks = prefs.getStringList('my_tasks_key') ?? [];
    });
  }

  Future<void> addTask(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String task = taskName.text;
    String date = selectedDateController.text;
    String category = categoryController.text;

    String combinedEntry = "$task | $date | $category";

    myTasks.add(combinedEntry);

    setState(() {
      prefs.setStringList('my_tasks_key', myTasks).then((value) {
        Navigator.pop(context);
      });
      taskName.clear();
      selectedDateController.clear();
      categoryController.clear();
    });
  }

  saveTasks() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('my_tasks_key', myTasks);
    print(myTasks);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 50,
        margin: const EdgeInsets.all(10),
        child: ElevatedButton(
          onPressed: () {
            addTask(context);
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
          child: const Center(
            child: Text(
              'Create',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 150.0),
                    child: Text(
                      'New Task',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextField(
                    controller: taskName,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: 'What are you Planning?',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30),
                child: Padding(
                  padding: const EdgeInsets.only(top: 1.0, left: 18, right: 18),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: selectedDateController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Select date',
                          ),
                          onTap: () {
                            _selectDate(context);
                          },
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.calendar_today),
                        onPressed: () {
                          _selectDate(context);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30),
                child: Padding(
                  padding: const EdgeInsets.only(top: 1.0, left: 18, right: 18),
                  child: DropdownButtonFormField<String>(
                    value: selectedCategory,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Category',
                    ),
                    items: categories.map((String category) {
                      return DropdownMenuItem<String>(
                        value: category,
                        child: Text(category),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedCategory = newValue!;
                        categoryController.text = selectedCategory!;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        selectedDateController.text = "${selectedDate.toLocal()}".split(' ')[0];
      });
    }
  }
}
