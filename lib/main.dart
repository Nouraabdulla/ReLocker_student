import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:relocker_sa/bloc/cubit/auth_cubit.dart';
import 'package:relocker_sa/controller_view_screen.dart';
import 'package:relocker_sa/start_screen.dart';
import 'package:relocker_sa/utils/bloc_observer.dart';
import 'package:relocker_sa/utils/utils-cache_helper.dart';
import 'bloc/cubit/payment_cubit.dart';

getTheTimeToTriggerEvent() async {
  final DocumentSnapshot doc = await FirebaseFirestore.instance
      .collection('Users')
      .doc("${FirebaseAuth.instance.currentUser!.uid}")
      .get();
  String locker = doc['reservedlocker'];
  print(locker);
  if (locker != "") {
    final DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('Users')
        .doc("${FirebaseAuth.instance.currentUser!.uid}")
        .get();
    String locker = doc['reservedlocker'];
    print(locker);

    final DocumentSnapshot doc2 = await FirebaseFirestore.instance
        .collection('Reservation')
        .doc("${FirebaseAuth.instance.currentUser!.uid}")
        .get();
    // DateTime date = doc2['End Date'].toDate();
    DateTime date = DateTime.parse(doc2['End Date']);
    // print(date);

//
    if (DateTime.now().isAfter(date)) {
      final DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection("Reservation")
          .doc("${FirebaseAuth.instance.currentUser!.uid}")
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
              isEqualTo: "${FirebaseAuth.instance.currentUser!.uid}")
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
    }

//Now use If/Else statement to know, if the current time is same as/or after the
//time set for trigger, then trigger the event,

  }
}

enddate() async {
  final DocumentSnapshot doc2 = await FirebaseFirestore.instance
      .collection('Reservation')
      .doc("${FirebaseAuth.instance.currentUser!.uid}")
      .get();
  // DateTime date = doc2['End Date'].toDate();
  DateTime date = DateTime.parse(doc2['End Date']);

  return date;
}

void main() async {
  DocumentSnapshot doc;
  DocumentSnapshot doc2;
  DateTime edate;

  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  await Firebase.initializeApp();
  await CacheHelper.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  FirebaseAuth _auth = FirebaseAuth.instance;
  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    // DateTime yourTime = enddate();
    // VoidCallback yourAction = getTheTimeToTriggerEvent();
    // Timer(yourTime.difference(DateTime.now()), yourAction);

    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
            create: (context) => AuthCubit()..getUserInfo()),
        BlocProvider<PaymentCubit>(
            create: (context) => PaymentCubit()..getData())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xFF9AD6BD),
          primarySwatch: Colors.blue,
        ),
        home:
            _auth.currentUser != null ? ControllerViewScreen() : StartScreen(),
      ),
    );
  }
}
