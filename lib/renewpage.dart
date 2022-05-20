import 'dart:math';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:relocker_sa/lockerset1_fg.dart';
import 'package:relocker_sa/payment_view/reservation_details.dart';
import 'calc_pay_page.dart';
import 'closed_lock.dart';
import 'main.dart';

class renew extends StatefulWidget {
  const renew({Key? key}) : super(key: key);

  @override
  _renewState createState() => _renewState();
}

// DateTime? today = DateFormat("yyyy-MM-dd").parse("2022-02-19");

////////////////////////////////////////

class _renewState extends State<renew> {
  int newdifference = 0;
  DateTime todayDate = DateFormat("yyyy-MM-dd").parse("2022-05-04");
  DateTime startLockerdate = DateFormat("yyyy-MM-dd").parse("2022-05-04");
  DateTime enddate = DateFormat("yyyy-MM-dd").parse("2022-05-04");
  DateTime startrenew = DateFormat("yyyy-MM-dd").parse("2022-05-04");
  String date = "";
  int rendifference = 0;
  int rendifference2 = 0;
  String locker = "";
  String typeLocker = '';
  String lockerName = '';
  String priceOneWeek = '';
  String userid = "";
  int semester = 0;
  int totalprice = 0;
  String endD = "";
  String startD = "";
  String lockerSize = "";

  haslocker() async {
    final DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('Users')
        .doc("${FirebaseAuth.instance.currentUser!.uid}")
        .get();
    locker = doc['reservedlocker'];
    if (locker != "") {
      return true;
    }
    return false;
  }

  canrenew() async {
    print(FirebaseAuth.instance.currentUser!.uid);
    final DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('Reservation')
        .doc("${FirebaseAuth.instance.currentUser!.uid}")
        .get();
    // DateTime date = doc2['End Date'].toDate();
    semester = doc["semester"];
    totalprice = doc["Price"];
    typeLocker = doc['typeLocker'];
    lockerName = doc['locker_name'];
    priceOneWeek = doc['priceOneWeek'].toString();
    startLockerdate = DateFormat("yyyy-MM-dd").parse(doc['Start Date']);
    enddate = DateFormat("yyyy-MM-dd").parse(doc['End Date']);
    startrenew = enddate.subtract(Duration(days: 3));
    //الوقت المسموح فيه
    rendifference = enddate.difference(startrenew).inMinutes;
    DateTime todayDate = DateFormat("yyyy-MM-dd")
        .parse(DateFormat('yyyy-MM-dd').format(DateTime.now()));
    rendifference2 = enddate.difference(todayDate).inMinutes;
    print(typeLocker);
    print('Start ${startLockerdate}');
    print('End ${enddate}');
    print('start ReNew ${startrenew}');
    print('Time ReNew in Minutes ${rendifference}');
    print('Time ReNew in Minutes ${rendifference2}');
    print('Date Today ${todayDate}');

    //////
    // print(FirebaseAuth.instance.currentUser!.uid);
    // final DocumentSnapshot doc = await FirebaseFirestore.instance
    //     .collection('Reservation')
    //     .doc("${FirebaseAuth.instance.currentUser!.uid}")
    //     .get();
    // // DateTime date = doc2['End Date'].toDate();
    // typeLocker = doc['typeLocker'];
    // lockerName = doc['locker_name'];
    // priceOneWeek = doc['priceOneWeek'].toString();
    // startLockerdate = DateFormat("yyyy-MM-dd").parse(doc['Start Date']);
    // enddate = DateFormat("yyyy-MM-dd").parse(doc['End Date']);
    // endD = doc['End Date'];
    // startD = doc['Start Date'];
    // priceOneWeek = doc["priceOneWeek"];
    // userid = doc["user_id"];
    // semester = doc["semester"];
    // totalprice = doc["Price"];
    // startrenew = enddate.subtract(Duration(days: 3));
    // //duration that accepts renew
    // rendifference = enddate.difference(startrenew).inMinutes;
    // DateTime todayDate = DateFormat("yyyy-MM-dd")
    //     .parse(DateFormat('yyyy-MM-dd').format(DateTime.now()));
    // rendifference2 = enddate.difference(todayDate).inMinutes;

    // // print(typeLocker);
    // print('Start ${startLockerdate}');
    // print('End ${enddate}');
    // print('start ReNew ${startrenew}');
    // // print('Time ReNew in Minutes ${rendifference}');
    // // print('Time ReNew in Minutes ${rendifference2}');
    // // print('Date Today ${todayDate}');

    // // final DocumentSnapshot doc2 = await FirebaseFirestore.instance
    // //     .collection('Reservation')
    // //     .doc("${FirebaseAuth.instance.currentUser!.uid}")
    // //     .get();

    // // print(startdate.toString());

    // // if (today!.isAfter(startrenew!) && today!.isBefore(enddate!)) {
    // //   return true;
    // // }
    // // return false;
  }

