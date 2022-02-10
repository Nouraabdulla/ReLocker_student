import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:relocker_sa/lockerset1_fg.dart';

import 'main.dart';

class renew extends StatefulWidget {
  const renew({Key? key}) : super(key: key);

  @override
  _renewState createState() => _renewState();
}

int? newdifference;

class _renewState extends State<renew> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        color: Colors.white,
        splashColor: Colors.black12,
        onPressed: () async {
          final DocumentSnapshot doc = await FirebaseFirestore.instance
              .collection('Users')
              .doc("${FirebaseAuth.instance.currentUser!.uid}")
              .get();
          String locker = doc['reservedlocker'];
          print(locker);
//locker != ""
          if (true) {
            final DocumentSnapshot doc = await FirebaseFirestore.instance
                .collection('Reservation')
                .doc("${FirebaseAuth.instance.currentUser!.uid}")
                .get();
            // DateTime date = doc2['End Date'].toDate();
            DateTime enddate = DateTime.parse(doc['End Date']);
            // print(enddate.toString());

            final DocumentSnapshot doc2 = await FirebaseFirestore.instance
                .collection('Reservation')
                .doc("${FirebaseAuth.instance.currentUser!.uid}")
                .get();
            String date = doc2["Start Date"];
            // print("------------------------");
            DateTime startdate = DateFormat("yyyy-MM-dd").parse(date);
            // print(startdate.toString());

            final difference = enddate.difference(startdate).inSeconds;
            // print(Rendifference);

            // save dates in firestore§§§§§
            // assign new value again

            // make lockers available

            // unavailable in the new end date
            // print(difference + 1);

            Future.delayed(Duration(seconds: Rendifference), () async {
              print("object");

              // final DocumentSnapshot doc = await FirebaseFirestore.instance
              //     .collection('Users')
              //     .doc("${FirebaseAuth.instance.currentUser!.uid}")
              //     .get();
              // String locker = doc['reservedlocker'];
              // print(locker);
              // if (locker != "") {
              // final DocumentSnapshot doc = await FirebaseFirestore.instance
              //     .collection('Users')
              //     .doc("${FirebaseAuth.instance.currentUser!.uid}")
              //     .get();
              // String locker = doc['reservedlocker'];
              // // print(locker);

              // final DocumentSnapshot doc2 = await FirebaseFirestore.instance
              //     .collection('Reservation')
              //     .doc("${FirebaseAuth.instance.currentUser!.uid}")
              //     .get();
              // // DateTime date = doc2['End Date'].toDate();
              // DateTime date = DateTime.parse(doc2['End Date']);
              // print(date);

              // if (DateTime.now().isAfter(date)) {
              final DocumentSnapshot doc = await FirebaseFirestore.instance
                  .collection("Reservation")
                  .doc("${FirebaseAuth.instance.currentUser!.uid}")
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

              // await FirebaseFirestore.instance
              //     .collection("Users")
              //     .where("user_id",
              //         isEqualTo: "${FirebaseAuth.instance.currentUser!.uid}")
              //     .limit(1)
              //     .get()
              //     .then((v) {
              //   v.docs.forEach((el) {
              //     FirebaseFirestore.instance
              //         .collection("Users")
              //         .doc("${lname}")
              //         .update({
              //       "reservedlocker": "",
              //     });
              //   });
              // });
              // }

//Now use If/Else statement to know, if the current time is same as/or after the
//time set for trigger, then trigger the event,

              //   }
            });

            DateTime newstart = enddate;
            DateTime newend = enddate.add(Duration(days: difference));

            newdifference = newend.difference(newstart).inSeconds;

            print(newstart.toString());
            print(newend.toString());
            await FirebaseFirestore.instance
                .collection("Reservation")
                .where("user_id",
                    isEqualTo: "${FirebaseAuth.instance.currentUser!.uid}")
                .limit(1)
                .get()
                .then((v) {
              v.docs.forEach((el) {
                FirebaseFirestore.instance
                    .collection("Reservation")
                    .doc("${el.id}")
                    .update({"End Date": "${newend}"});
              });
            });

            await FirebaseFirestore.instance
                .collection("Reservation")
                .where("user_id",
                    isEqualTo: "${FirebaseAuth.instance.currentUser!.uid}")
                .limit(1)
                .get()
                .then((v) {
              v.docs.forEach((el) {
                FirebaseFirestore.instance
                    .collection("Reservation")
                    .doc("${el.id}")
                    .update({"Start Date": "${newstart}"});
              });
            });
          }

//           Future.delayed(Duration(seconds: newdifference), () async {
//             final DocumentSnapshot doc = await FirebaseFirestore.instance
//                 .collection('Users')
//                 .doc("${FirebaseAuth.instance.currentUser!.uid}")
//                 .get();
//             String locker = doc['reservedlocker'];
//             print(locker);
//             if (locker != "") {
//               final DocumentSnapshot doc = await FirebaseFirestore.instance
//                   .collection('Users')
//                   .doc("${FirebaseAuth.instance.currentUser!.uid}")
//                   .get();
//               String locker = doc['reservedlocker'];
//               print(locker);

//               final DocumentSnapshot doc2 = await FirebaseFirestore.instance
//                   .collection('Reservation')
//                   .doc("${FirebaseAuth.instance.currentUser!.uid}")
//                   .get();
//               // DateTime date = doc2['End Date'].toDate();
//               DateTime date = DateTime.parse(doc2['End Date']);
//               // print(date);

// //
//               if (DateTime.now().isAfter(date)) {
//                 final DocumentSnapshot doc = await FirebaseFirestore.instance
//                     .collection("Reservation")
//                     .doc("${FirebaseAuth.instance.currentUser!.uid}")
//                     .get();
//                 String lname = doc['locker_name'];
//                 print(lname);

//                 await FirebaseFirestore.instance
//                     .collection("lockers")
//                     .where("name", isEqualTo: "${lname}")
//                     .limit(1)
//                     .get()
//                     .then((v) {
//                   v.docs.forEach((el) {
//                     FirebaseFirestore.instance
//                         .collection("lockers")
//                         .doc("${lname}")
//                         .update({
//                       "available": true,
//                     });
//                   });
//                 });

//                 await FirebaseFirestore.instance
//                     .collection("Users")
//                     .where("user_id",
//                         isEqualTo: "${FirebaseAuth.instance.currentUser!.uid}")
//                     .limit(1)
//                     .get()
//                     .then((v) {
//                   v.docs.forEach((el) {
//                     FirebaseFirestore.instance
//                         .collection("Users")
//                         .doc("${lname}")
//                         .update({
//                       "reservedlocker": "",
//                     });
//                   });
//                 });
//               }

// //Now use If/Else statement to know, if the current time is same as/or after the
// //time set for trigger, then trigger the event,

//             }
//           });
        },
        child: Text("Nouvelle Texte"),
      ),
    );
  }
}
