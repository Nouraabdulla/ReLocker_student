import 'package:adobe_xd/pinned.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:relocker_sa/first.dart';
import 'package:relocker_sa/payment_view/reservation_details.dart';
import 'package:relocker_sa/recommendations.dart';

import 'controller_view_screen.dart';

class CalcPayPage extends StatefulWidget {
  CalcPayPage(
      {this.showLockers = true,
      this.priceOneWeek = 0,
      this.resId = '',
      this.typelocker = '',
      this.lockerName = ''});
  late bool showLockers;

  late int priceOneWeek;

  late String resId;
  late String typelocker;
  late String lockerName;
  @override
  _CalcPayPageState createState() => _CalcPayPageState();
}

String startdate1 = '';
String endDate1 = '';
String startdate2 = '';
String endDate2 = '';

class _CalcPayPageState extends State<CalcPayPage> {
  String floor = 'F';

  DateTime todayDate = DateFormat("yyyy-MM-dd")
      .parse(DateFormat('yyyy-MM-dd').format(DateTime.now()));

  getdata() async {
    final DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('semester')
        .doc("semester1")
        .get();
    startdate1 = doc['start'];
    endDate1 = doc['end'];
    final DocumentSnapshot doc2 = await FirebaseFirestore.instance
        .collection('semester')
        .doc("semester2")
        .get();
    startdate2 = doc['start'];
    endDate2 = doc['end'];
  }

  TextEditingController weeksNumberCont = new TextEditingController();
  TextEditingController startDateCont = new TextEditingController();
  TextEditingController endDateCont = new TextEditingController();

  DateTime selectedDate = DateTime.now();
  int a = 0;
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
    getdata();
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
                    if (widget.showLockers) {
                      _selectStartDate(context);
                    }
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
                  if (widget.showLockers) {
                    //get which semester the reservation in

//to know which semester dates to send
                    if (DateTime.parse(startDateCont.text)
                            .isAfter(DateTime.parse(startdate1)) &&
                        DateTime.parse(endDateCont.text)
                            .isBefore(DateTime.parse(endDate1))) {
                      a = int.parse(weeksNumberCont.text);
                      if (a < 1) {
                        const snackBar = SnackBar(
                          content:
                              Text('minimum reservation duration is one week'),
                        );
// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } else if (a > 4) {
                        const snackBar = SnackBar(
                          content: Text(
                              'maximum reservation duration is four weeks'),
                        );
// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } else {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => first(
                                  numberOfWeek: int.parse(weeksNumberCont.text),
                                  resId: "",
                                  startDate: "${startDateCont.text}",
                                  endDate: "${endDateCont.text}",
                                )));
                      }
                    } else if (DateTime.parse(startDateCont.text)
                            .isAfter(DateTime.parse(startdate2)) &&
                        DateTime.parse(endDateCont.text)
                            .isBefore(DateTime.parse(endDate2))) {
                      a = int.parse(weeksNumberCont.text);

                      if (a < 1) {
                        const snackBar = SnackBar(
                          content:
                              Text('minimum reservation duration is one week'),
                        );
// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } else if (a > 4) {
                        const snackBar = SnackBar(
                          content: Text(
                              'maximum reservation duration is four weeks'),
                        );
// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } else {
                        print("hereeeee second check");
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => first(
                                  numberOfWeek: int.parse(weeksNumberCont.text),
                                  resId: "",
                                  startDate: "${startDateCont.text}",
                                  endDate: "${endDateCont.text}",
                                )));
                      }
                    } else {
                      // print("your selected days out of studing date");
                      const snackBar = SnackBar(
                        content:
                            Text('you can reserve during working days only'),
                      );

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                    //recommendation
                    a = int.parse(weeksNumberCont.text);

                    if (a < 1) {
                    } else if (a > 4) {
                    } else if (DateTime.parse(startDateCont.text)
                            .isAfter(DateTime.parse(startdate1)) &&
                        DateTime.parse(endDateCont.text)
                            .isBefore(DateTime.parse(endDate1))) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Container(
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30)),
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
                                        MediaQuery.of(context).size.width / 5,
                                    height:
                                        MediaQuery.of(context).size.width / 9,
                                    child: ElevatedButton(
                                      child: const Text(
                                        'Yes',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        primary: Color(0xFF9AD6BD),
                                        shape: const StadiumBorder(),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    recommendations(
                                                      numberOfWeek: int.parse(
                                                          weeksNumberCont.text),
                                                      resId: "",
                                                      startDate:
                                                          "${startDateCont.text}",
                                                      endDate:
                                                          "${endDateCont.text}",
                                                      floor: floor,
                                                    )));
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 5,
                                    height:
                                        MediaQuery.of(context).size.width / 9,
                                    child: ElevatedButton(
                                      child: const Text(
                                        'No',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        primary: Color(0xFF9AD6BD),
                                        shape: const StadiumBorder(),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });
                    } else if (DateTime.parse(startDateCont.text)
                            .isAfter(DateTime.parse(startdate2)) &&
                        DateTime.parse(endDateCont.text)
                            .isBefore(DateTime.parse(endDate2))) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Container(
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30)),
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
                                        MediaQuery.of(context).size.width / 5,
                                    height:
                                        MediaQuery.of(context).size.width / 9,
                                    child: ElevatedButton(
                                      child: const Text(
                                        'Yes',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        primary: Color(0xFF9AD6BD),
                                        shape: const StadiumBorder(),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    recommendations(
                                                      numberOfWeek: int.parse(
                                                          weeksNumberCont.text),
                                                      resId: "",
                                                      startDate:
                                                          "${startDateCont.text}",
                                                      endDate:
                                                          "${endDateCont.text}",
                                                      floor: floor,
                                                    )));
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 5,
                                    height:
                                        MediaQuery.of(context).size.width / 9,
                                    child: ElevatedButton(
                                      child: const Text(
                                        'No',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        primary: Color(0xFF9AD6BD),
                                        shape: const StadiumBorder(),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });
                    } //else
                  } else {
                    a = int.parse(weeksNumberCont.text);

                    if (a < 1) {
                      const snackBar = SnackBar(
                        content:
                            Text('minimum reservation duration is one week'),
                      );
// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else if (a > 4) {
                      const snackBar = SnackBar(
                        content:
                            Text('maximum reservation duration is four weeks'),
                      );
// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ReservationDetails(
                                startDate: startDateCont.text,
                                endDate: endDateCont.text,
                                from: '2',
                                priceOneWeek: widget.priceOneWeek,
                                resId: '',
                                typelocker: widget.typelocker,
                                lockerName: widget.lockerName,
                                totalPrice: (widget.priceOneWeek *
                                    int.parse(weeksNumberCont.text))),
                          ));
                    }
                  }
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
