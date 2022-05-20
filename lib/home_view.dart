import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:relocker_sa/calc_pay_page.dart';
import 'package:relocker_sa/closed_lock.dart';
import 'package:relocker_sa/locker_type.dart';
import 'package:relocker_sa/renewpage.dart';
import 'bloc/cubit/auth_cubit.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String haslocker = "";

  dohavelocker() async {
    final DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('Users')
        .doc("${FirebaseAuth.instance.currentUser!.uid}")
        .get();
    setState(() {
      haslocker = doc['reservedlocker'];
    });

    // print("hiiii" + haslocker);
  }

  @override
  void initState() {
    dohavelocker();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFd3f3e6),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/homebackground.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height / 2.7),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    'Save your\nbelongings\nby\nreserving a\nlocker',
                    style: TextStyle(
                        fontSize: 26,
                        color: Color(0xFF213569),
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(height: 90),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      height: MediaQuery.of(context).size.width / 8,
                      child: ElevatedButton(
                        child: const Text(
                          'Reserve a locker',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 18,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: const StadiumBorder(),
                        ),
                        onPressed: () {
                          if (haslocker == "") {
                            Navigator.of(context).push(MaterialPageRoute(
                                //     // builder: (context) => closed_lock()));
                                builder: (context) => locker_type()));
                          } else {
                            const snackBar = SnackBar(
                              content: Text(
                                  'you can not reserve more than one locker'),
                            );
// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
