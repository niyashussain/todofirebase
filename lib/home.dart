import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/go.dart';
import 'package:todo/createpage.dart';
import 'package:todo/music.dart';
import 'package:todo/style.dart';
// import 'package:todo/task.dart';
import 'package:todo/travel.dart';
import 'package:todo/All.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController taskName = TextEditingController();

  String? abcd;

  void getdata() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // print('h');
    setState(() {
      abcd = prefs.getString('saveData');
    });
    print(abcd);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: EdgeInsets.only(
          bottom:
              MediaQuery.of(context).size.height * 0.03, // 5% of screen height
          right: MediaQuery.of(context).size.width * 0.03, // 4% of screen width
        ),
        child: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Create()));
            // Navigator.push
            //   context,
            //   MaterialPageRoute(builder: (context) =>  Create()),
            // );
          },
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.02,
              left: MediaQuery.of(context).size.width * 0.04,
            ),
            child: const Icon(
              Icons.menu,
              color: Colors.black,
              size: 50,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18.0),
            child: Text(
              '   Lists',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                // Expanded(
                //   child: Padding(
                //     padding: const EdgeInsets.only(left: 18.0, top: 30),
                //     child: Container(
                //       decoration: const BoxDecoration(
                //         boxShadow: [
                //           BoxShadow(
                //             color: Color.fromARGB(255, 221, 217, 217),
                //             spreadRadius: 1,
                //             blurRadius: 5,
                //             blurStyle: BlurStyle.outer,
                //           ),
                //         ],
                //       ),
                //       height: 170,
                //       child: InkWell(
                //         onTap: () {
                //           // Navigator.push(
                //           //   context,
                //           //   MaterialPageRoute(builder: (context) => const Task()),
                //           // );
                //         },
                //         child: const Column(
                //           children: [
                //             Padding(
                //               padding: EdgeInsets.only(top: 10.0),
                //               child: Icon(
                //                 Icons.ballot_rounded,
                //                 size: 50,
                //                 color: Color.fromARGB(255, 99, 161, 192),
                //               ),
                //             ),
                //             Padding(
                //               padding: EdgeInsets.only(top: 18.0),
                //               child: Text(
                //                 'All',
                //                 style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                //               ),
                //             ),

                //           ],
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 221, 217, 217),
                            spreadRadius: 1,
                            blurRadius: 5,
                            blurStyle: BlurStyle.outer,
                          ),
                        ],
                      ),
                      height: 120,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Work()),
                          );
                        },
                        child: const Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 5.0),
                              child: Icon(
                                Icons.card_travel,
                                size: 35,
                                color: Color.fromARGB(255, 99, 161, 192),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10.0),
                              child: Text(
                                'All',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 18.0, right: 18.0, bottom: 50),
                    child: Container(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 221, 217, 217),
                            spreadRadius: 1,
                            blurRadius: 5,
                            blurStyle: BlurStyle.outer,
                          ),
                        ],
                      ),
                      height: 120,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Music()),
                          );
                        },
                        child: const Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 10.0, bottom: 10),
                              child: Icon(
                                Icons.music_note,
                                size: 50,
                                color: Color.fromARGB(255, 99, 161, 192),
                              ),
                            ),
                            Text(
                              'Music',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 18.0, right: 18.0, bottom: 50),
                    child: Container(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 221, 217, 217),
                            spreadRadius: 1,
                            blurRadius: 5,
                            blurStyle: BlurStyle.outer,
                          ),
                        ],
                      ),
                      height: 120,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Travel()),
                          );
                        },
                        child: const Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 10.0, bottom: 10),
                              child: Icon(
                                Icons.travel_explore_rounded,
                                size: 50,
                                color: Color.fromARGB(255, 99, 161, 192),
                              ),
                            ),
                            Text(
                              'Travel',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 18.0, right: 18.0, bottom: 100),
                    child: Container(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 221, 217, 217),
                            spreadRadius: 1,
                            blurRadius: 5,
                            blurStyle: BlurStyle.outer,
                          ),
                        ],
                      ),
                      height: 120,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Style()),
                          );
                        },
                        child: const Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 10.0),
                              child: Icon(
                                Icons.book,
                                size: 50,
                                color: Color.fromARGB(255, 99, 161, 192),
                              ),
                            ),
                            Text(
                              'Style',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 18.0, right: 18.0, bottom: 100),
                    child: Container(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 221, 217, 217),
                            spreadRadius: 1,
                            blurRadius: 5,
                            blurStyle: BlurStyle.outer,
                          ),
                        ],
                      ),
                      height: 120,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Hometask()),
                          );
                        },
                        child: const Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 10.0),
                              child: Icon(
                                Icons.home,
                                size: 50,
                                color: Color.fromARGB(255, 99, 161, 192),
                              ),
                            ),
                            Text(
                              'Home',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
