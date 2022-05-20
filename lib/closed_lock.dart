import 'dart:async';
import 'dart:math';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_auth/email_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:relocker_sa/Receipt.dart';
import 'package:relocker_sa/apis.dart';
import 'package:relocker_sa/renewpage.dart';
import 'package:firebase_database/firebase_database.dart';

class closed_lock extends StatefulWidget {
  closed_lock({
    Key? key,
  }) : super(key: key);

  @override
  State<closed_lock> createState() => _closed_lockState();
}

String token = "";
String username = "Relockerksu@gmail.com";
String password = "Showk@1234";
bool isLoading = false;

final random = Random();
int randomNumber = random.nextInt(10) * 1000;
String code = "";
String showpin = "Show pin";

///////////////////////
DateTime todayDate = DateFormat("yyyy-MM-dd").parse("2022-05-04");
DateTime startLockerdate = DateFormat("yyyy-MM-dd").parse("2022-05-04");
DateTime enddate = DateFormat("yyyy-MM-dd").parse("2022-05-04");
DateTime startrenew = DateFormat("yyyy-MM-dd").parse("2022-05-04");
int rendifference = 0;
int rendifference2 = 0;
int count = 0;

String locker = '';

class _closed_lockState extends State<closed_lock> {
  User? user = FirebaseAuth.instance.currentUser;
  Map<String, dynamic> datares = {};
//  DataSnapshot snapshot;
  getData() async {
    FirebaseFirestore.instance
        .collection("Reservation")
        .where("Owner", isEqualTo: user!.email)
        .get()
        .then((value) {
      List<DocumentSnapshot<Map<String, dynamic>>> list = value.docs;
      list.forEach((element) async {
        setState(() {
          datares = element.data()!;
          locker = datares['locker_name'];
        });
      });
    });
  }

  Future<void> auth() async {
    isLoading = true;
    setState(() {});
    token = await API().auth(username: username, password: password);
    isLoading = false;
    setState(() {});
  }

//enddate!=todayDate

  String Iddevice1 = "";
  PowerState? st;
  Future<void> setPowerMode(PowerState state) async {
    if (datares['locker_name'] == '6-F-017') {
      Iddevice1 = "626a8518d0fd258c521c829d";
    }
    if (datares['locker_name'] == '6-F-018') {
      Iddevice1 = "626ea0e2d0fd258c521ed9b4";
    }
    st = state;
    isLoading = true;
    setState(() {});
    await API()
        .changeState(
      newState: state,
      token: token,
      deviceId: Iddevice1,
      //"626a8518d0fd258c521c829d"lock1 626ea0e2d0fd258c521ed9b4 lock2
    )
        .catchError((error) {
      isLoading = false;
      setState(() {});
    });
    isLoading = false;
    setState(() {});
  }

