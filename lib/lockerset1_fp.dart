import 'dart:math';

import 'package:adobe_xd/pinned.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:relocker_sa/payment_view/reservation_details.dart';

import 'controller_view_screen.dart';
import 'home_view.dart';

int Rendifference = 0;
int Resdifference = 0;
String fp1size = "";
String fp2size = "";
String fp3size = "";
String fp4size = "";
String fp5size = "";
String fp6size = "";
String fp7size = "";
String fp8size = "";
String fp9size = "";
String fp10size = "";
String fp11size = "";
String fp12size = "";
String fp13size = "";
String fp14size = "";
String fp15size = "";
String fp16size = "";
String fp17size = "";
String fp18size = "";
String fp19size = "";

Color w = Color.fromARGB(255, 255, 255, 255);
Color g = Color(0xFFA1E2C9);
Color b = Color.fromARGB(255, 10, 10, 10);

class lockerset1_fp extends StatefulWidget {
  final int numberOfWeek;
  final String resId;
  final String startDate;
  final String endDate;
  final String? from;

  lockerset1_fp(
      {Key? key,
      required this.numberOfWeek,
      required this.resId,
      required this.startDate,
      required this.endDate,
      this.from = "1"})
      : super(key: key);

  @override
  State<lockerset1_fp> createState() => _lockerset1_fpState();
}

class _lockerset1_fpState extends State<lockerset1_fp> {
  String mySvg1(color) {
    return '<svg viewBox="249.0 618.1 79.0 122.4" ><path transform="translate(-2194.52, 743.73)" d="M 2522.52490234375 -3.299476623535156 C 2521.978515625 -27.48745727539062 2522.08837890625 -3.299476623535156 2522.08837890625 -3.299476623535156 L 2522.08837890625 -125.671630859375 C 2522.08837890625 -125.671630859375 2443.545166015625 -125.671630859375 2443.545166015625 -125.671630859375 L 2443.545166015625 -52.18785095214844 L 2484.196044921875 -52.18785095214844 L 2484.196044921875 -3.299476623535156 L 2522.52490234375 -3.299476623535156 Z" fill="#$color" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
  }

  String mySvg2(color) {
    return '<svg viewBox="249.1 690.3 78.9 125.7" ><path transform="translate(-2194.24, 816.18)" d="M 2443.54541015625 -125.6716384887695 C 2443.5869140625 -123.7803497314453 2443.677490234375 -126.4785385131836 2443.54541015625 -125.6716384887695 C 2443.53173828125 -123.8471298217773 2443.54541015625 -124.5504608154297 2443.54541015625 -124.5504608154297 L 2443.980224609375 -0.175445556640625 C 2443.980224609375 -0.1754300594329834 2522.24072265625 -0.175445556640625 2522.24072265625 -0.175445556640625 L 2522.24072265625 -75.53519439697266 L 2483.88623046875 -75.53519439697266 L 2483.88623046875 -124.5504608154297 L 2443.29638671875 -124.5504608154297 L 2443.54541015625 -124.5504608154297 L 2443.54541015625 -125.6716384887695 Z" fill="#$color" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
  }

  // setLockerAvailable() {
  //   FirebaseFirestore.instance.collection("lockers").get().then((value) {
  //     value.docs.forEach((element) {
  //       FirebaseFirestore.instance
  //           .collection("lockers")
  //           .doc(element.id)
  //           .update({"available": true});
  //     });
  //   });
  // }

