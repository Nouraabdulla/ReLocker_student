import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:relocker_sa/lockerset1_fg.dart';
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
  DateTime enddate = DateFormat("yyyy-MM-dd").parse("2022-05-04");
  DateTime startrenew = DateFormat("yyyy-MM-dd").parse("2022-05-04");
  String date = "";
  int rendifference = 0;
  String locker = "";

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
    final DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('Reservation')
        .doc("${FirebaseAuth.instance.currentUser!.uid}")
        .get();
    // DateTime date = doc2['End Date'].toDate();
    enddate = DateFormat("yyyy-MM-dd").parse(doc['End Date']);
    startrenew = enddate.subtract(Duration(days: 4));
    // print(enddate.toString());

    final DocumentSnapshot doc2 = await FirebaseFirestore.instance
        .collection('Reservation')
        .doc("${FirebaseAuth.instance.currentUser!.uid}")
        .get();

    DateTime startdate = DateFormat("yyyy-MM-dd").parse(doc2["Start Date"]);
    // print(startdate.toString());

    rendifference = enddate.difference(startdate).inSeconds;

    // if (today!.isAfter(startrenew!) && today!.isBefore(enddate!)) {
    //   return true;
    // }
    // return false;
  }

  @override
  Widget build(BuildContext context) {
    canrenew();
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
          // padding: EdgeInsets.all(15),
          // height: 100,
          // width: 200,

          children: [
            Text("you can renew your reservation"),
            Text("before three days of expiration"),
            ElevatedButton(
              child: Text(
                'renew',
                style: TextStyle(fontSize: 22),
              ),
              onPressed: (DateTime.now().isAfter(startrenew) &&
                      DateTime.now().isBefore(enddate))
                  ? () async {
                      DateTime newstart;
                      DateTime newend;

                      final DocumentSnapshot doc = await FirebaseFirestore
                          .instance
                          .collection('Users')
                          .doc("${FirebaseAuth.instance.currentUser!.uid}")
                          .get();
                      String locker = doc['reservedlocker'];
                      print(locker);
//locker != ""
                      if (true) {
                        final DocumentSnapshot doc = await FirebaseFirestore
                            .instance
                            .collection('Reservation')
                            .doc("${FirebaseAuth.instance.currentUser!.uid}")
                            .get();
                        // DateTime date = doc2['End Date'].toDate();
                        DateTime enddate = DateTime.parse(doc['End Date']);
                        DateTime startrenew =
                            enddate.subtract(Duration(days: 3));
                        // print(enddate.toString());

                        final DocumentSnapshot doc2 = await FirebaseFirestore
                            .instance
                            .collection('Reservation')
                            .doc("${FirebaseAuth.instance.currentUser!.uid}")
                            .get();
                        String date = doc2["Start Date"];
                        // print("------------------------");
                        DateTime startdate =
                            DateFormat("yyyy-MM-dd").parse(date);
                        // print(startdate.toString());

                        final Sdifference =
                            enddate.difference(startdate).inSeconds;
                        final Ddifference =
                            enddate.difference(startdate).inDays;
                        // print(Rendifference);

                        if (true) {
                          //تغيير حالة اللوكر  والتمديد فترةالحجز
                          // save dates in firestore
                          newstart = enddate;
                          newend = enddate.add(Duration(days: Ddifference));

                          newdifference = newend.difference(newstart).inSeconds;

                          print(newstart.toString());
                          print(newend.toString());
                          await FirebaseFirestore.instance
                              .collection("Reservation")
                              .doc("${FirebaseAuth.instance.currentUser!.uid}")
                              .update({"End Date": "${newend}"});

                          await FirebaseFirestore.instance
                              .collection("Reservation")
                              .doc("${FirebaseAuth.instance.currentUser!.uid}")
                              .update({"Start Date": "${newstart}"});

                          // make locker available for testing
                          // int testtimer = 10;
                          // Future.delayed(Duration(seconds: testtimer),
                          //     () async {
                          //   //print("object");
                          //   final DocumentSnapshot doc = await FirebaseFirestore
                          //       .instance
                          //       .collection("Reservation")
                          //       .doc(
                          //           "${FirebaseAuth.instance.currentUser!.uid}")
                          //       .get();
                          //   String lname = doc['locker_name'];
                          //   // print(lname);

                          //   await FirebaseFirestore.instance
                          //       .collection("lockers")
                          //       .where("name", isEqualTo: "${lname}")
                          //       .limit(1)
                          //       .get()
                          //       .then((v) {
                          //     v.docs.forEach((el) {
                          //       FirebaseFirestore.instance
                          //           .collection("lockers")
                          //           .doc("${lname}")
                          //           .update({
                          //         "available": true,
                          //       });
                          //     });
                          //   });
                          // });

                          // make lockers unavailable
                          // int testtimer1 = 11;
                          // Rendifference
                          Future.delayed(Duration(seconds: Rendifference),
                              () async {
                            //print("object");
                            final DocumentSnapshot doc = await FirebaseFirestore
                                .instance
                                .collection("Reservation")
                                .doc(
                                    "${FirebaseAuth.instance.currentUser!.uid}")
                                .get();
                            String lname = doc['locker_name'];
                            // print(lname);

                            await FirebaseFirestore.instance
                                .collection("lockers")
                                .where("name", isEqualTo: "${lname}")
                                .limit(1)
                                .get()
                                .then((v) {
                              v.docs.forEach((el) {
                                FirebaseFirestore.instance
                                    .collection("lockers")
                                    .doc("${lname}")
                                    .update({
                                  "available": false,
                                });
                              });
                            });

                            ///////////////////////////////////
                            Resdifference =
                                newend.difference(newstart).inSeconds;

                            Rendifference =
                                newend.difference(newstart).inSeconds + 1;
                            // int testtimer2 = 5;
// Resdifference
                            Future.delayed(Duration(seconds: Resdifference),
                                () async {
                              final DocumentSnapshot doc = await FirebaseFirestore
                                  .instance
                                  .collection('Users')
                                  .doc(
                                      "${FirebaseAuth.instance.currentUser!.uid}")
                                  .get();
                              String locker = doc['reservedlocker'];
                              print(locker);
                              if (true) {
                                final DocumentSnapshot doc = await FirebaseFirestore
                                    .instance
                                    .collection('Users')
                                    .doc(
                                        "${FirebaseAuth.instance.currentUser!.uid}")
                                    .get();
                                String locker = doc['reservedlocker'];
                                print(locker);

                                final DocumentSnapshot doc2 =
                                    await FirebaseFirestore.instance
                                        .collection('Reservation')
                                        .doc(
                                            "${FirebaseAuth.instance.currentUser!.uid}")
                                        .get();
                                // DateTime date = doc2['End Date'].toDate();
                                DateTime date =
                                    DateTime.parse(doc2['End Date']);
                                // print(date);

//
                                if (true) {
                                  final DocumentSnapshot doc =
                                      await FirebaseFirestore.instance
                                          .collection("Reservation")
                                          .doc(
                                              "${FirebaseAuth.instance.currentUser!.uid}")
                                          .get();
                                  String lname = doc['locker_name'];
                                  print(lname);

                                  await FirebaseFirestore.instance
                                      .collection("lockers")
                                      .where("name", isEqualTo: "${lname}")
                                      .limit(1)
                                      .get()
                                      .then((v) {
                                    v.docs.forEach((el) {
                                      FirebaseFirestore.instance
                                          .collection("lockers")
                                          .doc("${lname}")
                                          .update({
                                        "available": true,
                                      });
                                    });
                                  });

                                  await FirebaseFirestore.instance
                                      .collection("Users")
                                      .where("user_id",
                                          isEqualTo:
                                              "${FirebaseAuth.instance.currentUser!.uid}")
                                      .limit(1)
                                      .get()
                                      .then((v) {
                                    v.docs.forEach((el) {
                                      FirebaseFirestore.instance
                                          .collection("Users")
                                          .doc("${lname}")
                                          .update({
                                        "reservedlocker": "",
                                      });
                                    });
                                  });
                                  var rng = new Random();
                                  var code = rng.nextInt(9000) + 1000;
                                  await FirebaseFirestore.instance
                                      .collection("lockers")
                                      .where("name", isEqualTo: "${lname}")
                                      .limit(1)
                                      .get()
                                      .then((v) {
                                    v.docs.forEach((el) {
                                      FirebaseFirestore.instance
                                          .collection("lockers")
                                          .doc("${el.id}")
                                          .update({"pin": "${code}"});
                                    });
                                  });
                                }
                              }
                            });
                            ///////////////////////////////////
                          });
                        }
                      }
                    }
                  : () {},
              style: ButtonStyle(
                  backgroundColor: (DateTime.now().isAfter(startrenew) &&
                          DateTime.now().isBefore(enddate))
                      ? MaterialStateProperty.all(
                          Color.fromRGBO(137, 216, 187, 1))
                      : MaterialStateProperty.all(
                          Color.fromRGBO(178, 190, 181, 1))),
            ),
          ],
        ),
      ),
    );
  }
}