  canrenew() async {
    final DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('Reservation')
        .doc("${FirebaseAuth.instance.currentUser!.uid}")
        .get();
    startLockerdate = DateFormat("yyyy-MM-dd").parse(doc['Start Date']);
    enddate = DateFormat("yyyy-MM-dd").parse(doc['End Date']); //.tostring()
    startrenew = enddate.subtract(Duration(days: 3));
    //accepted duration
    rendifference = enddate.difference(startrenew).inMinutes;
    DateTime todayDate = DateFormat("yyyy-MM-dd")
        .parse(DateFormat('yyyy-MM-dd').format(DateTime.now()));
    rendifference2 = enddate.difference(todayDate).inMinutes;
    print('Start ${startLockerdate}');
    print('End ${enddate}');
    print('start ReNew ${startrenew}');
    print('Time ReNew in Minutes ${rendifference}');
    print('Time ReNew in Minutes ${rendifference2}');
    print('Date Today ${todayDate}');

    if (rendifference2 > 0 && rendifference2 < rendifference) {
      Notify();
      AwesomeNotifications().actionStream.listen((ReceivedNotification) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => renew()));
      });
    }
  }

  bool click = false;
  TextEditingController emailCont = new TextEditingController();
  TextEditingController otpCont = new TextEditingController();

  genCode() async {
    final DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection("Reservation")
        .doc("${FirebaseAuth.instance.currentUser!.uid}")
        .get();
    String lname = doc['locker_name'];

    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('${doc['locker_name']}/pin').get();
    if (snapshot.exists) {
      print(snapshot.value);
    } else {
      print('No data available.');
    }
    print(snapshot.value.toString());
    generatorNumber(snapshot.value.toString());
  }

  void generatorNumber(String code) {
    genCodeList.clear();
    for (int i = 0; i < 4; i++) {
      if (i == 0) {
        genCodeList.add('${code.substring(0, 1)}*');
      } else if (i == 1) {
        genCodeList.add('${code.substring(1, 2)}*');
      } else if (i == 2) {
        genCodeList.add('*${code.substring(2, 3)}');
      } else if (i == 3) {
        genCodeList.add('*${code.substring(3)}');
      }
    }
    genCodeList.shuffle();
    print(genCodeList[0]);
    print(genCodeList[1]);
    print(genCodeList[2]);
    print(genCodeList[3]);
  }

  bool showCode = false;
  String code = "1234";
  List<String> genCodeList = ['*', '*', '*', '*'];
  String codeShowString = '**';

  late Timer timer;
  late Timer timer2;

  int start = 10;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    timer2 = new Timer.periodic(
      oneSec,
      (Timer timer) async {
        if (start == 0) {
          setState(() {
            codeShowString = '**';
            timer.cancel();
            start = 10;
          });
        } else if (start == 10) {
          codeShowString = '**';
          setState(() {
            start--;
          });
        } else if (start == 8) {
          codeShowString = genCodeList[0];
          setState(() {
            start--;
          });
        } else if (start == 6) {
          codeShowString = genCodeList[1];
          setState(() {
            start--;
          });
        } else if (start == 4) {
          codeShowString = genCodeList[2];
          setState(() {
            start--;
          });
        } else if (start == 2) {
          codeShowString = genCodeList[3];
          setState(() {
            start--;
          });
        } else {
          start--;
        }
      },
    );
  }

  late EmailAuth emailAuth;

  @override
  void initState() {
    genCode();
    emailAuth = new EmailAuth(sessionName: "ReLocker");
    getData();
    super.initState();
  }

  void sendOtp() async {
    Future.delayed(Duration.zero, () {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("We will send OTP to your email \n loading ... "),
            );
          });
    });

    bool result = await emailAuth.sendOtp(
        recipientMail: "${FirebaseAuth.instance.currentUser!.email}",
        otpLength: 6);
    if (result) {
      Navigator.of(context).pop();
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
                title: Text("Enter code"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: otpCont,
                    ),
                  ],
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () async {
                      verify();
                      if (verify()) {
                        setState(() {
                          showCode = true;
                          otpCont.text = "";
                          startTimer();
                        });
                        Navigator.of(context).pop();

                        Future.delayed(Duration(seconds: 20), () {
                          setState(() {
                            showCode = false;
                          });
                        });
                      } else {
                        Navigator.of(context).pop();

                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("code not correct"),
                              );
                            });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff88d8bb),
                      shape: StadiumBorder(),
                    ),
                    child: Text(
                      "verify",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  )
                ]);
          });
    }
  }

  bool verify() {
    return emailAuth.validateOtp(
        recipientMail: "${FirebaseAuth.instance.currentUser!.email}",
        userOtp: otpCont.text);
  }


  String lock_state = '';
  @override
  Widget build(BuildContext context) {
    canrenew();
    auth();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * .5,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(40)),
                    color:
                        (click == true) ? Color(0xffff7272) : Color(0xff88d8bb),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 1.0,
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => Receipt()));
                      },
                      icon: Icon(
                        Icons.receipt_long_outlined,
                        size: 40,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.width / 2.8,
                        width: MediaQuery.of(context).size.width / 2.8,
                        child: SizedBox(
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {});
                              // Navigator.of(context).pushReplacement(
                              //     MaterialPageRoute(
                              //         builder: (context) => opened_lock()));
                              // DBref.push().set({
                              //   "led": '1',
                              // });
                              // sendData();

                              enddate = DateFormat("yyyy-MM-dd")
                                  .parse(datares['End Date']);
                              DateTime todayDate = DateFormat("yyyy-MM-dd")
                                  .parse(DateFormat('yyyy-MM-dd')
                                      .format(DateTime.now()));
//***** */ make sure of the condition of the locker names it is legal or not -_-******
                              if ((todayDate.isBefore(enddate) ||
                                      todayDate.compareTo(enddate) == 0) &&
                                  (datares['locker_name'] == '6-F-017' ||
                                      datares['locker_name'] == '6-F-018')) {
                                auth();
                                sendData();

                                lock_state = st.toString();

                                click = !click;
                                click
                                    ? setPowerMode(PowerState.On)
                                    : setPowerMode(PowerState.Off);
// if(){

// print(st);
// print(lock_state.substring(11,13));
// }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                shape: const StadiumBorder(),
                                shadowColor: Colors.green),
                            child: Icon(
                              (click == true)
                                  ? Icons.lock_open_rounded
                                  : Icons.lock_outline_rounded,
                              size: 70,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  right: 0,
                  left: 0,
                  bottom: MediaQuery.of(context).size.width / -6,
                ),
              ],
            ),
            SizedBox(
              height: 90,
            ),
            // Expanded(
            // child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  child: ListTile(
                    tileColor: Colors.grey.shade200,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    title: Text(
                      showCode ? codeShowString : "PIN code",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    // subtitle: Text(code),
                    trailing: ElevatedButton(
                      onPressed: showCode
                          ? null
                          : () async {
                              sendOtp();
                            },
                      child: Text(
                        "show",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          decoration: TextDecoration.underline,
                          // backgroundColor: Colors.grey[350],
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey.shade200,
                        shape: const StadiumBorder(),
                        // shadowColor: Colors.green
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "code will showen withing 8 seconds",
                    style: TextStyle(color: Colors.red),
                  ),
                ),

                Text(
                  'Locker Key',
                  style: TextStyle(
                    fontFamily: 'Helvetica Neue',
                    fontSize: 28,
                    color: const Color(0xff000000),
                    height: -18,
                  ),
                  textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: true),
                  textAlign: TextAlign.center,
                ),

                // SizedBox(
                //   width: MediaQuery.of(context).size.width / 4,
                //   height: MediaQuery.of(context).size.width / 8,
                //   child: ElevatedButton(
                //       child: const Text(
                //         'renew',
                //         style: TextStyle(
                //           color: Colors.black87,
                //           fontSize: 18,
                //         ),
                //       ),
                //       style: ElevatedButton.styleFrom(
                //         primary: Color(0xff88d8bb),
                //         shape: const StadiumBorder(),
                //       ),
                //       onPressed: () {
                //         Navigator.of(context).push(
                //             MaterialPageRoute(builder: (context) => renew()));
                //       }),
                // )
              ],
            ),
            // ),
          ],
        ),
      ),
    );
  }

  String l = '';
  final DatabaseReference database =
      FirebaseDatabase.instance.ref().child("/$locker");
  void sendData() async {
    print(locker);
//        DatabaseReference starCountRef =
//         FirebaseDatabase.instance.ref('/FirebaseIOT/led');
// starCountRef.onValue.listen((DatabaseEvent event) {
//      final list = event.snapshot.value;
//      setState(() {
//       // list=data;
//      });
// });
// FirebaseDatabase.instance
//     .ref('/hii/email')
//     .set('sh@gmail.com')
//     .then((_) {
//         // Data saved successfully!
//     })
//     .catchError((error) {
//         // The write failed...
//     });

    final ref = FirebaseDatabase.instance.ref();
    final snapshot =
        await ref.child('${datares['locker_name']}/lock_state').get();
    if (snapshot.exists) {
      print(snapshot.value);
    } else {
      print('No data available.');
    }
    if (snapshot.value == '0') {
      database.update({
        'lock_state': '1', //open lock
      });
    } else if (snapshot.value == '1') {
      database.update({
        'lock_state': '0', //close lock
      });
    }

// final newPostKey =
//         FirebaseDatabase.instance.ref().child('FirebaseIOT').push().key;

//     // Write the new post's data simultaneously in the posts list and the
//     // user's post list.
//     final Map<String, Map> updates = {};
//     updates['/FirebaseIOT/$newPostKey'] = postData;
//   return FirebaseDatabase.instance.ref().update(updates);

    Future.delayed(Duration(seconds: 5), () {
      if (snapshot.value == '0') {
        lock_Notify();
        print('opeeeeeeeeen ahhhhhhh');
      }
    });
  }
}

void Notify() async {
  String timezom = await AwesomeNotifications().getLocalTimeZoneIdentifier();
  await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: 1,
          channelKey: 'key1',
          title: 'Renew',
          body:
              'Three days left for the end of your reservation,\n do you want to renew?'),
      schedule:
          NotificationInterval(interval: 5, timeZone: timezom, repeats: false));
}

void lock_Notify() async {
  String timezom = await AwesomeNotifications().getLocalTimeZoneIdentifier();
  await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 2,
        channelKey: 'key1',
        title: 'warning!',
        body: 'Your locker is open for 15 minutes, don' 't forget to close it.',
      ),
      schedule:
          NotificationInterval(interval: 5, timeZone: timezom, repeats: false));
}
