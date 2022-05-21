import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:relocker_sa/lockerset1_fp.dart';
import 'package:relocker_sa/lockerset1_gg.dart';
import 'package:relocker_sa/lockerset1_go.dart';
import 'package:relocker_sa/lockerset1_gp.dart';
import 'package:relocker_sa/lockerset1_gy.dart';
import 'package:relocker_sa/zonelist.dart';
import 'lockerset1_fg.dart';
import 'package:flutter_elegant_number_button/flutter_elegant_number_button.dart';

class recommendations extends StatefulWidget {
  final int? numberOfWeek;
  final String resId;
  final String floor;
  final String startDate;
  final String endDate;
  recommendations(
      {Key? key,
      this.numberOfWeek,
      this.resId = '',
      this.floor = '',
      this.startDate = '',
      this.endDate = ''})
      : super(key: key);

  @override
  State<recommendations> createState() => _recommendations();
}

// int i = 1;
num g1 = 0;
num g2 = 0;
num g3 = 0;
num g4 = 0;
num f1 = 0;
num f2 = 0;
num f3 = 0;
num f4 = 0;
List<num> number = [];

class _recommendations extends State<recommendations> {
  GlobalKey<FormState> _resetFormKey = GlobalKey<FormState>();

  User? user = FirebaseAuth.instance.currentUser;
  Map<String, dynamic> datares = {};
  getData() async {
    FirebaseFirestore.instance
        .collection("recommendations")
        .get()
        .then((value) {
      List<DocumentSnapshot<Map<String, dynamic>>> list = value.docs;
      list.forEach((element) async {
        setState(() {
          datares = element.data()!;
        });
      });
    });
  }

  @override
  void initState() {
    // getData();
    super.initState();
  }