////////////////////////////////////////////////
// class _renewState extends State<renew> {
//   @override
//   Widget build(BuildContext context) {
//     canrenew();
//     return Container(
//       child: RaisedButton(
//         color: (DateTime.now().isAfter(startrenew!) &&
//                 DateTime.now().isBefore(enddate!))
//             ? Colors.white
//             : Colors.grey,
//         splashColor: Colors.black12,
//         onPressed: (DateTime.now().isAfter(startrenew!) &&
//                 DateTime.now().isBefore(enddate!))
//             ? () async {
//                 DateTime newstart;
//                 DateTime newend;

//                 final DocumentSnapshot doc = await FirebaseFirestore.instance
//                     .collection('Users')
//                     .doc("${FirebaseAuth.instance.currentUser!.uid}")
//                     .get();
//                 String locker = doc['reservedlocker'];
//                 print(locker);
// //locker != ""
//                 if (true) {
//                   final DocumentSnapshot doc = await FirebaseFirestore.instance
//                       .collection('Reservation')
//                       .doc("${FirebaseAuth.instance.currentUser!.uid}")
//                       .get();
//                   // DateTime date = doc2['End Date'].toDate();
//                   DateTime enddate = DateTime.parse(doc['End Date']);
//                   DateTime startrenew = enddate.subtract(Duration(days: 3));
//                   // print(enddate.toString());