  checkAvailableLockers() {
    // setLockerAvailable();
    var today = DateTime.now();
    FirebaseFirestore.instance.collection("Reservation").get().then((value) {
      List<DocumentSnapshot<Map<String, dynamic>>> list = value.docs;
      list.forEach((element) async {
        Map<String, dynamic> data = element.data()!;
        DateTime endDate =
            DateFormat("yyyy-MM-dd").parse(data["End Date"].toString());

        var d = (today.difference(endDate).inHours / 24).round();

        if (d > 0) {
          await FirebaseFirestore.instance
              .collection("lockers")
              .where("name", isEqualTo: "${data['locker_name']}")
              .limit(1)
              .get()
              .then((v) {
            v.docs.forEach((el) {
              FirebaseFirestore.instance
                  .collection("lockers")
                  .doc("${el.id}")
                  .set({"available": true}, SetOptions(merge: true));
            });
          });
          await FirebaseFirestore.instance
              .collection("Reservation")
              .where("locker_name", isEqualTo: "${data['locker_name']}")
              .get()
              .then((vl) {
            vl.docs.forEach((ele) {
              FirebaseFirestore.instance
                  .collection("Reservation")
                  .doc("${ele.id}")
                  .set({"locker_name": ""}, SetOptions(merge: true));
            });
          });
        }
      });
    });
  }

