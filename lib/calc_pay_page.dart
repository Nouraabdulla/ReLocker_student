import 'package:adobe_xd/pinned.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:relocker_sa/first.dart';
import 'package:relocker_sa/recommendations.dart';

import 'controller_view_screen.dart';

class CalcPayPage extends StatefulWidget {
  const CalcPayPage({Key? key}) : super(key: key);

  @override
  _CalcPayPageState createState() => _CalcPayPageState();
}

class _CalcPayPageState extends State<CalcPayPage> {
 String floor='F';
  TextEditingController weeksNumberCont = new TextEditingController();
  TextEditingController startDateCont = new TextEditingController();
  TextEditingController endDateCont = new TextEditingController();

  DateTime selectedDate = DateTime.now();

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2050));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        startDateCont.text = picked.toString().split(" ").first;
        endDateCont.text =
            "${selectedDate.add(Duration(days: weeksNumberCont.text == "" ? 0 : 7 * int.parse(weeksNumberCont.text)))}"
                .split(" ")
                .first;
      });
  }

  @override
  void initState() {
    startDateCont.text = "$selectedDate".split(" ").first;
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
          title: Text("Set duration"),
          centerTitle: true,
          foregroundColor: Colors.black,
          leading: IconButton(
              color: Colors.black,
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ControllerViewScreen()));
                },
                child: Text("Cancle", style: TextStyle(color: Colors.black)))
          ],
        ),
        body: Stack(
          children: <Widget>[
            Pinned.fromPins(
              Pin(start: 0.0, end: 0.0),
              Pin(start: 150.0, end: 0.0),
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
              Pin(size: 71.0, end: 155.0),
              Pin(size: 40.0, middle: 0.3105),
              child: Text("Number of weeks"),
            ),
            Pinned.fromPins(
              Pin(size: 150.0, end: 115.0),
              Pin(size: 52.0, middle: 0.3817),
              child: Card(
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Colors.grey.shade200,
                child: TextField(
                  keyboardType: TextInputType.phone,
                  onChanged: (v) {
                    endDateCont.text =
                        "${selectedDate.add(Duration(days: v == "" ? 0 : 7 * int.parse(v)))}"
                            .split(" ")
                            .first;
                  },
                  controller: weeksNumberCont,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Pinned.fromPins(
              Pin(size: 71.0, start: 45.0),
              Pin(size: 18.0, middle: 0.5305),
              child: Text("Start Date"),
            ),
            Pinned.fromPins(
              Pin(size: 149.0, start: 32.0),
              Pin(size: 45.0, middle: 0.5842),
              child: Card(
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Colors.grey.shade200,
                child: TextField(
                  controller: startDateCont,
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
              Pin(size: 18.0, middle: 0.5305),
              child: Text("End Date"),
            ),
            Pinned.fromPins(
              Pin(size: 149.0, end: 30.0),
              Pin(size: 45.0, middle: 0.5842),
              child: Card(
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Colors.grey.shade200,
                child: TextField(
                  controller: endDateCont,
                  readOnly: true,
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
                  await FirebaseFirestore.instance
                      .collection("Reservation")
                      .add({
                    "End Date": "${endDateCont.text}",
                    "Start Date": "${startDateCont.text}",
                    "Owner": "${FirebaseAuth.instance.currentUser!.email}",
                    "user_id": "${FirebaseAuth.instance.currentUser!.uid}",
                    "locker_name": "",
                    "Price": ""
                  }).then((value) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => first(
                              numberOfWeek: int.parse(weeksNumberCont.text),
                              resId: "${value.id}",
                              startDate: "${startDateCont.text}",
                              endDate: "${endDateCont.text}",
                            )));
                 
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
                                                //  "Do you want to get recommendation ?",
                                                  " would you like to get recommendations to find the suitbale lockers?",
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
                                                         Navigator.of(context).push(MaterialPageRoute(
                                             builder: (context) => recommendations(
                                              numberOfWeek: int.parse(weeksNumberCont.text),
                                               resId: "${value.id}", floor: floor,
                                              )));
      
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