//                   final DocumentSnapshot doc2 = await FirebaseFirestore.instance
//                       .collection('Reservation')
//                       .doc("${FirebaseAuth.instance.currentUser!.uid}")
//                       .get();
//                   String date = doc2["Start Date"];
//                   // print("------------------------");
//                   DateTime startdate = DateFormat("yyyy-MM-dd").parse(date);
//                   // print(startdate.toString());

//                   final Sdifference = enddate.difference(startdate).inSeconds;
//                   final Ddifference = enddate.difference(startdate).inDays;
//                   // print(Rendifference);

//                   if (true) {
//                     //تغيير حالة اللوكر  والتمديد فترةالحجز
//                     // save dates in firestore
//                     newstart = enddate;
//                     newend = enddate.add(Duration(days: Ddifference));

//                     newdifference = newend.difference(newstart).inSeconds;

//                     print(newstart.toString());
//                     print(newend.toString());
//                     await FirebaseFirestore.instance
//                         .collection("Reservation")
//                         .doc("${FirebaseAuth.instance.currentUser!.uid}")
//                         .update({"End Date": "${newend}"});

//                     await FirebaseFirestore.instance
//                         .collection("Reservation")
//                         .doc("${FirebaseAuth.instance.currentUser!.uid}")
//                         .update({"Start Date": "${newstart}"});
//                     // trying
//                     // Future.delayed(Duration(seconds: Rendifference), () async {
//                     //   //print("object");
//                     //   final DocumentSnapshot doc = await FirebaseFirestore
//                     //       .instance
//                     //       .collection("Reservation")
//                     //       .doc("${FirebaseAuth.instance.currentUser!.uid}")
//                     //       .get();
//                     //   String lname = doc['locker_name'];
//                     //   // print(lname);

//                     //   await FirebaseFirestore.instance
//                     //       .collection("lockers")
//                     //       .where("name", isEqualTo: "${lname}")
//                     //       .limit(1)
//                     //       .get()
//                     //       .then((v) {
//                     //     v.docs.forEach((el) {
//                     //       FirebaseFirestore.instance
//                     //           .collection("lockers")
//                     //           .doc("${lname}")
//                     //           .update({
//                     //         "available": false,
//                     //       });
//                     //     });
//                     //   });
//                     // });

