// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:adobe_xd/pinned.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:relocker_sa/locker_type.dart';
import 'package:relocker_sa/lockerset1_gg.dart';

import 'controller_view_screen.dart';

class addblock extends StatefulWidget {
  final String? from;
  final bool available;
  final String? block;
  final String? type;
  const addblock({
    Key? key,
    this.from = "0",
    this.available = true,
    this.block = "",
    this.type = '',
  }) : super(key: key);

  @override
  State<addblock> createState() => _addblockState();
}

class _addblockState extends State<addblock> {
  String lockernameformela = "";
  bool isexist = false;
  int selectedValue = 0;
  String sellection = "";
  String lockersize = "";
  TextEditingController myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff88d8bb),
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: const Color(0xff88d8bb),
          title: Text("Add lockers"),
          centerTitle: true,
          foregroundColor: Colors.black,
          leading: IconButton(
              color: Colors.black,
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ),
        body: Stack(
          children: <Widget>[
            Pinned.fromPins(
              Pin(start: 0.0, end: 0.0),
              Pin(start: 180.0, end: 0.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(48.0),
                    topRight: Radius.circular(48.0),
                  ),
                  color: const Color(0xffffffff),
                ),
              ),
            ),
            Column(
              children: <Widget>[
                SizedBox(
                  height: 230,
                ),
                SizedBox(
                  child: const Text('choose lockers size'),
                ),
                SizedBox(
                    child: RadioListTile<int>(
                        value: 0,
                        groupValue: selectedValue,
                        title: const Text('Small'),
                        onChanged: (value) => setState(
                              () => selectedValue = 0,
                            ))),
                SizedBox(
                    child: RadioListTile<int>(
                        value: 1,
                        groupValue: selectedValue,
                        title: const Text('Large'),
                        onChanged: (value) =>
                            setState(() => selectedValue = 1))),

                //take lockers number
                SizedBox(
                  height: 20,
                ),
                Text("Enter first locker number"),
                const SizedBox(height: 10),
                TextField(
                  controller: myController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Enter number in 3-digit at least (ex:001)',
                  ),
                ),
              ],
            ),
            Pinned.fromPins(
              Pin(start: 39.0, end: 25.0),
              Pin(size: 50.0, middle: 0.8517),
              child: ElevatedButton(
                onPressed: () async {
                  int size = 0;
                  int lockern = int.parse(myController.text);
                  String ss = "";
                  if (lockern < 9) {
                    ss = "00" + lockern.toString();
                  } else if (lockern < 99) {
                    ss = "0" + lockern.toString();
                  } else if (lockern > 99) {
                    ss = lockern.toString();
                  }
                  //for locker naming
                  if (widget.type == "r") {
                    lockernameformela = "6-G-";
                  } else {
                    lockernameformela = "6-F-";
                  }

                  //for loop size
                  if (selectedValue == "s") {
                    size = 16;
                  } else {
                    size = 8;
                  }
                  List lockersnumber;
                  //check if numbers already exist in database
                  for (var i = 0; i < size; i++) {
                    await FirebaseFirestore.instance
                        .collection("lockers")
                        .where("name", isEqualTo: "${lockernameformela}${ss}")
                        .limit(1)
                        .get()
                        .then((v) {
                      v.docs.forEach((el) {
                        final doc = FirebaseFirestore.instance
                            .collection("lockers")
                            .doc("${el.id}")
                            .get();
                        setState(() {
                          isexist = true;
                        });
                      });
                    });
                    // print(isexist);
                    // print("${lockernameformela}${ss}");
                  }

                  if (isexist) {
                    // //error message if lockers already exists
                    const snackBar = SnackBar(
                      content: Text('the numbers already exists'),
                    );
// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    isexist = false;
                    // print(isexist);
                  } else {
                    int a = int.parse(ss);

                    //add lockers to database if lockers new
                    List.generate(8, (index) {
                      // print("${lockernameformela}" + "$a");

                      FirebaseFirestore.instance
                          .collection("lockers")
                          .doc("test" + "${index}")
                          .set({
                        "available": true,
                        "block": widget.block,
                        'type': widget.type,
                        'size': selectedValue == 0 ? "s" : "l",
                        "name": "${lockernameformela}" + "$a",
                      });
                      a = a + 1;
                      lockern = lockern + 1;
                    });

                    //make block appear in its zone
                    await FirebaseFirestore.instance
                        .collection("zones")
                        .doc("${widget.from}zone")
                        .update({
                      "${widget.block}size": selectedValue == 0 ? "s" : "l",
                    });

                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title:
                            const Text('Lokcers have been added successfully'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => locker_type(
                                          from: "2",
                                        ))),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  }
                },
                child: Text(
                  "Add",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 19,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff88d8bb),
                  shape: const StadiumBorder(),
                ),
              ),
            ),
          ],
        ));
  }
}
