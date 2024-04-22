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

//   Future<void> deleteTask(int index) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       customItems.removeAt(index);
//       prefs.setStringList('my_tasks_key', customItems.toList());
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: Padding(
//         padding: const EdgeInsets.only(bottom:8.0,right: 8),
//         child: FloatingActionButton(
//           backgroundColor: Colors.blue,
//           onPressed: () {
//             Navigator.push(
//                 context, MaterialPageRoute(builder: (context) => const Create()));
//           },
//           child: const Icon(
//             Icons.add,
//             color: Colors.white,
//           ),
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
//                           Navigator.push(context,
//                               MaterialPageRoute(builder: (context) => Home()));
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
//                 // ignore: avoid_print
//                 print(customItems);
//                 print('aaaaaaaaaaaa');
//                 return Dismissible(
//                   key: Key(customItems[index]),
//                   onDismissed: (direction) {
//                     deleteTask(index);
//                   },
//                   child: InkWell(
//                     onTap: () {
//                       editeFunction(context, customItems[index], index);
//                     },
//                     child: ListTile(
//                       title: Text(customItems[index]),
//                       trailing: IconButton(
//                         icon: const Icon(Icons.delete),
//                         onPressed: () {
//                           deleteTask(index);
//                         },
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   editeFunction(BuildContext context, String? editText, int index) {
//     TextEditingController newTaskController =
//         TextEditingController(text: editText ?? '');
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text("Edit Task"),
//           content: TextField(
//             controller: newTaskController,
//             decoration: InputDecoration(hintText: "Enter task"),
//           ),
//           actions: [
//             ElevatedButton(
//               onPressed: () async {
//                 String newTask = newTaskController.text;
//                 if (newTask.isNotEmpty) {
//                   setState(() {
//                     customItems[index] = newTask;
//                     SharedPreferences.getInstance().then((prefs) {
//                       prefs.setStringList('my_tasks_key', customItems.toList());
//                     });
//                   });
//                 } else {
//                   // If the new task is empty, consider it as deletion
//                   setState(() {
//                     customItems.removeAt(index);
//                     SharedPreferences.getInstance().then((prefs) {
//                       prefs.setStringList('my_tasks_key', customItems.toList());
//                     });
//                   });
//                 }
//                 Navigator.of(context).pop();
//               },
//               child: Text("Save"),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text("Cancel"),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/home.dart';
import 'package:todo/createpage.dart';

class Work extends StatefulWidget {
  const Work({Key? key}) : super(key: key);

  @override
  State<Work> createState() => _WorkState();
}

class _WorkState extends State<Work> {
  List<Map<String, String>> customItems = [];

  @override
  void initState() {
    super.initState();
    getTaskDetails();
  }

  Future<void> getTaskDetails() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      customItems = (prefs.getStringList('my_tasks_key') ?? []).map((task) {
        final taskDetails = task.split('|');
        return {
          'name': taskDetails[0],
          'date': taskDetails[1],
        };
      }).toList();
    });
  }

  Future<void> addTask(String newName, String newDate) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      customItems.add({'name': newName, 'date': newDate});
      prefs.setStringList('my_tasks_key', customItems.map((task) => "${task['name']}|${task['date']}").toList());
    });
  }

  Future<void> deleteTask(int index) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      customItems.removeAt(index);
      prefs.setStringList('my_tasks_key', customItems.map((task) => "${task['name']}|${task['date']}").toList());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom:8.0,right: 8),
        child: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const Create()));
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
              color: Colors.blue,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0, top: 20),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Home()));
                        },
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 18.0, top: 20),
                      child: Icon(
                        Icons.more_vert,
                        size: 30,
                      ),
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 90, right: 210),
                  child: Icon(
                    Icons.card_travel,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 30, right: 210),
                  child: Text(
                    'All',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: customItems.length,
              itemBuilder: (BuildContext context, int index) {
                // ignore: avoid_print
                print(customItems);
                print('aaaaaaaaaaaa');
                return Dismissible(
                  key: Key(customItems[index]['name']!),
                  onDismissed: (direction) {
                    deleteTask(index);
                  },
                
                  child: InkWell(
                    onTap: () {
                      editFunction(context, customItems[index]['name'], customItems[index]['date'], index);
                    },
                    child: ListTile(
                      title: Text(customItems[index]['name']!),
                      subtitle: Text(customItems[index]['date']!),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          deleteTask(index);
                        },
                        
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

editFunction(BuildContext context, String? editName, String? editDate, int index) {
  TextEditingController newNameController = TextEditingController(text: editName ?? '');
  TextEditingController newDateController = TextEditingController(text: editDate ?? '');
  TimeOfDay selectedTime = TimeOfDay.now();

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Edit Task"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: newNameController,
              decoration: InputDecoration(hintText: "Enter task"),
            ),
            SizedBox(height: 10),
            InkWell(
              onTap: () async {
                final DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2015, 8),
                  lastDate: DateTime(2101),
                );
                if (pickedDate != null) {
                  newDateController.text = "${pickedDate.day.toString()}-${pickedDate.month.toString()}-${pickedDate.year.toString()},";

                  final TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: selectedTime,
                  );
                  if (pickedTime != null) {
                    selectedTime = pickedTime;
                    newDateController.text += '${selectedTime.format(context)}';
                  }
                }
              },
              child: AbsorbPointer(
                child: TextField(
                  controller: newDateController,
                  readOnly: true,
                  decoration: InputDecoration(hintText: "Select date and time"),
                ),
              ),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () async {
              String newName = newNameController.text;
              String newDate = newDateController.text;

              if (newName.isNotEmpty && newDate.isNotEmpty) {
                setState(() {
                  customItems[index]['name'] = newName;
                  customItems[index]['date'] = newDate;
                  SharedPreferences.getInstance().then((prefs) {
                    prefs.setStringList('my_tasks_key', customItems.map((task) => "${task['name']}|${task['date']}").toList());
                  });
                });
              } else {
                // If the new task is empty, consider it as deletion
                setState(() {
                  customItems.removeAt(index);
                  SharedPreferences.getInstance().then((prefs) {
                    prefs.setStringList('my_tasks_key', customItems.map((task) => "${task['name']}|${task['date']}").toList());
                  });
                });
              }
              Navigator.of(context).pop();
            },
            child: Text("Save"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Cancel"),
          ),
        ],
      );
    },
  );
}
}
