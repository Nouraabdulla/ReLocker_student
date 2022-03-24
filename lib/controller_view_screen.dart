import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:relocker_sa/Announcements.dart';
import 'package:relocker_sa/bloc/states/auth_states.dart';
import 'package:relocker_sa/closed_lock.dart';
import 'package:relocker_sa/login_screen.dart';
import 'package:relocker_sa/start_screen.dart';
import 'package:relocker_sa/support_view.dart';
import 'package:relocker_sa/support_support.dart';

import 'bloc/cubit/auth_cubit.dart';
import 'home_view.dart';

class ControllerViewScreen extends StatefulWidget {
  const ControllerViewScreen({Key? key}) : super(key: key);

  @override
  State<ControllerViewScreen> createState() => _ControllerViewScreenState();
}

String haslocker = "";

class _ControllerViewScreenState extends State<ControllerViewScreen> {
  int currentIndex = 2;
  List _screen = [closed_lock(), HomeView()];

  // dohavelocker() async {
  //   final DocumentSnapshot doc = await FirebaseFirestore.instance
  //       .collection('Users')
  //       .doc("${FirebaseAuth.instance.currentUser!.uid}")
  //       .get();
  //   haslocker = doc['reservedlocker'];
  //   // print("hiiii" + haslocker);
  // }
Map<String, dynamic> userData = {};
    getUserData() {
       FirebaseFirestore.instance
        .collection("Announcements")
        // .where("state", isEqualTo: 'inprogress')
        .get()
        .then((value) {
      List<DocumentSnapshot<Map<String, dynamic>>> list = value.docs;
      list.forEach((element) {
        setState(() {
          userData = element.data()!;
        });
      });
  
    });
  }

