import 'dart:math';
import 'package:adobe_xd/pinned.dart';
import 'package:adobe_xd/adobe_xd.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_auth/email_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:relocker_sa/lockerset1_fg.dart';
import 'package:relocker_sa/opened_lock.dart';
import 'package:shared_preferences/shared_preferences.dart';

class closed_lock extends StatefulWidget {
  closed_lock({
    Key? key,
  }) : super(key: key);

  @override
  State<closed_lock> createState() => _closed_lockState();
}

// getpin() async {
//   final DocumentSnapshot doc = await FirebaseFirestore.instance
//       .collection("Reservation")
//       .doc("${FirebaseAuth.instance.currentUser!.uid}")
//       .get();
//   String lname = doc['locker_name'];

//   await FirebaseFirestore.instance.collection("lockers").doc("${lname}").get();
//   String pin = doc['pin'];

//   return pin;
// }

final random = Random();
int randomNumber = random.nextInt(10) * 1000;
String code = "";
String showpin = "Show pin";

showpincode() async {
  final DocumentSnapshot doc = await FirebaseFirestore.instance
      .collection("Reservation")
      .doc("${FirebaseAuth.instance.currentUser!.uid}")
      .get();
  String lname = doc['locker_name'];

  final DocumentSnapshot doc2 = await FirebaseFirestore.instance
      .collection("lockers")
      .doc("${lname}")
      .get();
  code = doc2['pin'];
  // print(code);
}
///////////////////////

class _closed_lockState extends State<closed_lock> {
  bool click = true;
  TextEditingController emailCont = new TextEditingController();
  TextEditingController otpCont = new TextEditingController();

  // String pin = getpin();

  // getCode() async {
  //   SharedPreferences sp = await SharedPreferences.getInstance();
  //   var today = DateTime.now();
  //   var spCode = sp.getString("code");
  //   DateTime expDate =
  //       DateFormat("yyyy-MM-dd").parse("${sp.getString("date")}");

  //   var d = (today.difference(expDate).inHours / 24).round();

  //   // if ((spCode == null || spCode == '') || d > 0) {
  //   //   await sp.setString("code", randomNumber.toString());
  //   //   await sp.setString("date", DateTime.now().toString().split(" ").first);
  //   //   Future.delayed(Duration(seconds: 1), () {
  //   //     getCode();
  //   //   });
  //   // } else {
  //   //   setState(() {
  //   //     code = spCode;
  //   //   });
  //   // }

  //   final DocumentSnapshot doc = await FirebaseFirestore.instance
  //       .collection("Reservation")
  //       .doc("${FirebaseAuth.instance.currentUser!.uid}")
  //       .get();
  //   String lname = doc['locker_name'];

  //   await FirebaseFirestore.instance
  //       .collection("lockers")
  //       .doc("${lname}")
  //       .get();
  //   code = doc['pin'];
  //   print(code);
  //   return code;
  // }

  bool showCode = false;
  // String code = "123456";

  late EmailAuth emailAuth;

  @override
  void initState() {
    // getCode();
    emailAuth = new EmailAuth(sessionName: "ReLocker");
    //sendOtp();
    super.initState();
  }

  void sendOtp() async {
    Future.delayed(Duration.zero, () {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("loading ..."),
            );
          });
    });

    bool result = await emailAuth.sendOtp(
        recipientMail: "${FirebaseAuth.instance.currentUser!.email}",
        otpLength: 6);
    if (result) {
      Navigator.of(context).pop();
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
                title: Text("Enter code"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: otpCont,
                    ),
                  ],
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () async {
                      verify();
                      if (verify()) {
                        setState(() {
                          showCode = true;
                          otpCont.text = "";
                        });
                        Navigator.of(context).pop();

                        Future.delayed(Duration(seconds: 20), () {
                          setState(() {
                            showCode = false;
                          });
                        });
                      } else {
                        Navigator.of(context).pop();

                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("code not correct"),
                              );
                            });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff88d8bb),
                      shape: StadiumBorder(),
                    ),
                    child: Text(
                      "verify",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  )
                ]);
          });
    }
  }

  bool verify() {
    return emailAuth.validateOtp(
        recipientMail: "${FirebaseAuth.instance.currentUser!.email}",
        userOtp: otpCont.text);
  }

  @override
  Widget build(BuildContext context) {
    showpincode();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * .6,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(40)),
                  color:
                      (click == false) ? Color(0xffff7272) : Color(0xff88d8bb),
                ),
              ),
              Positioned(
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.width / 2.8,
                      width: MediaQuery.of(context).size.width / 2.8,
                      child: SizedBox(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => opened_lock()));
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            shape: const StadiumBorder(),
                          ),
                          child: Icon(
                            (click == false)
                                ? Icons.lock_open_rounded
                                : Icons.lock_outline_rounded,
                            size: 70,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                right: 0,
                left: 0,
                bottom: MediaQuery.of(context).size.width / -6,
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  child: ListTile(
                    tileColor: Colors.grey.shade200,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    title: Text(
                      showCode ? code : "PIN code",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    // subtitle: Text(code),
                    trailing: TextButton(
                      onPressed: showCode
                          ? null
                          : () async {
                              sendOtp();
                            },
                      child: Text(
                        "show",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "code will showen withing 20 seconds",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                Text(
                  'Locker Key',
                  style: TextStyle(
                    fontFamily: 'Helvetica Neue',
                    fontSize: 28,
                    color: const Color(0xff000000),
                    height: -22,
                  ),
                  textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: true),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
