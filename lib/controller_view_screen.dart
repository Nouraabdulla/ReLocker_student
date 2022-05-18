import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:relocker_sa/Announcements.dart';
import 'package:relocker_sa/bloc/states/auth_states.dart';
import 'package:relocker_sa/closed_lock.dart';
import 'package:relocker_sa/login_screen.dart';
import 'package:relocker_sa/profile.dart';
import 'package:relocker_sa/recommendations.dart';
import 'package:relocker_sa/start_screen.dart';
import 'package:relocker_sa/support_view.dart';
import 'package:relocker_sa/support_support.dart';

import 'bloc/cubit/auth_cubit.dart';
import 'firstsemester.dart';
import 'home_view.dart';

class ControllerViewScreen extends StatefulWidget {
  const ControllerViewScreen({Key? key}) : super(key: key);

  @override
  State<ControllerViewScreen> createState() => _ControllerViewScreenState();
}

String haslocker = "";
bool dohave = false;

class _ControllerViewScreenState extends State<ControllerViewScreen> {
  int currentIndex = 2;
  List _screen = [closed_lock(), HomeView()];

  dohavelocker() async {
    final DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('Users')
        .doc("${FirebaseAuth.instance.currentUser!.uid}")
        .get();
    setState(() {
      haslocker = doc['reservedlocker'];
    });
    if (haslocker != "") {
      dohave = true;
    } else {
      dohave = false;
    }
    // print("hiiii" + haslocker);
  }

  String lockerreserv = '';
  User user = FirebaseAuth.instance.currentUser!;
  Map<String, dynamic> userData2 = {};
  getUserData2() {
    FirebaseFirestore.instance
        .collection("Reservation")
        // .where("Owner", isEqualTo: user.email)
        .get()
        .then((value) {
      List<DocumentSnapshot<Map<String, dynamic>>> list = value.docs;
      list.forEach((element) {
        setState(() {
          userData2 = element.data()!;
          lockerreserv = userData2['locker_name'];
          // print(lockerreserv);
        });
      });
    });
  }

  String lockername1 = '';
  Map<String, dynamic> userData = {};
  getUserData() {
    FirebaseFirestore.instance
        .collection("Announcements")
        .where("lockername", isEqualTo: userData2['locker_name'])
        .get()
        .then((value) {
      List<DocumentSnapshot<Map<String, dynamic>>> list = value.docs;
      list.forEach((element) {
        setState(() {
          userData = element.data()!;
          // lockername1=userData['lockername'];
          print(userData);
        });
      });
    });
  }

  @override
  void initState() {
    dohavelocker();
    getUserData();
    getUserData2();
    // getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    dohavelocker();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: currentIndex > 0 &&
              haslocker !=
                  "" //check if the user has locker to go to the lock page
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
            if (lockername1 == lockerreserv) ...[
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
                        backgroundColor:
                            const Color.fromARGB(255, 255, 255, 255),
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
                                const Divider(
                                  color: Colors.grey,
                                  height: 2,
                                  thickness: 2,
                                ),
                                GestureDetector(
                                  child: const ListTile(
                                    title: Text('My account'),
                                    leading: Icon(Icons.person),
                                  ),
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => profile()));
                                  },
                                ),
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
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                support_support()));
                                  },
                                ),
                                const Divider(
                                  color: Colors.grey,
                                  height: 2,
                                  thickness: 2,
                                ),
                                GestureDetector(
                                  child: ListTile(
                                      title: Text('Personal announcements'),
                                      leading: SizedBox(
                                          height: 35.0,
                                          width: 35.0, // fixed width and height
                                          child: Image.asset(
                                            'assets/images/announcementRed.png',
                                            fit: BoxFit.cover,
                                          ))),
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Announcements()));
                                  },
                                ),
                                const Divider(
                                  color: Colors.grey,
                                  height: 2,
                                  thickness: 2,
                                ),
                                const SizedBox(height: 40),
                                Row(
                                  children: [
                                    GestureDetector(
                                      child: SizedBox(
                                          height: 60,
                                          width: 120, // fixed width and height
                                          child: Image.asset(
                                            'assets/images/ksulogo.png',
                                            fit: BoxFit.cover,
                                            alignment: Alignment.centerRight,
                                          )),
                                      onTap: () {},
                                    ),
                                    SizedBox(
                                      width: 160,
                                    ),
                                    GestureDetector(
                                      child: SizedBox(
                                          height: 60,
                                          width: 60, // fixed width and height
                                          child: Image.asset(
                                            'assets/images/logoutb.png',
                                            fit: BoxFit.cover,
                                            alignment: Alignment.centerRight,
                                          )),
                                      onTap: () {
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
                                  ],
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
            ] else ...[
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
                                const Divider(
                                  color: Colors.grey,
                                  height: 2,
                                  thickness: 2,
                                ),
                                GestureDetector(
                                  child: const ListTile(
                                    title: Text('My account'),
                                    leading: Icon(Icons.person),
                                  ),
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => profile()));
                                  },
                                ),
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
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                support_support()));
                                  },
                                ),
                                const Divider(
                                  color: Colors.grey,
                                  height: 2,
                                  thickness: 2,
                                ),
                                GestureDetector(
                                  child: ListTile(
                                    title: Text('Personal announcements'),
                                    leading: SizedBox(
                                      height: 35.0,
                                      width: 35.0, // fixed width and height
                                      child: Image.asset(
                                        'assets/images/Announcement.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Announcements()));
                                  },
                                ),
                                const Divider(
                                  color: Colors.grey,
                                  height: 2,
                                  thickness: 2,
                                ),
                                const SizedBox(height: 40),
                                Row(
                                  children: [
                                    GestureDetector(
                                      child: SizedBox(
                                          height: 60,
                                          width: 120, // fixed width and height
                                          child: Image.asset(
                                            'assets/images/ksulogo.png',
                                            fit: BoxFit.cover,
                                            alignment: Alignment.centerRight,
                                          )),
                                      onTap: () {},
                                    ),
                                    SizedBox(
                                      width: 160,
                                    ),
                                    GestureDetector(
                                      child: SizedBox(
                                          height: 60,
                                          width: 60, // fixed width and height
                                          child: Image.asset(
                                            'assets/images/logoutb.png',
                                            fit: BoxFit.cover,
                                            alignment: Alignment.centerRight,
                                          )),
                                      onTap: () {
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
                                  ],
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
                child: dohave
                    ? Image.asset(
                        'assets/images/key.png',
                        fit: BoxFit.cover,
                        color: currentIndex == 1 && haslocker != ""
                            ? Colors.blue
                            : Colors.grey[800],
                        alignment: Alignment.center,
                      )
                    : Image.asset(
                        'assets/images/key.png',
                        fit: BoxFit.cover,
                        color: currentIndex == 1 && haslocker != ""
                            ? Color.fromARGB(255, 162, 162, 162)
                            : Color.fromARGB(255, 162, 162, 162),
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
            print("object");
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