  @override
  void initState() {
    getUserData();
    // getUser();
    super.initState();
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFd3f3e6),
      body: currentIndex > 0 && haslocker != ""
          ? _screen[currentIndex - 1]
          : _screen[1],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(25),
          topLeft: Radius.circular(25),
        ),
        clipBehavior: Clip.hardEdge,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            if(userData.length!=0)...[
            BottomNavigationBarItem(
              icon: IconButton(
                icon: Image.asset(
                  'assets/images/moreRed.png',
                  fit: BoxFit.cover,
                  // color: Colors.grey[800],
                ),
                iconSize: 38.0,
                onPressed: () {
                  setState(() {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(height: 10),
                              Container(
                                height: 2,
                                width: 40,
                                color: Colors.grey[300],
                              ),
                              const SizedBox(height: 70),
                              // const Divider(
                              //   color: Colors.grey,
                              //   height: 2,
                              //   thickness: 2,
                              // ),
                              // GestureDetector(
                              //   child: const ListTile(
                              //     title: Text('My account'),
                              //     leading: Icon(Icons.person),
                              //   ),
                              //   onTap: () {
                              //     Navigator.of(context).push(MaterialPageRoute(
                              //         builder: (context) => profile()));
                              //   },
                              // ),
                              const Divider(
                                color: Colors.grey,
                                height: 2,
                                thickness: 2,
                              ),
                              GestureDetector(
                                child: const ListTile(
                                  title: Text('Technical support'),
                                  leading: Icon(Icons.headset_outlined),
                                ),
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => support_support()));
                                },
                              ),
                              const Divider(
                                color: Colors.grey,
                                height: 2,
                                thickness: 2,
                              ),
                             
                              GestureDetector(
                                child:  ListTile(
                                  title: Text('Personal announcements'),
                                  leading: SizedBox(
                               height: 35.0,
                               width: 35.0, // fixed width and height
                               child: Image.asset( 
                                 'assets/images/announcementRed.png',
                                  fit: BoxFit.cover,)
                                  )
                                ),
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Announcements()));
                                },
                              ),
                              const Divider(
                                color: Colors.grey,
                                height: 2,
                                thickness: 2,
                              ),
                              const SizedBox(height: 40),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 1.5,
                                height: MediaQuery.of(context).size.width / 8,
                                child: BlocConsumer<AuthCubit, AuthStates>(
                                  listener: (context, state) {},
                                  builder: (context, state) => ElevatedButton(
                                    child: const Text(
                                      'LOG OUT',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.red,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        )),
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Container(
                                              clipBehavior: Clip.hardEdge,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)),
                                              child: AlertDialog(
                                                title: Text(
                                                  "Are you sure you want to logout?",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                                actions: [
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            5,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            9,
                                                    child: ElevatedButton(
                                                      child: const Text(
                                                        'Yes',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        primary:
                                                            Color(0xFF9AD6BD),
                                                        shape:
                                                            const StadiumBorder(),
                                                      ),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                        AuthCubit.get(context)
                                                            .signOut();

                                                        Navigator.of(context)
                                                            .pushReplacement(
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            StartScreen()));
                                                      },
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            5,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            9,
                                                    child: ElevatedButton(
                                                      child: const Text(
                                                        'No',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        primary:
                                                            Color(0xFF9AD6BD),
                                                        shape:
                                                            const StadiumBorder(),
                                                      ),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          });
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(height: 40),
                            ],
                          ),
                        );
                      },
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      ),
                      clipBehavior: Clip.hardEdge,
                    );
                  });
                },
                
              ),
              label: '',
            ),
            ]else ...[
          BottomNavigationBarItem(
              icon: IconButton(
                icon: Image.asset(
                  'assets/images/more.png',
                  fit: BoxFit.cover,
                  // color: Colors.grey[800],
                ),
                iconSize: 38.0,
                onPressed: () {
                  setState(() {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(height: 10),
                              Container(
                                height: 2,
                                width: 40,
                                color: Colors.grey[300],
                              ),
                              const SizedBox(height: 70),
                              // const Divider(
                              //   color: Colors.grey,
                              //   height: 2,
                              //   thickness: 2,
                              // ),
                              // GestureDetector(
                              //   child: const ListTile(
                              //     title: Text('My account'),
                              //     leading: Icon(Icons.person),
                              //   ),
                              //   onTap: () {
                              //     Navigator.of(context).push(MaterialPageRoute(
                              //         builder: (context) => profile()));
                              //   },
                              // ),
                              const Divider(
                                color: Colors.grey,
                                height: 2,
                                thickness: 2,
                              ),
                              GestureDetector(
                                child: const ListTile(
                                  title: Text('Technical support'),
                                  leading: Icon(Icons.headset_outlined),
                                ),
                                onTap: () {
                              
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => support_support()));
                                },
                              ),
                              const Divider(
                                color: Colors.grey,
                                height: 2,
                                thickness: 2,
                              ),
                              GestureDetector(
                                child:  ListTile(
                                  title: Text('Personal announcements'),
                                  leading:SizedBox(
                               height: 35.0,
                               width: 35.0, // fixed width and height
                               child: Image.asset( 
                                 'assets/images/Announcement.png',
                                  fit: BoxFit.cover,
                                  ),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Announcements()));
                                },
                              ),
                              const Divider(
                                color: Colors.grey,
                                height: 2,
                                thickness: 2,
                              ),
                              const SizedBox(height: 40),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 1.5,
                                height: MediaQuery.of(context).size.width / 8,
                                child: BlocConsumer<AuthCubit, AuthStates>(
                                  listener: (context, state) {},
                                  builder: (context, state) => ElevatedButton(
                                    child: const Text(
                                      'LOG OUT',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.red,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        )),
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Container(
                                              clipBehavior: Clip.hardEdge,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)),
                                              child: AlertDialog(
                                                title: Text(
                                                  "Are you sure you want to logout?",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                                actions: [
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            5,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            9,
                                                    child: ElevatedButton(
                                                      child: const Text(
                                                        'Yes',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        primary:
                                                            Color(0xFF9AD6BD),
                                                        shape:
                                                            const StadiumBorder(),
                                                      ),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                        AuthCubit.get(context)
                                                            .signOut();

                                                        Navigator.of(context)
                                                            .pushReplacement(
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            StartScreen()));
                                                      },
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            5,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            9,
                                                    child: ElevatedButton(
                                                      child: const Text(
                                                        'No',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        primary:
                                                            Color(0xFF9AD6BD),
                                                        shape:
                                                            const StadiumBorder(),
                                                      ),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          });
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(height: 40),
                            ],
                          ),
                        );
                      },
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      ),
                      clipBehavior: Clip.hardEdge,
                    );
                  });
                },
                
              ),
              label: '',
            ),
            ],
            BottomNavigationBarItem(
              icon: SizedBox(
                height: 35,
                width: 35,
                child: Image.asset(
                  'assets/images/key.png',
                  fit: BoxFit.cover,
                  color: currentIndex == 1 && haslocker != ""
                      ? Colors.blue
                      : Colors.grey[800],
                  alignment: Alignment.center,
                ),
              ),
              label: '',
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
              ),
              label: '',
            ),
          ],
          selectedItemColor: Colors.blue,
          currentIndex: currentIndex,
          onTap: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
