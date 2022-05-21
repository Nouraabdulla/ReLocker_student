import 'package:adobe_xd/pinned.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:relocker_sa/Home_admin.dart';
import 'package:relocker_sa/controller_admin.dart';
import 'package:relocker_sa/first.dart';
import 'package:relocker_sa/firstsemester.dart';
import 'package:relocker_sa/home_view.dart';
import 'package:relocker_sa/payment_view/reservation_details.dart';
import 'package:relocker_sa/secondsemester.dart';

import 'controller_view_screen.dart';

class adddates extends StatefulWidget {
  adddates(
      {this.start1 = '', this.end1 = '', this.start2 = '', this.end2 = ''});

  late String end1;
  late String start1;
  late String end2;
  late String start2;

  @override
  _adddatesState createState() => _adddatesState();
}

class _adddatesState extends State<adddates> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff88d8bb),
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: const Color(0xff88d8bb),
          title: Text("Update dates"),
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
              Pin(start: 100.0, end: 0.0),
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

            Pinned.fromPins(
              Pin(size: 110.0, end: 133.0),
              Pin(size: 40.0, middle: 0.3),
              child: Text(
                "First Semester",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Pinned.fromPins(
              Pin(size: 71.0, start: 100.0),
              Pin(size: 45.0, middle: 0.4),
              child: Text(widget.start1),
            ),
            Pinned.fromPins(
              Pin(size: 71.0, end: 100.0),
              Pin(size: 45.0, middle: 0.4),
              child: Text(widget.end1),
            ),
            // sencond semester
            Pinned.fromPins(
              Pin(size: 128.0, end: 133.0),
              Pin(size: 40.0, middle: 0.59),
              child: Text(
                "Second Semester",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Pinned.fromPins(
              Pin(size: 71.0, start: 100.0),
              Pin(size: 45.0, middle: 0.7),
              child: Text(widget.start2),
            ),
            Pinned.fromPins(
              Pin(size: 71.0, end: 100.0),
              Pin(size: 45.0, middle: 0.7),
              child: Text(widget.end2),
            ),

            //confirm button
            Pinned.fromPins(
              Pin(start: 39.0, end: 25.0),
              Pin(size: 50.0, middle: 0.8517),
              child: ElevatedButton(
                onPressed: () async {
                  await FirebaseFirestore.instance
                      .collection("semester")
                      .doc("semester2")
                      .set({
                    "end": "${widget.end2}",
                    "start": "${widget.start2}",
                  });
                  await FirebaseFirestore.instance
                      .collection("semester")
                      .doc("semester1")
                      .set({
                    "end": "${widget.end1}",
                    "start": "${widget.start1}",
                  }).then((value) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => controlleradmin()));
                  });
                },
                child: Text(
                  "Confirm",
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