//                     // make lockers unavailable
//                     Future.delayed(Duration(seconds: Rendifference), () async {
//                       //print("object");
//                       final DocumentSnapshot doc = await FirebaseFirestore
//                           .instance
//                           .collection("Reservation")
//                           .doc("${FirebaseAuth.instance.currentUser!.uid}")
//                           .get();
//                       String lname = doc['locker_name'];
//                       // print(lname);

//                       await FirebaseFirestore.instance
//                           .collection("lockers")
//                           .where("name", isEqualTo: "${lname}")
//                           .limit(1)
//                           .get()
//                           .then((v) {
//                         v.docs.forEach((el) {
//                           FirebaseFirestore.instance
//                               .collection("lockers")
//                               .doc("${lname}")
//                               .update({
//                             "available": false,
//                           });
//                         });
//                       });

//                       ///////////////////////////////////
//                       Resdifference = newend.difference(newstart).inSeconds;

//                       Rendifference = newend.difference(newstart).inSeconds + 1;

//                       Future.delayed(Duration(seconds: Resdifference),
//                           () async {
//                         final DocumentSnapshot doc = await FirebaseFirestore
//                             .instance
//                             .collection('Users')
//                             .doc("${FirebaseAuth.instance.currentUser!.uid}")
//                             .get();
//                         String locker = doc['reservedlocker'];
//                         print(locker);
//                         if (true) {
//                           final DocumentSnapshot doc = await FirebaseFirestore
//                               .instance
//                               .collection('Users')
//                               .doc("${FirebaseAuth.instance.currentUser!.uid}")
//                               .get();
//                           String locker = doc['reservedlocker'];
//                           print(locker);

//                           final DocumentSnapshot doc2 = await FirebaseFirestore
//                               .instance
//                               .collection('Reservation')
//                               .doc("${FirebaseAuth.instance.currentUser!.uid}")
//                               .get();
//                           // DateTime date = doc2['End Date'].toDate();
//                           DateTime date = DateTime.parse(doc2['End Date']);
//                           // print(date);

// //
//                           if (true) {
//                             final DocumentSnapshot doc = await FirebaseFirestore
//                                 .instance
//                                 .collection("Reservation")
//                                 .doc(
//                                     "${FirebaseAuth.instance.currentUser!.uid}")
//                                 .get();
//                             String lname = doc['locker_name'];
//                             print(lname);

//                             await FirebaseFirestore.instance
//                                 .collection("lockers")
//                                 .where("name", isEqualTo: "${lname}")
//                                 .limit(1)
//                                 .get()
//                                 .then((v) {
//                               v.docs.forEach((el) {
//                                 FirebaseFirestore.instance
//                                     .collection("lockers")
//                                     .doc("${lname}")
//                                     .update({
//                                   "available": true,
//                                 });
//                               });
//                             });

//                             await FirebaseFirestore.instance
//                                 .collection("Users")
//                                 .where("user_id",
//                                     isEqualTo:
//                                         "${FirebaseAuth.instance.currentUser!.uid}")
//                                 .limit(1)
//                                 .get()
//                                 .then((v) {
//                               v.docs.forEach((el) {
//                                 FirebaseFirestore.instance
//                                     .collection("Users")
//                                     .doc("${lname}")
//                                     .update({
//                                   "reservedlocker": "",
//                                 });
//                               });
//                             });
//                             await FirebaseFirestore.instance
//                                 .collection("lockers")
//                                 .where("name", isEqualTo: "${lname}")
//                                 .limit(1)
//                                 .get()
//                                 .then((v) {
//                               v.docs.forEach((el) {
//                                 FirebaseFirestore.instance
//                                     .collection("lockers")
//                                     .doc("${el.id}")
//                                     .update({"pin": "${code}"});
//                               });
//                             });
//                           }
//                         }
//                       });
//                       ///////////////////////////////////
//                     });
//                   }
//                 }
//               }
//             : () {},
//         child: Text("Renew"),
//       ),
//     );
//   }
// }