  @override
  Widget build(BuildContext context) {
    // canrenew();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff88d8bb),
        title: Text("Renew"),
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        foregroundColor: Colors.black,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("you can renew your reservation"),
            Text("before three days of expiration"),
            SizedBox(
              height: 20,
            ),
            FutureBuilder(
              future: canrenew(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ElevatedButton(
                    onPressed: () async {
                      print("$rendifference2  $rendifference");
                      if (rendifference2 > 0 &&
                          rendifference2 < rendifference) {
                        if (typeLocker != 'f') {
                          //check wich semester is now and set the renew dates
                          final DocumentSnapshot doc = await FirebaseFirestore
                              .instance
                              .collection('semester')
                              .doc("semester1")
                              .get();
                          String startdate1 = doc['start'];
                          String endDate1 = doc['end'];
                          final DocumentSnapshot doc2 = await FirebaseFirestore
                              .instance
                              .collection('semester')
                              .doc("semester2")
                              .get();
                          String startdate2 = doc2['start'];
                          String endDate2 = doc2['end'];

                          print("heere start $startdate2");
                          print("heere end $endDate2");
                          if (DateTime.now()
                                  .isAfter(DateTime.parse(startdate1)) &&
                              DateTime.now()
                                  .isBefore(DateTime.parse(endDate1))) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ReservationDetails(
                                        totalPrice: totalprice,
                                        resId: userid,
                                        lockerName: lockerName,
                                        priceOneWeek: 0,
                                        typelocker: typeLocker,
                                        startDate: startdate2,
                                        endDate: endDate2,
                                        lockerSize: "",
                                        from: "2")));
                          } else if (DateTime.now()
                                  .isAfter(DateTime.parse(startdate2)) &&
                              DateTime.now()
                                  .isBefore(DateTime.parse(endDate2))) {
                            const snackBar = SnackBar(
                              content:
                                  Text('please reserve again next semester'),
                            );
// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        } else {
                          // got to set duration page
                          // print('here');

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CalcPayPage(
                                      showLockers: false,
                                      lockerName: lockerName,
                                      priceOneWeek: int.parse(priceOneWeek),
                                      typelocker: typeLocker)));
                        }
                      } else {
                        print('Not run');
                      }
                    },
                    child: Text(
                      'Renew',
                      style: TextStyle(fontSize: 22),
                    ),
                    style: ButtonStyle(
                        backgroundColor: (DateTime.now().isAfter(startrenew) &&
                                DateTime.now().isBefore(enddate))
                            ? MaterialStateProperty.all(
                                Color.fromRGBO(137, 216, 187, 1))
                            : MaterialStateProperty.all(
                                Color.fromRGBO(178, 190, 181, 1))),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

void Notify() async {
  String timezom = await AwesomeNotifications().getLocalTimeZoneIdentifier();
  await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: 1,
          channelKey: 'key1',
          title: 'This is Notification title',
          body: 'This is body of notification'),
      schedule:
          NotificationInterval(interval: 5, timeZone: timezom, repeats: false));
}