  String? zone = "";
  String dropdownValue = 'First';
  bool Atdoor = false;
  bool classname = false;
  int selectedValue = 0;
  int selection = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        appBar: AppBar(
          backgroundColor: const Color(0xff88d8bb),
          title: Text("recommendations"),
          centerTitle: true,
          foregroundColor: Colors.black,
          leading: IconButton(
              color: Colors.black,
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Container(
                    height: 580,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withAlpha(100),
                              blurRadius: 10.0),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20),
                      child: Column(
                        children: <Widget>[
                          if (widget.floor == 'F') ...[
                            SizedBox(
                              height: 50,
                              child: Text(
                                "Choose your preferences:",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            SizedBox(
                                child: RadioListTile<int>(
                                    value: 0,
                                    groupValue: selection,
                                    title: Text('Near to exit'),
                                    onChanged: (value) =>
                                        setState(() => selection = 0))),
                            SizedBox(
                                child: RadioListTile<int>(
                                    value: 1,
                                    groupValue: selection,
                                    title: Text('Near to my class'),
                                    onChanged: (value) => setState(
                                          () => selection = 1,
                                        ))),
                            if (selection == 1) ...[
                              SizedBox(
                                child: Text(
                                    'Set the number of your classes in each range'),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                child: ElegantNumberButton(
                                  initialValue: f1,
                                  minValue: 0,
                                  maxValue: 10,
                                  step: 1,
                                  decimalPlaces: 0,
                                  color: Colors.grey,
                                  onChanged: (value) {
                                    // get the latest value from here
                                    setState(() {
                                      f1 = value;
                                    });
                                    FirebaseFirestore.instance
                                        .collection('recommendations')
                                        .doc('zone1')
                                        .update({
                                      "counter": f1,
                                    }).then((result) {
                                      print("new USer true");
                                    }).catchError((onError) {
                                      print("onError");
                                    });
                                  },
                                ),
                              ),
                              SizedBox(
                                child: Text(" 6-F-1    to    6-F-11"),
                              ),
                              SizedBox(
                                child: ElegantNumberButton(
                                  initialValue: f2,
                                  minValue: 0,
                                  maxValue: 10,
                                  step: 1,
                                  decimalPlaces: 0,
                                  color: Colors.grey,
                                  onChanged: (value) {
                                    // get the latest value from here
                                    setState(() {
                                      f2 = value;
                                      FirebaseFirestore.instance
                                          .collection('recommendations')
                                          .doc('zone2')
                                          .update({
                                        "counter": f2,
                                      }).then((result) {
                                        print("new USer true");
                                      }).catchError((onError) {
                                        print("onError");
                                      });
                                    });
                                  },
                                ),
                              ),
                              SizedBox(
                                child: Text("6-F-12    to    6-F-21"),
                              ),
                              SizedBox(
                                child: ElegantNumberButton(
                                  initialValue: f3,
                                  minValue: 0,
                                  maxValue: 10,
                                  step: 1,
                                  decimalPlaces: 0,
                                  color: Colors.grey,
                                  onChanged: (value) {
                                    // get the latest value from here
                                    setState(() {
                                      f3 = value;
                                      FirebaseFirestore.instance
                                          .collection('recommendations')
                                          .doc('zone3')
                                          .update({
                                        "counter": value,
                                      }).then((result) {
                                        print("new USer true");
                                      }).catchError((onError) {
                                        print("onError");
                                      });
                                    });
                                  },
                                ),
                              ),
                              SizedBox(
                                child: Text("6-F-25    to    6-F-49"),
                              ),
                              SizedBox(
                                child: ElegantNumberButton(
                                  initialValue: f4,
                                  minValue: 0,
                                  maxValue: 10,
                                  step: 1,
                                  decimalPlaces: 0,
                                  color: Colors.grey,
                                  onChanged: (value) {
                                    // get the latest value from here
                                    setState(() {
                                      f4 = value;
                                    });
                                    FirebaseFirestore.instance
                                        .collection('recommendations')
                                        .doc('zone4')
                                        .update({
                                      "counter": f4,
                                    }).then((result) {
                                      print("new USer true");
                                    }).catchError((onError) {
                                      print("onError");
                                    });
                                  },
                                ),
                              ),
                              SizedBox(
                                child: Text("6-F-50    to    6-F-56"),
                              ),
                            ],
                            SizedBox(
                              height: 70,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2.0,
                              height: MediaQuery.of(context).size.width / 9,
                              child: ElevatedButton(
                                child: const Text(
                                  'Confirm',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 18,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xFF9AD6BD),
                                  shape: const StadiumBorder(),
                                ),
                                onPressed: () {
                                  //  number.sort();
                                  number = [f1, f2, f3, f4];
                                  // print(number);

                                  if (selection == 1) {
                                    // setState(() {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (context) => zones_list(
                                                  numberOfWeek:
                                                      widget.numberOfWeek!,
                                                  resId: widget.resId,
                                                  startDate: widget.startDate,
                                                  endDate: widget.endDate,
                                                  floor: widget.floor,
                                                )));
                                    // });
                                  } else {
                                    Navigator.of(context)
                                        .pushReplacement(MaterialPageRoute(
                                            builder: (context) => lockerset1_fp(
                                                  numberOfWeek:
                                                      widget.numberOfWeek!,
                                                  resId: widget.resId,
                                                  startDate: widget.startDate,
                                                  endDate: widget.endDate,
                                                )));
                                  }
                                },
                              ),
                            ),
                          ],

                          // recommendations for Ground floor
                          if (widget.floor == 'G') ...[
                            SizedBox(
                              height: 50,
                              child: Text(
                                "Choose your preferences:",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            SizedBox(
                                child: RadioListTile<int>(
                                    value: 0,
                                    groupValue: selection,
                                    title: Text('Near to exit'),
                                    onChanged: (value) =>
                                        setState(() => selection = 0))),
                            SizedBox(
                                child: RadioListTile<int>(
                                    value: 1,
                                    groupValue: selection,
                                    title: Text('Near to my class'),
                                    onChanged: (value) => setState(
                                          () => selection = 1,
                                        ))),
                            if (selection == 1) ...[
                              SizedBox(
                                child: Text(
                                    'Set the number of your classes in each range'),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                child: ElegantNumberButton(
                                  initialValue: g1,
                                  minValue: 0,
                                  maxValue: 10,
                                  step: 1,
                                  decimalPlaces: 0,
                                  color: Colors.grey,
                                  onChanged: (value) {
                                    // get the latest value from here
                                    setState(() {
                                      g1 = value;
                                    });
                                    FirebaseFirestore.instance
                                        .collection('recommendations')
                                        .doc('zone1')
                                        .update({
                                      "counter": g1,
                                    }).then((result) {
                                      print("new USer true");
                                    }).catchError((onError) {
                                      print("onError");
                                    });
                                  },
                                ),
                              ),
                              SizedBox(
                                child: Text(" 6-G-1    to    6-G-11"),
                              ),
                              SizedBox(
                                child: ElegantNumberButton(
                                  initialValue: g2,
                                  minValue: 0,
                                  maxValue: 10,
                                  step: 1,
                                  decimalPlaces: 0,
                                  color: Colors.grey,
                                  onChanged: (value) {
                                    // get the latest value from here
                                    setState(() {
                                      g2 = value;
                                      FirebaseFirestore.instance
                                          .collection('recommendations')
                                          .doc('zone2')
                                          .update({
                                        "counter": g2,
                                      }).then((result) {
                                        print("new USer true");
                                      }).catchError((onError) {
                                        print("onError");
                                      });
                                    });
                                  },
                                ),
                              ),
                              SizedBox(
                                child: Text("6-G-12    to    6-G-21"),
                              ),
                              SizedBox(
                                child: ElegantNumberButton(
                                  initialValue: g3,
                                  minValue: 0,
                                  maxValue: 10,
                                  step: 1,
                                  decimalPlaces: 0,
                                  color: Colors.grey,
                                  onChanged: (value) {
                                    // get the latest value from here
                                    setState(() {
                                      g3 = value;
                                      FirebaseFirestore.instance
                                          .collection('recommendations')
                                          .doc('zone3')
                                          .update({
                                        "counter": value,
                                      }).then((result) {
                                        print("new USer true");
                                      }).catchError((onError) {
                                        print("onError");
                                      });
                                    });
                                  },
                                ),
                              ),
                              SizedBox(
                                child: Text("6-G-30    to    6-G-42"),
                              ),
                              SizedBox(
                                child: ElegantNumberButton(
                                  initialValue: g4,
                                  minValue: 0,
                                  maxValue: 10,
                                  step: 1,
                                  decimalPlaces: 0,
                                  color: Colors.grey,
                                  onChanged: (value) {
                                    // get the latest value from here
                                    setState(() {
                                      g4 = value;
                                    });
                                    FirebaseFirestore.instance
                                        .collection('recommendations')
                                        .doc('zone4')
                                        .update({
                                      "counter": g4,
                                    }).then((result) {
                                      print("new USer true");
                                    }).catchError((onError) {
                                      print("onError");
                                    });
                                  },
                                ),
                              ),
                              SizedBox(
                                child: Text("6-G-44    to    6-G-53"),
                              ),
                            ],
                            SizedBox(
                              height: 70,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2.0,
                              height: MediaQuery.of(context).size.width / 9,
                              child: ElevatedButton(
                                child: const Text(
                                  'Confirm',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 18,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xFF9AD6BD),
                                  shape: const StadiumBorder(),
                                ),
                                onPressed: () {
                                  if (selection == 1) {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (context) => zones_list(
                                                  numberOfWeek:
                                                      widget.numberOfWeek!,
                                                  resId: widget.resId,
                                                  startDate: widget.startDate,
                                                  endDate: widget.endDate,
                                                  floor: widget.floor,
                                                )));
                                    // });
                                  } else {
                                    //  // near to exit which zone yellow or pureple

                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                lockerset1_gpl(
                                                  numberOfWeek:
                                                      widget.numberOfWeek!,
                                                  resId: widget.resId,
                                                  startDate: widget.startDate,
                                                  endDate: widget.endDate,
                                                )));
                                  }
                                },
                              ),
                            ),
                          ]
                        ],
                      ),
                    )))));
  }
}
