import 'package:adobe_xd/pinned.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:relocker_sa/first.dart';
import 'package:relocker_sa/payment_view/reservation_details.dart';
import 'package:relocker_sa/secondsemester.dart';

import 'controller_view_screen.dart';

class fsemesterdates extends StatefulWidget {
  fsemesterdates({this.start1 = '', this.end1 = ''});

  late String end1;
  late String start1;

  @override
  _fsemesterdatesState createState() => _fsemesterdatesState();
}

class _fsemesterdatesState extends State<fsemesterdates> {
  TextEditingController startDateCont1 = new TextEditingController();
  TextEditingController endDateCont1 = new TextEditingController();
  DateTime selectedDate = DateTime.now();
  DateTime currentyear = DateTime(DateTime.now().year);

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2050));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        startDateCont1.text = picked.toString().split(" ").first;
      });
  }

  Future<void> _selectendDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2050));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        endDateCont1.text = picked.toString().split(" ").first;
      });
  }

  @override
  void initState() {
    startDateCont1.text = "$selectedDate".split(" ").first;
    endDateCont1.text = "$selectedDate".split(" ").first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff88d8bb),
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: const Color(0xff88d8bb),
          title: Text("update semesters dates"),
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
              Pin(start: 190.0, end: 0.0),
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
            /* Pinned.fromPins(
              Pin(start: 39.0, end: 25.0),
              Pin(size: 50.0, middle: 0.8517),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(43.0),
                  color: const Color(0xff88d8bb),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0x29000000),
                      offset: Offset(0, 3),
                      blurRadius: 6,
                    ),
                  ],
                ),
              ),
            ),*/
            Pinned.fromPins(
              Pin(size: 100.0, end: 155.0),
              Pin(size: 40.0, middle: 0.44),
              child: Text("first semester"),
            ),
            Pinned.fromPins(
              Pin(size: 71.0, start: 45.0),
              Pin(size: 18.0, middle: 0.54),
              child: Text("Start Date"),
            ),
            Pinned.fromPins(
              Pin(size: 149.0, start: 32.0),
              Pin(size: 45.0, middle: 0.6),
              child: Card(
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Colors.grey.shade200,
                child: TextField(
                  controller: startDateCont1,
                  readOnly: true,
                  onTap: () {
                    _selectStartDate(context);
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Pinned.fromPins(
              Pin(size: 71.0, end: 93.0),
              Pin(size: 18.0, middle: 0.54),
              child: Text("End Date"),
            ),
            Pinned.fromPins(
              Pin(size: 149.0, end: 30.0),
              Pin(size: 45.0, middle: 0.6),
              child: Card(
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Colors.grey.shade200,
                child: TextField(
                  controller: endDateCont1,
                  readOnly: true,
                  onTap: () {
                    _selectendDate(context);
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            // second semester
            // Pinned.fromPins(
            //   Pin(size: 110.0, end: 155.0),
            //   Pin(size: 40.0, middle: 0.55),
            //   child: Text("second semester"),
            // ),
            // Pinned.fromPins(
            //   Pin(size: 71.0, start: 45.0),
            //   Pin(size: 18.0, middle: 0.63),
            //   child: Text("Start Date"),
            // ),
            // Pinned.fromPins(
            //   Pin(size: 149.0, start: 32.0),
            //   Pin(size: 45.0, middle: 0.7),
            //   child: Card(
            //     elevation: 0.0,
            //     shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(10)),
            //     color: Colors.grey.shade200,
            //     child: TextField(
            //       controller: startDateCont1,
            //       readOnly: true,
            //       onTap: () {
            //         _selectStartDate(context);
            //       },
            //       decoration: InputDecoration(
            //         border: InputBorder.none,
            //       ),
            //     ),
            //   ),
            // ),
            // Pinned.fromPins(
            //   Pin(size: 71.0, end: 93.0),
            //   Pin(size: 18.0, middle: 0.63),
            //   child: Text("End Date"),
            // ),
            // Pinned.fromPins(
            //   Pin(size: 149.0, end: 30.0),
            //   Pin(size: 45.0, middle: 0.7),
            //   child: Card(
            //     elevation: 0.0,
            //     shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(10)),
            //     color: Colors.grey.shade200,
            //     child: TextField(
            //       controller: endDateCont1,
            //       readOnly: true,
            //       onTap: () {
            //         _selectStartDate(context);
            //       },
            //       decoration: InputDecoration(
            //         border: InputBorder.none,
            //       ),
            //     ),
            //   ),
            // ),
            //next button
            Pinned.fromPins(
              Pin(start: 39.0, end: 25.0),
              Pin(size: 50.0, middle: 0.8517),
              child: ElevatedButton(
                onPressed: () async {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ssemesterdates(
                            end1: "${endDateCont1.text}",
                            start1: "${startDateCont1.text}",
                          )));
                },
                child: Text(
                  "Next",
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
