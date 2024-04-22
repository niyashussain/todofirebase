

import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/home.dart';
import 'package:todo/createpage.dart';

class Hometask extends StatelessWidget {
  const Hometask({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 30.0, right: 20),
        child: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: ()async {
              // final SharedPreferences prefs =
              //               await SharedPreferences.getInstance();
              //               prefs.setString('saveData', '');
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Create()),
            );
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  Home()),
                          );
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
                const SizedBox(height: 20,),
                const Row(children: [Padding(
                  padding: EdgeInsets.only(top: 90, right: 21,left:10),
                  child: Icon(
                    Icons.home,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
                ],),
                const SizedBox(height: 20,),
                const Row(children: [ Text(
                  ' Hometask',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                )],)
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
                itemCount:
                    3, // Provide the number of items in your list
                itemBuilder: (BuildContext context, int index) {
                  // Your itemBuilder function
                  // Example:
                  return ListTile(
                    title: Text('Item $index'),
                  );
                },
              ),
            ),
          // Expanded(
          //   child: ListView(
          //     children: const [
          //       _TaskItem(title: 'Late', taskName: 'Call Max', time: 'time'),
          //       _TaskItem(title: 'Today', taskName: 'Practice Piano', time: 'time'),
          //       _TaskItem(title: '', taskName: 'Learn Spanish', time: 'time'),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}