  showLocker(context, text, size) {
    //display lockers
    showModalBottomSheet<void>(
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16.0))),
        builder: (BuildContext context) {
          return Container(
            //color: Colors.amber,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          "Choose the locker that suits you",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        ListTile(
                          title: Text("Not Available"),
                          leading: Icon(Icons.circle, color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    //display lockers
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('lockers')
                          .where("block", isEqualTo: text)
                          .orderBy("name")
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return Text('Something went wrong');
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }

                        return Center(
                          child: size == "s"
                              ? GridView.builder(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.all(16.0),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 4,
                                          childAspectRatio: 3 / 4),
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder: (context, index) {
                                    Map<String, dynamic> data =
                                        snapshot.data!.docs[index].data()!
                                            as Map<String, dynamic>;
                                    return GestureDetector(
                                        onTap: data['available']
                                            ? () async {
                                                var rslp = 125;
                                                var rllp = 150;
                                                var fslp = 15;
                                                var fllp = 25;
                                                print(data);

                                                var locker_type = data['type'];
                                                var locker_size = data['size'];
                                                int total;
                                                if (locker_type == "r") {
                                                  if (locker_size == "s") {
                                                    print(rslp);
                                                    total = rslp;
                                                  } else {
                                                    print(rllp);
                                                    total = rllp;
                                                  }
                                                } else {
                                                  if (locker_size == "s") {
                                                    print(fslp *
                                                        widget.numberOfWeek);
                                                    total = fslp *
                                                        widget.numberOfWeek;
                                                  } else {
                                                    print(fllp *
                                                        widget.numberOfWeek);
                                                    total = fllp *
                                                        widget.numberOfWeek;
                                                  }
                                                }

                                                var rng = new Random();
                                                var code =
                                                    rng.nextInt(9000) + 1000;

                                                String lockername =
                                                    data['name'];

                                                String startDate =
                                                    widget.startDate;
                                                String endDate = widget.endDate;

                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ReservationDetails(
                                                                priceOneWeek:
                                                                    fslp,
                                                                typelocker:
                                                                    locker_type,
                                                                lockerSize:
                                                                    locker_size,
                                                                startDate: widget
                                                                    .startDate,
                                                                endDate: widget
                                                                    .endDate,
                                                                resId: widget
                                                                    .resId,
                                                                totalPrice:
                                                                    total,
                                                                lockerName:
                                                                    lockername)));
                                              }
                                            : () {},
                                        child: Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              color: data['available']
                                                  ? Colors.green.shade200
                                                  : Colors.grey,
                                              border: Border.all(
                                                  width: 1,
                                                  color: Colors.grey)),
                                          child: Text("${data['name']}"),
                                        ));
                                  },
                                )
                              : GridView.builder(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.all(16.0),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 4,
                                          childAspectRatio: 1 / 2.20),
                                  itemCount:
                                      (snapshot.data!.docs.length ~/ 2).toInt(),
                                  itemBuilder: (context, index) {
                                    Map<String, dynamic> data1 =
                                        snapshot.data!.docs[index * 2].data()!
                                            as Map<String, dynamic>;
                                    Map<String, dynamic> data2 = snapshot
                                        .data!.docs[index * 2 + 1]
                                        .data()! as Map<String, dynamic>;

                                    return Container(
                                      width: 80.0,
                                      height: 200,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            top: 0,
                                            child: GestureDetector(
                                              onTap: data1['available']
                                                  ? () async {
                                                      var rslp = 125;
                                                      var rllp = 150;
                                                      var fslp = 15;
                                                      var fllp = 25;
                                                      print(data1);

                                                      var locker_type =
                                                          data1['type'];
                                                      var locker_size =
                                                          data1['size'];

                                                      int total;
                                                      if (locker_type == "r") {
                                                        if (locker_size ==
                                                            "s") {
                                                          print(rslp);
                                                          total = rslp;
                                                        } else {
                                                          print(rllp);
                                                          total = rllp;
                                                        }
                                                      } else {
                                                        if (locker_size ==
                                                            "s") {
                                                          print(fslp *
                                                              widget
                                                                  .numberOfWeek);
                                                          total = fslp *
                                                              widget
                                                                  .numberOfWeek;
                                                        } else {
                                                          print(fllp *
                                                              widget
                                                                  .numberOfWeek);
                                                          total = fllp *
                                                              widget
                                                                  .numberOfWeek;
                                                        }
                                                      }

                                                      var rng = new Random();
                                                      var code =
                                                          rng.nextInt(9000) +
                                                              1000;

                                                      String lockername =
                                                          data1['name'];

                                                      String startDate =
                                                          widget.startDate;
                                                      String endDate =
                                                          widget.endDate;

                                                      Navigator.of(context).push(MaterialPageRoute(
                                                          builder: (context) =>
                                                              ReservationDetails(
                                                                  priceOneWeek:
                                                                      fllp,
                                                                  typelocker:
                                                                      locker_type,
                                                                  lockerSize:
                                                                      locker_size,
                                                                  startDate: widget
                                                                      .startDate,
                                                                  endDate: widget
                                                                      .endDate,
                                                                  resId: widget
                                                                      .resId,
                                                                  totalPrice:
                                                                      total,
                                                                  lockerName:
                                                                      lockername)));
                                                    }
                                                  : () {},
                                              child: Container(
                                                child: Stack(
                                                  children: [
                                                    SvgPicture.string(
                                                      mySvg1(data1["available"]
                                                          ? "FFA5D6A7"
                                                          : "FF9E9E9E"),
                                                      allowDrawingOutsideViewBox:
                                                          true,
                                                      fit: BoxFit.fill,
                                                    ),
                                                    Text(
                                                      "${data1['name']}",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.black),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 0,
                                            child: GestureDetector(
                                              onTap: data2['available']
                                                  ? () async {
                                                      var rslp = 125;
                                                      var rllp = 150;
                                                      var fslp = 15;
                                                      var fllp = 25;
                                                      print(data2);

                                                      var locker_type =
                                                          data2['type'];
                                                      var locker_size =
                                                          data2['size'];

                                                      int total;
                                                      if (locker_type == "r") {
                                                        if (locker_size ==
                                                            "s") {
                                                          print(rslp);
                                                          total = rslp;
                                                        } else {
                                                          print(rllp);
                                                          total = rllp;
                                                        }
                                                      } else {
                                                        if (locker_size ==
                                                            "s") {
                                                          print(fslp *
                                                              widget
                                                                  .numberOfWeek);
                                                          total = fslp *
                                                              widget
                                                                  .numberOfWeek;
                                                        } else {
                                                          print(fllp *
                                                              widget
                                                                  .numberOfWeek);
                                                          total = fllp *
                                                              widget
                                                                  .numberOfWeek;
                                                        }
                                                      }

                                                      var rng = new Random();
                                                      var code =
                                                          rng.nextInt(9000) +
                                                              1000;

                                                      String lockername =
                                                          data2['name'];

                                                      String startDate =
                                                          widget.startDate;
                                                      String endDate =
                                                          widget.endDate;

                                                      Navigator.of(context).push(MaterialPageRoute(
                                                          builder: (context) =>
                                                              ReservationDetails(
                                                                  priceOneWeek:
                                                                      fllp,
                                                                  typelocker:
                                                                      locker_type,
                                                                  lockerSize:
                                                                      locker_size,
                                                                  startDate: widget
                                                                      .startDate,
                                                                  endDate: widget
                                                                      .endDate,
                                                                  resId: widget
                                                                      .resId,
                                                                  totalPrice:
                                                                      total,
                                                                  lockerName:
                                                                      lockername)));
                                                    }
                                                  : () {},
                                              child: Container(
                                                  child: Stack(
                                                children: [
                                                  SvgPicture.string(
                                                    mySvg2(data2["available"]
                                                        ? "FFA5D6A7"
                                                        : "FF9E9E9E"),
                                                    allowDrawingOutsideViewBox:
                                                        true,
                                                    fit: BoxFit.fill,
                                                  ),
                                                  Positioned(
                                                    bottom: 0,
                                                    child: Text(
                                                      "${data2['name']}",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.black),
                                                    ),
                                                  )
                                                ],
                                              )),
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  }),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

//get new block data
  checkAvailableblockes() async {
    final DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('zones')
        .doc("fpzone") //zone
        .get();

    setState(() {
      fp1size = doc['fp1size'];
      fp2size = doc['fp2size'];
      fp3size = doc['fp3size'];
      fp4size = doc['fp4size'];
      fp5size = doc['fp5size'];
      fp6size = doc['fp6size'];
      fp7size = doc['fp7size'];
      fp8size = doc['fp8size'];
      fp9size = doc['fp9size'];
      fp10size = doc['fp10size'];
      fp11size = doc['fp11size'];
      fp12size = doc['fp12size'];
      fp13size = doc['fp13size'];
      fp14size = doc['fp14size'];
      fp15size = doc['fp15size'];
      fp16size = doc['fp16size'];
      fp17size = doc['fp17size'];
      fp18size = doc['fp18size'];
      fp19size = doc['fp19size'];
      //اكمل باقي البلوكس لهذا الزون
    });
    // gg0size = doc['gg0size'];
  }

  @override
  void initState() {
    checkAvailableblockes();
    // getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        backgroundColor: const Color(0xff88d8bb),
        title: Text("Choose set of lockers"),
        centerTitle: true,
        foregroundColor: Colors.black,
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
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
            Pin(size: 23.1, middle: 0.2295),
            Pin(size: 16.0, start: 50), // lockrr5
            child: Transform.rotate(
              angle: 1.5708,
              child: GestureDetector(
                onTap: () {
                  // showLocker(context, "fg5", "l");
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff88d8bb),
                    border:
                        Border.all(width: 0.3, color: const Color(0xff000000)),
                  ),
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 200.1, middle: 0.6295),
            Pin(size: 20.0, start: 50),
            child: Text('Represents a set of lockers',
                style: TextStyle(
                  fontSize: 15,
                )),
          ),
          Pinned.fromPins(
            Pin(size: 323.0, middle: 0.5618),
            Pin(start: 109.0, end: 0.0),
            child: Scrollbar(
              child: SingleChildScrollView(
                child: SizedBox(
                  width: 323.0,
                  height: 800.0,
                  child: Stack(
                    children: <Widget>[
                      //--------------- map ------------------
                      Pinned.fromPins(
                        Pin(size: 66.9, start: 40.2),
                        Pin(size: 102.3, start: 317), //54
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffbe97c3),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 95.1, start: 106),
                        Pin(size: 69.4, start: 350), //55
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffbe97c3),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 66.9, start: 40.2),
                        Pin(size: 61.7, start: 236), //53
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffbe97c3),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 66.9, start: 40.2),
                        Pin(size: 156.6, start: 11.4), // 50
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffbe97c3),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 142.0, end: 40.9),
                        Pin(size: 251.5, start: 73.4), //48,51
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffbe97c3),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 61.6, middle: 0.5362), // above 48,51
                        Pin(size: 63.2, start: 11.4),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffbe97c3),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 93.3, end: 29.7),
                        Pin(size: 69.4, start: 350), //56
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffbe97c3),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 53.0, middle: 0.8045),
                        Pin(size: 16.0, start: 380),
                        child: Text(
                          '6F56',
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 14,
                            color: const Color(0xff1c0000),
                            height: 3.142857142857143,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 53.0, middle: 0.4823),
                        Pin(size: 16.0, start: 380),
                        child: Text(
                          '6F55',
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 14,
                            color: const Color(0xff1c0000),
                            height: 3.142857142857143,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 53.0, start: 45.7),
                        Pin(size: 16.0, start: 370),
                        child: Text(
                          '6F54',
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 14,
                            color: const Color(0xff1c0000),
                            height: 3.142857142857143,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 65.0, start: 42.1),
                        Pin(size: 16.0, start: 270),
                        child: Text(
                          '6F53',
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 14,
                            color: const Color(0xff1c0000),
                            height: 3.142857142857143,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 65.0, start: 40.0),
                        Pin(size: 16.0, start: 90),
                        child: Text(
                          '6F50',
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 14,
                            color: const Color(0xff1c0000),
                            height: 3.142857142857143,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 53.0, middle: 0.5547),
                        Pin(size: 16.0, start: 220),
                        child: Text(
                          '6F51',
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 14,
                            color: const Color(0xff1c0000),
                            height: 3.142857142857143,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 53.0, end: 44.0),
                        Pin(size: 16.0, start: 130),
                        child: Text(
                          '6F48',
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 14,
                            color: const Color(0xff1c0000),
                            height: 3.142857142857143,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 66.9, start: 40.2),
                        Pin(size: 70.4, start: 167), //52
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffbe97c3),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 65.0, start: 41.1),
                        Pin(size: 16.0, start: 195),
                        child: Text(
                          '6F52',
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 14,
                            color: const Color(0xff1c0000),
                            height: 3.142857142857143,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 66.9, start: 40.2),
                        Pin(size: 20.3, start: 297), // Exit
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff7dd871),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 42.0, middle: 0.1789),
                        Pin(size: 14.0, start: 300),
                        child: Text(
                          'Exit',
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 12,
                            color: const Color(0xffffffff),
                            height: 3.6666666666666665,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 71.0, middle: 0.5561),
                        Pin(size: 60.7, start: 73.4), // grey area
                        child: Transform.rotate(
                          angle: 3.1416,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffe4e4e4),
                              border: Border.all(
                                  width: 0.5, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 53.0, start: 140),
                        Pin(size: 19.0, start: 306), //wc
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffe4e4e4),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.0, start: 155),
                        Pin(size: 15.0, start: 308),
                        child: Text(
                          'WC',
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 12,
                            color: const Color(0xff000000),
                            fontWeight: FontWeight.w500,
                            height: 3.6666666666666665,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 20.5, end: 40.7),
                        Pin(size: 42.0, start: 283), // small grey
                        child: Transform.rotate(
                          angle: 3.1416,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffe4e4e4),
                              border: Border.all(
                                  width: 0.5, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 71.0, end: 39.6),
                        Pin(size: 54.7, start: 222), // white area
                        child: Transform.rotate(
                          angle: 3.1416,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 21.1, end: 22.1),
                        Pin(size: 16.0, start: 75.4), // locker1
                        child: Transform.rotate(
                          angle: 1.5708,
                          child: GestureDetector(
                            onTap: () {
                              if (fp1size == "") {
                              } else {
                                showLocker(context, "fp1", fp1size);
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: fp1size == "" ? w : g,
                                border: Border.all(
                                    width: 0.3, color: fp1size == "" ? w : b),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 21.1, end: 22.1),
                        Pin(size: 16.0, start: 95.4), //locker2
                        child: Transform.rotate(
                          angle: 1.5708,
                          child: GestureDetector(
                            onTap: () {
                              if (fp2size == "") {
                              } else {
                                showLocker(context, "fp2", fp2size);
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: fp2size == "" ? w : g,
                                border: Border.all(
                                    width: 0.3, color: fp2size == "" ? w : b),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 21.1, end: 22.1),
                        Pin(size: 16.0, start: 115.4), // locker3
                        child: Transform.rotate(
                          angle: 1.5708,
                          child: GestureDetector(
                            onTap: () {
                              if (fp3size == "") {
                              } else {
                                showLocker(context, "fp3", fp3size);
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: fp3size == "" ? w : g,
                                border: Border.all(
                                    width: 0.3, color: fp3size == "" ? w : b),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 21.1, end: 22.1),
                        Pin(size: 16.0, start: 143.4), // locker4
                        child: Transform.rotate(
                          angle: 1.5708,
                          child: GestureDetector(
                            onTap: () {
                              if (fp4size == "") {
                              } else {
                                showLocker(context, "fp4", fp4size);
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: fp4size == "" ? w : g,
                                border: Border.all(
                                    width: 0.3, color: fp4size == "" ? w : b),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 21.1, end: 22.1),
                        Pin(size: 16.0, start: 163.4), // locker5
                        child: Transform.rotate(
                          angle: 1.5708,
                          child: GestureDetector(
                            onTap: () {
                              if (fp5size == "") {
                              } else {
                                showLocker(context, "fp5", fp5size);
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: fp5size == "" ? w : g,
                                border: Border.all(
                                    width: 0.3, color: fp5size == "" ? w : b),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 21.1, end: 22.1),
                        Pin(size: 16.0, start: 183.4), // locker6
                        child: Transform.rotate(
                          angle: 1.5708,
                          child: GestureDetector(
                            onTap: () {
                              if (fp6size == "") {
                              } else {
                                showLocker(context, "fp6", fp6size);
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: fp6size == "" ? w : g,
                                border: Border.all(
                                    width: 0.3, color: fp6size == "" ? w : b),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 21.1, end: 22.1),
                        Pin(size: 16.0, start: 203.4), // locker7
                        child: Transform.rotate(
                          angle: 1.5708,
                          child: GestureDetector(
                            onTap: () {
                              if (fp7size == "") {
                              } else {
                                showLocker(context, "fp7", fp7size);
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: fp7size == "" ? w : g,
                                border: Border.all(
                                    width: 0.3, color: fp7size == "" ? w : b),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 21.1, end: 45.1),
                        Pin(size: 16.0, start: 221), // locker8
                        child: Transform.rotate(
                          angle: 0,
                          child: GestureDetector(
                            onTap: () {
                              if (fp8size == "") {
                              } else {
                                showLocker(context, "fp8", fp8size);
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: fp8size == "" ? w : g,
                                border: Border.all(
                                    width: 0.3, color: fp8size == "" ? w : b),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 21.1, end: 65.1),
                        Pin(size: 16.0, start: 221), // locker9
                        child: Transform.rotate(
                          angle: 0,
                          child: GestureDetector(
                            onTap: () {
                              if (fp9size == "") {
                              } else {
                                showLocker(context, "fp9", fp9size);
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: fp9size == "" ? w : g,
                                border: Border.all(
                                    width: 0.3, color: fp9size == "" ? w : b),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 21.1, end: 92),
                        Pin(size: 16.0, start: 241), // locker10
                        child: Transform.rotate(
                          angle: 1.5708,
                          child: GestureDetector(
                            onTap: () {
                              if (fp10size == "") {
                              } else {
                                showLocker(context, "fp10", fp10size);
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: fp10size == "" ? w : g,
                                border: Border.all(
                                    width: 0.3, color: fp10size == "" ? w : b),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 21.1, end: 65.1),
                        Pin(size: 16.0, start: 261), // locker11
                        child: Transform.rotate(
                          angle: 0,
                          child: GestureDetector(
                            onTap: () {
                              if (fp11size == "") {
                              } else {
                                showLocker(context, "fp11", fp11size);
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: fp11size == "" ? w : g,
                                border: Border.all(
                                    width: 0.3, color: fp11size == "" ? w : b),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 21.1, end: 45.1),
                        Pin(size: 16.0, start: 261), // locker12
                        child: Transform.rotate(
                          angle: 0,
                          child: GestureDetector(
                            onTap: () {
                              if (fp12size == "") {
                              } else {
                                showLocker(context, "fp12", fp12size);
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: fp12size == "" ? w : g,
                                border: Border.all(
                                    width: 0.3, color: fp12size == "" ? w : b),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 21.1, end: 181),
                        Pin(size: 16.0, start: 75.4), // locker13
                        child: Transform.rotate(
                          angle: 1.5708,
                          child: GestureDetector(
                            onTap: () {
                              if (fp13size == "") {
                              } else {
                                showLocker(context, "fp13", fp13size);
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: fp13size == "" ? w : g,
                                border: Border.all(
                                    width: 0.3, color: fp13size == "" ? w : b),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 21.1, end: 181),
                        Pin(size: 16.0, start: 95.4), // locker14
                        child: Transform.rotate(
                          angle: 1.5708,
                          child: GestureDetector(
                            onTap: () {
                              if (fp14size == "") {
                              } else {
                                showLocker(context, "fp14", fp14size);
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: fp14size == "" ? w : g,
                                border: Border.all(
                                    width: 0.3, color: fp14size == "" ? w : b),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 21.1, end: 181),
                        Pin(size: 16.0, start: 115.4), // locker15
                        child: Transform.rotate(
                          angle: 1.5708,
                          child: GestureDetector(
                            onTap: () {
                              if (fp15size == "") {
                              } else {
                                showLocker(context, "fp15", fp15size);
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: fp15size == "" ? w : g,
                                border: Border.all(
                                    width: 0.3, color: fp15size == "" ? w : b),
                              ),
                            ),
                          ),
                        ),
                      ),

                      Pinned.fromPins(
                        Pin(size: 21.1, end: 100.1),
                        Pin(size: 16.0, start: 325), // locker16
                        child: Transform.rotate(
                          angle: 0,
                          child: GestureDetector(
                            onTap: () {
                              if (fp16size == "") {
                              } else {
                                showLocker(context, "fp16", fp16size);
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: fp16size == "" ? w : g,
                                border: Border.all(
                                    width: 0.3, color: fp16size == "" ? w : b),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 21.1, end: 80.1),
                        Pin(size: 16.0, start: 325), // locker17
                        child: Transform.rotate(
                          angle: 0,
                          child: GestureDetector(
                            onTap: () {
                              if (fp17size == "") {
                              } else {
                                showLocker(context, "fp17", fp17size);
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: fp17size == "" ? w : g,
                                border: Border.all(
                                    width: 0.3, color: fp17size == "" ? w : b),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 21.1, end: 60.1),
                        Pin(size: 16.0, start: 325), // locker18
                        child: Transform.rotate(
                          angle: 0,
                          child: GestureDetector(
                            onTap: () {
                              if (fp18size == "") {
                              } else {
                                showLocker(context, "fp18", fp18size);
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: fp18size == "" ? w : g,
                                border: Border.all(
                                    width: 0.3, color: fp18size == "" ? w : b),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
