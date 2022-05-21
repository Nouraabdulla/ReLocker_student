import 'package:adobe_xd/pinned.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:relocker_sa/adddates.dart';
import 'package:relocker_sa/first.dart';
import 'package:relocker_sa/firstsemester.dart';
import 'package:relocker_sa/payment_view/reservation_details.dart';
import 'package:relocker_sa/secondsemester.dart';

import 'controller_view_screen.dart';

class ssemesterdates extends StatefulWidget {
  ssemesterdates({this.start1 = '', this.end1 = ''});

  late String end1;
  late String start1;

  @override
  _ssemesterdatesState createState() => _ssemesterdatesState();
}

class _ssemesterdatesState extends State<ssemesterdates> {
  // TextEditingController weeksNumberCont = new TextEditingController();
  TextEditingController startDateCont2 = new TextEditingController();
  TextEditingController endDateCont2 = new TextEditingController();
  String end2 = "";
  String start2 = '';
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
        startDateCont2.text = picked.toString().split(" ").first;
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
        endDateCont2.text = picked.toString().split(" ").first;
      });
  }

  @override
  void initState() {
    startDateCont2.text = "$selectedDate".split(" ").first;
    endDateCont2.text = "$selectedDate".split(" ").first;
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
          title: Text("Update semester dates"),
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
            Pinned.fromPins(
              Pin(size: 128.0, end: 155.0),
              Pin(size: 40.0, middle: 0.44),
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
                  controller: startDateCont2,
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
                  controller: endDateCont2,
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
            Pinned.fromPins(
              Pin(start: 39.0, end: 25.0),
              Pin(size: 50.0, middle: 0.8517),
              child: ElevatedButton(
                onPressed: () async {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => adddates(
                            end1: widget.end1,
                            start1: widget.start1,
                            end2: "${endDateCont2.text}",
                            start2: "${startDateCont2.text}",
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
