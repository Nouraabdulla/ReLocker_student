import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:adobe_xd/blend_mask.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:relocker_sa/payment_view/reservation_details.dart';

import 'addblock.dart';
import 'calc_pay_page.dart';
import 'controller_admin.dart';
import 'controller_view_screen.dart';
import 'home_view.dart';
import 'main.dart';

int Rendifference = 0;
int Resdifference = 0;
String fg1size = "";
String fg2size = "";
String fg3size = "";
String fg4size = "";
String fg5size = "";
String fg6size = "";
String fg7size = "";
String fg8size = "";
String fg9size = "";
String fg10size = "";
String fg11size = "";
String fg12size = "";
String fg13size = "";
String fg14size = "";
String fg15size = "";
String fg16size = "";

Color w = Color.fromARGB(255, 164, 161, 161);
Color g = Color(0xFFA1E2C9);
Color b = Color.fromARGB(255, 10, 10, 10);

class editfgzone extends StatefulWidget {
  final String? option;

  editfgzone({
    Key? key,
    this.option = "",
  }) : super(key: key);

  @override
  State<editfgzone> createState() => _editfgzoneState();
}

class _editfgzoneState extends State<editfgzone> {
  String mySvg1(color) {
    return '<svg viewBox="249.0 618.1 79.0 122.4" ><path transform="translate(-2194.52, 743.73)" d="M 2522.52490234375 -3.299476623535156 C 2521.978515625 -27.48745727539062 2522.08837890625 -3.299476623535156 2522.08837890625 -3.299476623535156 L 2522.08837890625 -125.671630859375 C 2522.08837890625 -125.671630859375 2443.545166015625 -125.671630859375 2443.545166015625 -125.671630859375 L 2443.545166015625 -52.18785095214844 L 2484.196044921875 -52.18785095214844 L 2484.196044921875 -3.299476623535156 L 2522.52490234375 -3.299476623535156 Z" fill="#$color" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
  }

  String mySvg2(color) {
    return '<svg viewBox="249.1 690.3 78.9 125.7" ><path transform="translate(-2194.24, 816.18)" d="M 2443.54541015625 -125.6716384887695 C 2443.5869140625 -123.7803497314453 2443.677490234375 -126.4785385131836 2443.54541015625 -125.6716384887695 C 2443.53173828125 -123.8471298217773 2443.54541015625 -124.5504608154297 2443.54541015625 -124.5504608154297 L 2443.980224609375 -0.175445556640625 C 2443.980224609375 -0.1754300594329834 2522.24072265625 -0.175445556640625 2522.24072265625 -0.175445556640625 L 2522.24072265625 -75.53519439697266 L 2483.88623046875 -75.53519439697266 L 2483.88623046875 -124.5504608154297 L 2443.29638671875 -124.5504608154297 L 2443.54541015625 -124.5504608154297 L 2443.54541015625 -125.6716384887695 Z" fill="#$color" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
  }

  checkAvailableLockers() {
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
                          "select a locker to mark it as under maintenenace",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        ListTile(
                          title: Text("Not Available"),
                          leading: Icon(Icons.circle, color: Colors.grey),
                        ),
                        ListTile(
                          title: Text("Under Maintenance"),
                          leading: Icon(Icons.circle,
                              color: Colors.redAccent.shade100),
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
                                                //make an available locker under maintanance
                                                showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return Container(
                                                        clipBehavior:
                                                            Clip.hardEdge,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30)),
                                                        child: AlertDialog(
                                                          title: Text(
                                                            "Do you want to make this locker under mentainance",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 18,
                                                            ),
                                                          ),
                                                          actions: [
                                                            SizedBox(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  5,
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  9,
                                                              child:
                                                                  ElevatedButton(
                                                                child:
                                                                    const Text(
                                                                  'Yes',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        18,
                                                                  ),
                                                                ),
                                                                style: ElevatedButton
                                                                    .styleFrom(
                                                                  primary: Color(
                                                                      0xFF9AD6BD),
                                                                  shape:
                                                                      const StadiumBorder(),
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  //delete lockers
                                                                  await FirebaseFirestore
                                                                      .instance
                                                                      .collection(
                                                                          "lockers")
                                                                      .where(
                                                                          "name",
                                                                          isEqualTo:
                                                                              data['name'])
                                                                      .limit(1)
                                                                      .get()
                                                                      .then((v) {
                                                                    v.docs.forEach(
                                                                        (el) {
                                                                      FirebaseFirestore
                                                                          .instance
                                                                          .collection(
                                                                              "lockers")
                                                                          .doc(
                                                                              "${el.id}")
                                                                          .update({
                                                                        "maintanence":
                                                                            true
                                                                      });
                                                                    });
                                                                  });
                                                                  await FirebaseFirestore
                                                                      .instance
                                                                      .collection(
                                                                          "lockers")
                                                                      .where(
                                                                          "name",
                                                                          isEqualTo:
                                                                              data['name'])
                                                                      .limit(1)
                                                                      .get()
                                                                      .then((v) {
                                                                    v.docs.forEach(
                                                                        (el) {
                                                                      FirebaseFirestore
                                                                          .instance
                                                                          .collection(
                                                                              "lockers")
                                                                          .doc(
                                                                              "${el.id}")
                                                                          .update({
                                                                        "available":
                                                                            false
                                                                      });
                                                                    });
                                                                  });
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  5,
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  9,
                                                              child:
                                                                  ElevatedButton(
                                                                child:
                                                                    const Text(
                                                                  'No',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        18,
                                                                  ),
                                                                ),
                                                                style: ElevatedButton
                                                                    .styleFrom(
                                                                  primary: Color(
                                                                      0xFF9AD6BD),
                                                                  shape:
                                                                      const StadiumBorder(),
                                                                ),
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    });
                                              }
                                            : () {
                                                //make locker that under maintanance available again
                                                if (data['maintanence']) {
                                                  showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return Container(
                                                          clipBehavior:
                                                              Clip.hardEdge,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30)),
                                                          child: AlertDialog(
                                                            title: Text(
                                                              "Do you want to make this locker available",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 18,
                                                              ),
                                                            ),
                                                            actions: [
                                                              SizedBox(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width /
                                                                    5,
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width /
                                                                    9,
                                                                child:
                                                                    ElevatedButton(
                                                                  child:
                                                                      const Text(
                                                                    'Yes',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          18,
                                                                    ),
                                                                  ),
                                                                  style: ElevatedButton
                                                                      .styleFrom(
                                                                    primary: Color(
                                                                        0xFF9AD6BD),
                                                                    shape:
                                                                        const StadiumBorder(),
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    //delete lockers
                                                                    await FirebaseFirestore
                                                                        .instance
                                                                        .collection(
                                                                            "lockers")
                                                                        .where(
                                                                            "name",
                                                                            isEqualTo: data[
                                                                                'name'])
                                                                        .limit(
                                                                            1)
                                                                        .get()
                                                                        .then(
                                                                            (v) {
                                                                      v.docs.forEach(
                                                                          (el) {
                                                                        FirebaseFirestore
                                                                            .instance
                                                                            .collection(
                                                                                "lockers")
                                                                            .doc(
                                                                                "${el.id}")
                                                                            .update({
                                                                          "maintanence":
                                                                              false
                                                                        });
                                                                      });
                                                                    });

                                                                    await FirebaseFirestore
                                                                        .instance
                                                                        .collection(
                                                                            "lockers")
                                                                        .where(
                                                                            "name",
                                                                            isEqualTo: data[
                                                                                'name'])
                                                                        .limit(
                                                                            1)
                                                                        .get()
                                                                        .then(
                                                                            (v) {
                                                                      v.docs.forEach(
                                                                          (el) {
                                                                        FirebaseFirestore
                                                                            .instance
                                                                            .collection(
                                                                                "lockers")
                                                                            .doc(
                                                                                "${el.id}")
                                                                            .update({
                                                                          "available":
                                                                              true
                                                                        });
                                                                      });
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop();
                                                                    });
                                                                  },
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width /
                                                                    5,
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width /
                                                                    9,
                                                                child:
                                                                    ElevatedButton(
                                                                  child:
                                                                      const Text(
                                                                    'No',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          18,
                                                                    ),
                                                                  ),
                                                                  style: ElevatedButton
                                                                      .styleFrom(
                                                                    primary: Color(
                                                                        0xFF9AD6BD),
                                                                    shape:
                                                                        const StadiumBorder(),
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                  },
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      });
                                                } else {
                                                  //make reserved locker under maintanance
                                                  showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return Container(
                                                          clipBehavior:
                                                              Clip.hardEdge,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30)),
                                                          child: AlertDialog(
                                                            title: Text(
                                                              "Do you want to make this locker under mentainance",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 18,
                                                              ),
                                                            ),
                                                            actions: [
                                                              SizedBox(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width /
                                                                    5,
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width /
                                                                    9,
                                                                child:
                                                                    ElevatedButton(
                                                                  child:
                                                                      const Text(
                                                                    'Yes',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          18,
                                                                    ),
                                                                  ),
                                                                  style: ElevatedButton
                                                                      .styleFrom(
                                                                    primary: Color(
                                                                        0xFF9AD6BD),
                                                                    shape:
                                                                        const StadiumBorder(),
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    //delete lockers
                                                                    await FirebaseFirestore
                                                                        .instance
                                                                        .collection(
                                                                            "lockers")
                                                                        .where(
                                                                            "name",
                                                                            isEqualTo: data[
                                                                                'name'])
                                                                        .limit(
                                                                            1)
                                                                        .get()
                                                                        .then(
                                                                            (v) {
                                                                      v.docs.forEach(
                                                                          (el) {
                                                                        FirebaseFirestore
                                                                            .instance
                                                                            .collection("lockers")
                                                                            .doc("${el.id}")
                                                                            .update({
                                                                          "maintanence":
                                                                              true,
                                                                        });
                                                                      });
                                                                    });
                                                                    await FirebaseFirestore
                                                                        .instance
                                                                        .collection(
                                                                            "lockers")
                                                                        .where(
                                                                            "name",
                                                                            isEqualTo: data[
                                                                                'name'])
                                                                        .limit(
                                                                            1)
                                                                        .get()
                                                                        .then(
                                                                            (v) {
                                                                      v.docs.forEach(
                                                                          (el) {
                                                                        FirebaseFirestore
                                                                            .instance
                                                                            .collection("lockers")
                                                                            .doc("${el.id}")
                                                                            .update({
                                                                          "available":
                                                                              false,
                                                                        });
                                                                      });
                                                                    });

                                                                    await FirebaseFirestore
                                                                        .instance
                                                                        .collection(
                                                                            "Reservation")
                                                                        .where(
                                                                            "locker_name",
                                                                            isEqualTo: data[
                                                                                'name'])
                                                                        .limit(
                                                                            1)
                                                                        .get()
                                                                        .then(
                                                                            (v) {
                                                                      v.docs.forEach(
                                                                          (el) {
                                                                        FirebaseFirestore
                                                                            .instance
                                                                            .collection("Reservation")
                                                                            .doc("${el.id}")
                                                                            .delete();
                                                                      });
                                                                    });

                                                                    await FirebaseFirestore
                                                                        .instance
                                                                        .collection(
                                                                            "Users")
                                                                        .where(
                                                                            "reservedlocker",
                                                                            isEqualTo: data[
                                                                                'name'])
                                                                        .limit(
                                                                            1)
                                                                        .get()
                                                                        .then(
                                                                            (v) {
                                                                      v.docs.forEach(
                                                                          (el) {
                                                                        FirebaseFirestore
                                                                            .instance
                                                                            .collection("Users")
                                                                            .doc("${el.id}")
                                                                            .update({
                                                                          "reservedlocker":
                                                                              "",
                                                                        });
                                                                      });
                                                                    });
                                                                    await FirebaseFirestore
                                                                        .instance
                                                                        .collection(
                                                                            "lockers")
                                                                        .where(
                                                                            "name",
                                                                            isEqualTo:
                                                                                "${data['name']}")
                                                                        .limit(
                                                                            1)
                                                                        .get()
                                                                        .then(
                                                                            (v) {
                                                                      v.docs.forEach(
                                                                          (el) {
                                                                        FirebaseFirestore
                                                                            .instance
                                                                            .collection(
                                                                                "lockers")
                                                                            .doc(
                                                                                "${el.id}")
                                                                            .update({
                                                                          "pin":
                                                                              ""
                                                                        });
                                                                      });
                                                                    });

                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                  },
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width /
                                                                    5,
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width /
                                                                    9,
                                                                child:
                                                                    ElevatedButton(
                                                                  child:
                                                                      const Text(
                                                                    'No',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          18,
                                                                    ),
                                                                  ),
                                                                  style: ElevatedButton
                                                                      .styleFrom(
                                                                    primary: Color(
                                                                        0xFF9AD6BD),
                                                                    shape:
                                                                        const StadiumBorder(),
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                  },
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      });
                                                }
                                              },
                                        child: Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              color: data['available']
                                                  ? Colors.green.shade200
                                                  : data['maintanence']
                                                      ? Colors
                                                          .redAccent.shade100
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
                                                      showDialog(
                                                          context: context,
                                                          builder: (context) {
                                                            return Container(
                                                              clipBehavior:
                                                                  Clip.hardEdge,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30)),
                                                              child:
                                                                  AlertDialog(
                                                                title: Text(
                                                                  "Do you want to make this locker under mentainance",
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        18,
                                                                  ),
                                                                ),
                                                                actions: [
                                                                  SizedBox(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width /
                                                                        5,
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .width /
                                                                        9,
                                                                    child:
                                                                        ElevatedButton(
                                                                      child:
                                                                          const Text(
                                                                        'Yes',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.black,
                                                                          fontSize:
                                                                              18,
                                                                        ),
                                                                      ),
                                                                      style: ElevatedButton
                                                                          .styleFrom(
                                                                        primary:
                                                                            Color(0xFF9AD6BD),
                                                                        shape:
                                                                            const StadiumBorder(),
                                                                      ),
                                                                      onPressed:
                                                                          () async {
                                                                        //delete lockers
                                                                        await FirebaseFirestore
                                                                            .instance
                                                                            .collection(
                                                                                "lockers")
                                                                            .where("name",
                                                                                isEqualTo: data1['name'])
                                                                            .limit(1)
                                                                            .get()
                                                                            .then((v) {
                                                                          v.docs
                                                                              .forEach((el) {
                                                                            FirebaseFirestore.instance.collection("lockers").doc("${el.id}").update({
                                                                              "maintanence": true
                                                                            });
                                                                          });
                                                                        });
                                                                        await FirebaseFirestore
                                                                            .instance
                                                                            .collection(
                                                                                "lockers")
                                                                            .where("name",
                                                                                isEqualTo: data1['name'])
                                                                            .limit(1)
                                                                            .get()
                                                                            .then((v) {
                                                                          v.docs
                                                                              .forEach((el) {
                                                                            FirebaseFirestore.instance.collection("lockers").doc("${el.id}").update({
                                                                              "available": false
                                                                            });
                                                                          });
                                                                        });
                                                                        Navigator.of(context)
                                                                            .pop();
                                                                      },
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width /
                                                                        5,
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .width /
                                                                        9,
                                                                    child:
                                                                        ElevatedButton(
                                                                      child:
                                                                          const Text(
                                                                        'No',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.black,
                                                                          fontSize:
                                                                              18,
                                                                        ),
                                                                      ),
                                                                      style: ElevatedButton
                                                                          .styleFrom(
                                                                        primary:
                                                                            Color(0xFF9AD6BD),
                                                                        shape:
                                                                            const StadiumBorder(),
                                                                      ),
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.of(context)
                                                                            .pop();
                                                                      },
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          });
                                                    }
                                                  : () {
                                                      if (data1[
                                                          'maintanence']) {
                                                        showDialog(
                                                            context: context,
                                                            builder: (context) {
                                                              return Container(
                                                                clipBehavior:
                                                                    Clip.hardEdge,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            30)),
                                                                child:
                                                                    AlertDialog(
                                                                  title: Text(
                                                                    "Do you want to make this locker available",
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          18,
                                                                    ),
                                                                  ),
                                                                  actions: [
                                                                    SizedBox(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width /
                                                                          5,
                                                                      height:
                                                                          MediaQuery.of(context).size.width /
                                                                              9,
                                                                      child:
                                                                          ElevatedButton(
                                                                        child:
                                                                            const Text(
                                                                          'Yes',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                18,
                                                                          ),
                                                                        ),
                                                                        style: ElevatedButton
                                                                            .styleFrom(
                                                                          primary:
                                                                              Color(0xFF9AD6BD),
                                                                          shape:
                                                                              const StadiumBorder(),
                                                                        ),
                                                                        onPressed:
                                                                            () async {
                                                                          //delete lockers
                                                                          await FirebaseFirestore
                                                                              .instance
                                                                              .collection("lockers")
                                                                              .where("name", isEqualTo: data1['name'])
                                                                              .limit(1)
                                                                              .get()
                                                                              .then((v) {
                                                                            v.docs.forEach((el) {
                                                                              FirebaseFirestore.instance.collection("lockers").doc("${el.id}").update({
                                                                                "maintanence": false
                                                                              });
                                                                            });
                                                                          });

                                                                          await FirebaseFirestore
                                                                              .instance
                                                                              .collection("lockers")
                                                                              .where("name", isEqualTo: data1['name'])
                                                                              .limit(1)
                                                                              .get()
                                                                              .then((v) {
                                                                            v.docs.forEach((el) {
                                                                              FirebaseFirestore.instance.collection("lockers").doc("${el.id}").update({
                                                                                "available": true
                                                                              });
                                                                            });
                                                                            Navigator.of(context).pop();
                                                                          });
                                                                        },
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width /
                                                                          5,
                                                                      height:
                                                                          MediaQuery.of(context).size.width /
                                                                              9,
                                                                      child:
                                                                          ElevatedButton(
                                                                        child:
                                                                            const Text(
                                                                          'No',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                18,
                                                                          ),
                                                                        ),
                                                                        style: ElevatedButton
                                                                            .styleFrom(
                                                                          primary:
                                                                              Color(0xFF9AD6BD),
                                                                          shape:
                                                                              const StadiumBorder(),
                                                                        ),
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.of(context)
                                                                              .pop();
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            });
                                                      } else {
                                                        //make reserved locker under maintanance
                                                        showDialog(
                                                            context: context,
                                                            builder: (context) {
                                                              return Container(
                                                                clipBehavior:
                                                                    Clip.hardEdge,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            30)),
                                                                child:
                                                                    AlertDialog(
                                                                  title: Text(
                                                                    "Do you want to make this locker under mentainance",
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          18,
                                                                    ),
                                                                  ),
                                                                  actions: [
                                                                    SizedBox(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width /
                                                                          5,
                                                                      height:
                                                                          MediaQuery.of(context).size.width /
                                                                              9,
                                                                      child:
                                                                          ElevatedButton(
                                                                        child:
                                                                            const Text(
                                                                          'Yes',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                18,
                                                                          ),
                                                                        ),
                                                                        style: ElevatedButton
                                                                            .styleFrom(
                                                                          primary:
                                                                              Color(0xFF9AD6BD),
                                                                          shape:
                                                                              const StadiumBorder(),
                                                                        ),
                                                                        onPressed:
                                                                            () async {
                                                                          //delete lockers
                                                                          await FirebaseFirestore
                                                                              .instance
                                                                              .collection("lockers")
                                                                              .where("name", isEqualTo: data1['name'])
                                                                              .limit(1)
                                                                              .get()
                                                                              .then((v) {
                                                                            v.docs.forEach((el) {
                                                                              FirebaseFirestore.instance.collection("lockers").doc("${el.id}").update({
                                                                                "maintanence": true,
                                                                              });
                                                                            });
                                                                          });
                                                                          await FirebaseFirestore
                                                                              .instance
                                                                              .collection("lockers")
                                                                              .where("name", isEqualTo: data1['name'])
                                                                              .limit(1)
                                                                              .get()
                                                                              .then((v) {
                                                                            v.docs.forEach((el) {
                                                                              FirebaseFirestore.instance.collection("lockers").doc("${el.id}").update({
                                                                                "available": false,
                                                                              });
                                                                            });
                                                                          });

                                                                          await FirebaseFirestore
                                                                              .instance
                                                                              .collection("Reservation")
                                                                              .where("locker_name", isEqualTo: data1['name'])
                                                                              .limit(1)
                                                                              .get()
                                                                              .then((v) {
                                                                            v.docs.forEach((el) {
                                                                              FirebaseFirestore.instance.collection("Reservation").doc("${el.id}").delete();
                                                                            });
                                                                          });

                                                                          await FirebaseFirestore
                                                                              .instance
                                                                              .collection("Users")
                                                                              .where("reservedlocker", isEqualTo: data1['name'])
                                                                              .limit(1)
                                                                              .get()
                                                                              .then((v) {
                                                                            v.docs.forEach((el) {
                                                                              FirebaseFirestore.instance.collection("Users").doc("${el.id}").update({
                                                                                "reservedlocker": "",
                                                                              });
                                                                            });
                                                                          });
                                                                          await FirebaseFirestore
                                                                              .instance
                                                                              .collection("lockers")
                                                                              .where("name", isEqualTo: "${data1['name']}")
                                                                              .limit(1)
                                                                              .get()
                                                                              .then((v) {
                                                                            v.docs.forEach((el) {
                                                                              FirebaseFirestore.instance.collection("lockers").doc("${el.id}").update({
                                                                                "pin": ""
                                                                              });
                                                                            });
                                                                          });

                                                                          Navigator.of(context)
                                                                              .pop();
                                                                        },
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width /
                                                                          5,
                                                                      height:
                                                                          MediaQuery.of(context).size.width /
                                                                              9,
                                                                      child:
                                                                          ElevatedButton(
                                                                        child:
                                                                            const Text(
                                                                          'No',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                18,
                                                                          ),
                                                                        ),
                                                                        style: ElevatedButton
                                                                            .styleFrom(
                                                                          primary:
                                                                              Color(0xFF9AD6BD),
                                                                          shape:
                                                                              const StadiumBorder(),
                                                                        ),
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.of(context)
                                                                              .pop();
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            });
                                                      }
                                                    },
                                              child: Container(
                                                child: Stack(
                                                  children: [
                                                    SvgPicture.string(
                                                      mySvg1(data1["available"]
                                                          ? "FFA5D6A7"
                                                          : data1['maintanence']
                                                              ? "FFFF8A80"
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
                                                      showDialog(
                                                          context: context,
                                                          builder: (context) {
                                                            return Container(
                                                              clipBehavior:
                                                                  Clip.hardEdge,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30)),
                                                              child:
                                                                  AlertDialog(
                                                                title: Text(
                                                                  "Do you want to make this locker under mentainance",
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        18,
                                                                  ),
                                                                ),
                                                                actions: [
                                                                  SizedBox(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width /
                                                                        5,
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .width /
                                                                        9,
                                                                    child:
                                                                        ElevatedButton(
                                                                      child:
                                                                          const Text(
                                                                        'Yes',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.black,
                                                                          fontSize:
                                                                              18,
                                                                        ),
                                                                      ),
                                                                      style: ElevatedButton
                                                                          .styleFrom(
                                                                        primary:
                                                                            Color(0xFF9AD6BD),
                                                                        shape:
                                                                            const StadiumBorder(),
                                                                      ),
                                                                      onPressed:
                                                                          () async {
                                                                        //delete lockers
                                                                        await FirebaseFirestore
                                                                            .instance
                                                                            .collection(
                                                                                "lockers")
                                                                            .where("name",
                                                                                isEqualTo: data2['name'])
                                                                            .limit(1)
                                                                            .get()
                                                                            .then((v) {
                                                                          v.docs
                                                                              .forEach((el) {
                                                                            FirebaseFirestore.instance.collection("lockers").doc("${el.id}").update({
                                                                              "maintanence": true
                                                                            });
                                                                          });
                                                                        });
                                                                        await FirebaseFirestore
                                                                            .instance
                                                                            .collection(
                                                                                "lockers")
                                                                            .where("name",
                                                                                isEqualTo: data2['name'])
                                                                            .limit(1)
                                                                            .get()
                                                                            .then((v) {
                                                                          v.docs
                                                                              .forEach((el) {
                                                                            FirebaseFirestore.instance.collection("lockers").doc("${el.id}").update({
                                                                              "available": false
                                                                            });
                                                                          });
                                                                        });
                                                                        Navigator.of(context)
                                                                            .pop();
                                                                      },
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width /
                                                                        5,
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .width /
                                                                        9,
                                                                    child:
                                                                        ElevatedButton(
                                                                      child:
                                                                          const Text(
                                                                        'No',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.black,
                                                                          fontSize:
                                                                              18,
                                                                        ),
                                                                      ),
                                                                      style: ElevatedButton
                                                                          .styleFrom(
                                                                        primary:
                                                                            Color(0xFF9AD6BD),
                                                                        shape:
                                                                            const StadiumBorder(),
                                                                      ),
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.of(context)
                                                                            .pop();
                                                                      },
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          });
                                                    }
                                                  : () {
                                                      if (data2[
                                                          'maintanence']) {
                                                        showDialog(
                                                            context: context,
                                                            builder: (context) {
                                                              return Container(
                                                                clipBehavior:
                                                                    Clip.hardEdge,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            30)),
                                                                child:
                                                                    AlertDialog(
                                                                  title: Text(
                                                                    "Do you want to make this locker available",
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          18,
                                                                    ),
                                                                  ),
                                                                  actions: [
                                                                    SizedBox(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width /
                                                                          5,
                                                                      height:
                                                                          MediaQuery.of(context).size.width /
                                                                              9,
                                                                      child:
                                                                          ElevatedButton(
                                                                        child:
                                                                            const Text(
                                                                          'Yes',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                18,
                                                                          ),
                                                                        ),
                                                                        style: ElevatedButton
                                                                            .styleFrom(
                                                                          primary:
                                                                              Color(0xFF9AD6BD),
                                                                          shape:
                                                                              const StadiumBorder(),
                                                                        ),
                                                                        onPressed:
                                                                            () async {
                                                                          //delete lockers
                                                                          await FirebaseFirestore
                                                                              .instance
                                                                              .collection("lockers")
                                                                              .where("name", isEqualTo: data2['name'])
                                                                              .limit(1)
                                                                              .get()
                                                                              .then((v) {
                                                                            v.docs.forEach((el) {
                                                                              FirebaseFirestore.instance.collection("lockers").doc("${el.id}").update({
                                                                                "status": ""
                                                                              });
                                                                            });
                                                                          });

                                                                          await FirebaseFirestore
                                                                              .instance
                                                                              .collection("lockers")
                                                                              .where("name", isEqualTo: data2['name'])
                                                                              .limit(1)
                                                                              .get()
                                                                              .then((v) {
                                                                            v.docs.forEach((el) {
                                                                              FirebaseFirestore.instance.collection("lockers").doc("${el.id}").update({
                                                                                "available": true
                                                                              });
                                                                            });
                                                                            Navigator.of(context).pop();
                                                                          });
                                                                        },
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width /
                                                                          5,
                                                                      height:
                                                                          MediaQuery.of(context).size.width /
                                                                              9,
                                                                      child:
                                                                          ElevatedButton(
                                                                        child:
                                                                            const Text(
                                                                          'No',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                18,
                                                                          ),
                                                                        ),
                                                                        style: ElevatedButton
                                                                            .styleFrom(
                                                                          primary:
                                                                              Color(0xFF9AD6BD),
                                                                          shape:
                                                                              const StadiumBorder(),
                                                                        ),
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.of(context)
                                                                              .pop();
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            });
                                                      } else {
                                                        //make reserved locker under maintanance
                                                        showDialog(
                                                            context: context,
                                                            builder: (context) {
                                                              return Container(
                                                                clipBehavior:
                                                                    Clip.hardEdge,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            30)),
                                                                child:
                                                                    AlertDialog(
                                                                  title: Text(
                                                                    "Do you want to make this locker under mentainance",
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          18,
                                                                    ),
                                                                  ),
                                                                  actions: [
                                                                    SizedBox(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width /
                                                                          5,
                                                                      height:
                                                                          MediaQuery.of(context).size.width /
                                                                              9,
                                                                      child:
                                                                          ElevatedButton(
                                                                        child:
                                                                            const Text(
                                                                          'Yes',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                18,
                                                                          ),
                                                                        ),
                                                                        style: ElevatedButton
                                                                            .styleFrom(
                                                                          primary:
                                                                              Color(0xFF9AD6BD),
                                                                          shape:
                                                                              const StadiumBorder(),
                                                                        ),
                                                                        onPressed:
                                                                            () async {
                                                                          //delete lockers
                                                                          await FirebaseFirestore
                                                                              .instance
                                                                              .collection("lockers")
                                                                              .where("name", isEqualTo: data2['name'])
                                                                              .limit(1)
                                                                              .get()
                                                                              .then((v) {
                                                                            v.docs.forEach((el) {
                                                                              FirebaseFirestore.instance.collection("lockers").doc("${el.id}").update({
                                                                                "maintanence": true,
                                                                              });
                                                                            });
                                                                          });
                                                                          await FirebaseFirestore
                                                                              .instance
                                                                              .collection("lockers")
                                                                              .where("name", isEqualTo: data2['name'])
                                                                              .limit(1)
                                                                              .get()
                                                                              .then((v) {
                                                                            v.docs.forEach((el) {
                                                                              FirebaseFirestore.instance.collection("lockers").doc("${el.id}").update({
                                                                                "available": false,
                                                                              });
                                                                            });
                                                                          });

                                                                          await FirebaseFirestore
                                                                              .instance
                                                                              .collection("Reservation")
                                                                              .where("locker_name", isEqualTo: data2['name'])
                                                                              .limit(1)
                                                                              .get()
                                                                              .then((v) {
                                                                            v.docs.forEach((el) {
                                                                              FirebaseFirestore.instance.collection("Reservation").doc("${el.id}").delete();
                                                                            });
                                                                          });

                                                                          await FirebaseFirestore
                                                                              .instance
                                                                              .collection("Users")
                                                                              .where("reservedlocker", isEqualTo: data2['name'])
                                                                              .limit(1)
                                                                              .get()
                                                                              .then((v) {
                                                                            v.docs.forEach((el) {
                                                                              FirebaseFirestore.instance.collection("Users").doc("${el.id}").update({
                                                                                "reservedlocker": "",
                                                                              });
                                                                            });
                                                                          });
                                                                          await FirebaseFirestore
                                                                              .instance
                                                                              .collection("lockers")
                                                                              .where("name", isEqualTo: "${data2['name']}")
                                                                              .limit(1)
                                                                              .get()
                                                                              .then((v) {
                                                                            v.docs.forEach((el) {
                                                                              FirebaseFirestore.instance.collection("lockers").doc("${el.id}").update({
                                                                                "pin": ""
                                                                              });
                                                                            });
                                                                          });

                                                                          Navigator.of(context)
                                                                              .pop();
                                                                        },
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width /
                                                                          5,
                                                                      height:
                                                                          MediaQuery.of(context).size.width /
                                                                              9,
                                                                      child:
                                                                          ElevatedButton(
                                                                        child:
                                                                            const Text(
                                                                          'No',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                18,
                                                                          ),
                                                                        ),
                                                                        style: ElevatedButton
                                                                            .styleFrom(
                                                                          primary:
                                                                              Color(0xFF9AD6BD),
                                                                          shape:
                                                                              const StadiumBorder(),
                                                                        ),
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.of(context)
                                                                              .pop();
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            });
                                                      }
                                                    },
                                              child: Container(
                                                  child: Stack(
                                                children: [
                                                  SvgPicture.string(
                                                    mySvg2(data2["available"]
                                                        ? "FFA5D6A7"
                                                        : data2['maintanence']
                                                            ? "FFFF8A80"
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
        .doc("fgzone") //zone
        .get();

    setState(() {
      fg1size = doc['fg1size'];
      fg2size = doc['fg2size'];
      fg3size = doc['fg3size'];
      fg4size = doc['fg4size'];
      fg5size = doc['fg5size'];
      fg6size = doc['fg6size'];
      fg7size = doc['fg7size'];
      fg8size = doc['fg8size'];
      fg9size = doc['fg9size'];
      fg10size = doc['fg10size'];
      fg11size = doc['fg11size'];
      fg12size = doc['fg12size'];
      fg13size = doc['fg13size'];
      fg14size = doc['fg14size'];
      fg15size = doc['fg15size'];
      fg16size = doc['fg16size'];

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
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => controlleradmin()));
              },
              child: Text("Cancel", style: TextStyle(color: Colors.black)))
        ], /* textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontSize: 20,
                  color: Colors.black,
                ))*/
      ),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(size: 18, middle: 0.21),
            Pin(size: 18, start: 40),
            child: Transform.rotate(
              angle: 1.5708,
              child: GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                    color: widget.option == "ch"
                        ? Color.fromARGB(255, 255, 255, 255)
                        : w,
                    border: Border.all(
                      width: 0.3,
                      color: widget.option == "ch"
                          ? Color.fromARGB(255, 255, 255, 255)
                          : b,
                    ), //colore changes based on add/delete not user type
                  ),
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 100.0, start: 95),
            Pin(size: 16.0, start: 40),
            child: widget.option != "ch"
                ? Text(
                    'Add lockers',
                    style: TextStyle(
                      fontFamily: 'Helvetica Neue',
                      fontSize: 14,
                      color: const Color(0xff1c0000),
                      height: 3.142857142857143,
                    ),
                    textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                    textAlign: TextAlign.center,
                  )
                : Text(""),
          ),
          Pinned.fromPins(
            Pin(size: 18, middle: 0.21),
            Pin(size: 18, start: 70),
            child: Transform.rotate(
              angle: 1.5708,
              child: GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                    color: widget.option == "ch"
                        ? Color.fromARGB(255, 255, 255, 255)
                        : g,
                    border: Border.all(
                      width: 0.3,
                      color: widget.option == "ch"
                          ? Color.fromARGB(255, 255, 255, 255)
                          : b,
                    ), //colore changes based on add/delete not user type
                  ),
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 100.0, start: 100),
            Pin(size: 16.0, start: 70),
            child: widget.option != "ch"
                ? Text(
                    'Delete lockers',
                    style: TextStyle(
                      fontFamily: 'Helvetica Neue',
                      fontSize: 14,
                      color: const Color(0xff1c0000),
                      height: 3.142857142857143,
                    ),
                    textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                    textAlign: TextAlign.center,
                  )
                : Text(""),
          ),
          Pinned.fromPins(
            Pin(size: 328.0, middle: 0.4762),
            Pin(start: 103.0, end: 0.5),
            child: Scrollbar(
              child: SingleChildScrollView(
                child: SizedBox(
                  width: 328.0,
                  height: 800.0,
                  child: Stack(
                    children: <Widget>[
                      //-------------------------- map -------------
                      Pinned.fromPins(
                        Pin(size: 65.0, start: 37.0),
                        Pin(size: 29.0, start: 137), // exit
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff7dd871),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 85.0, middle: 0.6134),
                        Pin(size: 50.0, start: 260.5), // 38
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff82b685),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 65.0, start: 37.0),
                        Pin(size: 95.0, start: 1.0), // 27
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff82b685),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 65.0, start: 37.0),
                        Pin(size: 50.0, start: 165.5), //36
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff82b685),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 65.0, start: 37.0),
                        Pin(size: 51.0, start: 215), //37
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff82b685),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 65.0, start: 37.0),
                        Pin(size: 155.0, start: 265.5), //49
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff82b685),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 103.0, end: 29.0),
                        Pin(size: 79.0, start: 01.0), //25
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff82b685),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 98.0, middle: 0.4416),
                        Pin(size: 79.0, start: 01.0), //26
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff82b685),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 5.0, middle: 0.4591),
                        Pin(size: 63.0, start: 358), // wall next to stairs
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff82b685),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 67.0, start: 35.0),
                        Pin(size: 16.0, start: 330),
                        child: Text(
                          '6F49',
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
                        Pin(size: 67.0, start: 36.0),
                        Pin(size: 16.0, start: 232),
                        child: Text(
                          '6F37',
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
                        Pin(size: 67.0, start: 36.0),
                        Pin(size: 16.0, start: 185),
                        child: Text(
                          '6F36',
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
                        Pin(size: 53.0, start: 42.0),
                        Pin(size: 16.0, start: 35.0),
                        child: Text(
                          '6F27',
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
                        Pin(size: 53.0, middle: 0.4593),
                        Pin(size: 16.0, start: 35.0),
                        child: Text(
                          '6F26',
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
                        Pin(size: 53.0, middle: 0.8185),
                        Pin(size: 16.0, start: 35.0),
                        child: Text(
                          '6F25',
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
                        Pin(size: 53.0, middle: 0.6074),
                        Pin(size: 16.0, start: 278),
                        child: Text(
                          '6F38',
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
                        Pin(size: 27.0, middle: 0.7804),
                        Pin(size: 8.0, start: 190), // between stairs2 bases
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffe5e5e5),
                            border: Border.all(
                                width: 0.3, color: const Color(0xff000000)),
                          ),
                        ),
                      ),

                      Pinned.fromPins(
                        Pin(size: 85.0, middle: 0.6134),
                        Pin(size: 92.0, start: 169), //35
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff82b685),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 150.0, end: 29.0),
                        Pin(size: 60.0, start: 110), //above 35
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff82b685),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 53.0, middle: 0.6074),
                        Pin(size: 16.0, start: 210),
                        child: Text(
                          '6F35',
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
                        Pin(size: 26.7, middle: 0.7796),
                        Pin(size: 1.0, start: 192), // stairs2 line
                        child: SvgPicture.string(
                          _svg_co67m9,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 26.7, middle: 0.7796),
                        Pin(size: 1.0, start: 194), // stairs2 line
                        child: SvgPicture.string(
                          _svg_zan6zu,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 27.0, middle: 0.7804),
                        Pin(size: 1.0, start: 195), // stairs2 line
                        child: SvgPicture.string(
                          _svg_so97s,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 51.0, start: 43.0),
                        Pin(size: 14.0, start: 145),
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
                        Pin(size: 36.0, end: 29.0),
                        Pin(size: 8.0, start: 190), // between stairs2
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffe5e5e5),
                            border: Border.all(
                                width: 0.3, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 27.0, middle: 0.7804),
                        Pin(size: 21.0, start: 170), // stairs2 base
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffe5e5e5),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),

                      Pinned.fromPins(
                        Pin(size: 37.0, end: 29.0),
                        Pin(size: 21.0, start: 170), // stairs2 base with lines
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffe5e5e5),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 60.6),
                        Pin(size: 20.2, start: 170), // stairs2 line
                        child: SvgPicture.string(
                          _svg_ecu,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 56.8),
                        Pin(size: 20.2, start: 170), // stairs2 line
                        child: SvgPicture.string(
                          _svg_ea22zy,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 52.4),
                        Pin(size: 20.2, start: 170), // stairs2 line
                        child: SvgPicture.string(
                          _svg_xp5,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 48.3),
                        Pin(size: 20.2, start: 170), // stairs2 line
                        child: SvgPicture.string(
                          _svg_rm3jvr,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 40.7),
                        Pin(size: 20.2, start: 170), // stairs2 line
                        child: SvgPicture.string(
                          _svg_fjj2mn,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 37.7),
                        Pin(size: 20.2, start: 170), // stairs2 line
                        child: SvgPicture.string(
                          _svg_g90z,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 33.7),
                        Pin(size: 20.2, start: 170), // stairs2 line
                        child: SvgPicture.string(
                          _svg_haivz2,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 31.0),
                        Pin(size: 20.2, start: 170), // stairs2 line
                        child: SvgPicture.string(
                          _svg_nb5hd2,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 40.7),
                        Pin(size: 20.2, start: 170), // stairs2 line
                        child: SvgPicture.string(
                          _svg_fjj2mn,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 43.9),
                        Pin(size: 20.2, start: 170), // stairs2 line
                        child: SvgPicture.string(
                          _svg_h9pi,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 27.0, middle: 0.7804),
                        Pin(size: 21.0, start: 196), // stairs2 base
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffe5e5e5),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 37.0, end: 29.0),
                        Pin(size: 21.0, start: 196), // stairs2 base with line
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffe5e5e5),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 60.6),
                        Pin(size: 20.2, start: 196), // stairs2 line
                        child: SvgPicture.string(
                          _svg_vn1f2,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 56.8),
                        Pin(size: 20.2, start: 196), // stairs2 line
                        child: SvgPicture.string(
                          _svg_aemh0,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 52.4),
                        Pin(size: 20.2, start: 196), // stairs2 line
                        child: SvgPicture.string(
                          _svg_gerrt,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 48.3),
                        Pin(size: 20.2, start: 196), // stairs2 line
                        child: SvgPicture.string(
                          _svg_c1muet,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 40.7),
                        Pin(size: 20.2, start: 196), // stairs2 line
                        child: SvgPicture.string(
                          _svg_v3zs3l,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 37.7),
                        Pin(size: 20.2, start: 196), // stairs2 line
                        child: SvgPicture.string(
                          _svg_d0gfz,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 33.7),
                        Pin(size: 20.2, start: 196), // stairs2 line
                        child: SvgPicture.string(
                          _svg_wuzlg0,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 31.0),
                        Pin(size: 20.2, start: 196), // stairs2 line
                        child: SvgPicture.string(
                          _svg_w5hv54,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, end: 43.9),
                        Pin(size: 20.2, start: 196), // stairs2 line
                        child: SvgPicture.string(
                          _svg_ezfrg,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),

                      // ------------------------ map ------------
                      Pinned.fromPins(
                        Pin(size: 85.0, middle: 0.6134),
                        Pin(size: 49.0, start: 310), // photocopy room
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff82b685),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 65.0, start: 37.0),
                        Pin(size: 41.0, start: 96), // 6F28, 6F34
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff82b685),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),

                      Pinned.fromPins(
                        Pin(size: 21.1, middle: 0.3295),
                        Pin(size: 16.0, start: 222), // lockrr1
                        child: Transform.rotate(
                          angle: 1.5708,
                          child: GestureDetector(
                            onTap: () {
                              if (widget.option == "ch") {
                                if (fg1size != "") {
                                  if (fg1size != "") {
                                    showLocker(context, "fg1", fg1size);
                                  }
                                }
                              } else {
                                if (fg1size == "") {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const addblock(
                                            from: "fg",
                                            available: true,
                                            block: "fg1",
                                            type: "f",
                                          )));
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          clipBehavior: Clip.hardEdge,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          child: AlertDialog(
                                            title: Text(
                                              "Are you sure you want to delete the block",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                              ),
                                            ),
                                            actions: [
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                                height: MediaQuery.of(context)
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
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Color(0xFF9AD6BD),
                                                    shape:
                                                        const StadiumBorder(),
                                                  ),
                                                  onPressed: () async {
                                                    //delete lockers
                                                    await FirebaseFirestore
                                                        .instance
                                                        .collection("lockers")
                                                        .where("block",
                                                            isEqualTo: "fg1")
                                                        .limit(16)
                                                        .get()
                                                        .then((v) {
                                                      v.docs.forEach((el) {
                                                        FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                "lockers")
                                                            .doc("${el.id}")
                                                            .delete();
                                                      });
                                                    });
                                                    //make block disappear in its zone
                                                    await FirebaseFirestore
                                                        .instance
                                                        .collection("zones")
                                                        .doc("fgzone")
                                                        .update({
                                                      "fg1size": "",
                                                    });
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                                height: MediaQuery.of(context)
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
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Color(0xFF9AD6BD),
                                                    shape:
                                                        const StadiumBorder(),
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
                                }
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: fg1size == "" ? w : g,
                                border: Border.all(
                                    width: 0.3, color: fg1size == "" ? w : b),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 21.1, middle: 0.3295),
                        Pin(size: 16.0, start: 242), // lockrr2
                        child: Transform.rotate(
                          angle: 1.5708,
                          child: GestureDetector(
                            onTap: () {
                              if (widget.option == "ch") {
                                if (fg2size != "") {
                                  showLocker(context, "fg2", fg2size);
                                }
                              } else {
                                if (fg2size == "") {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const addblock(
                                            from: "fg",
                                            available: true,
                                            block: "fg2",
                                            type: "f",
                                          )));
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          clipBehavior: Clip.hardEdge,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          child: AlertDialog(
                                            title: Text(
                                              "Are you sure you want to delete the block",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                              ),
                                            ),
                                            actions: [
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                                height: MediaQuery.of(context)
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
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Color(0xFF9AD6BD),
                                                    shape:
                                                        const StadiumBorder(),
                                                  ),
                                                  onPressed: () async {
                                                    //delete lockers
                                                    await FirebaseFirestore
                                                        .instance
                                                        .collection("lockers")
                                                        .where("block",
                                                            isEqualTo: "fg2")
                                                        .limit(16)
                                                        .get()
                                                        .then((v) {
                                                      v.docs.forEach((el) {
                                                        FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                "lockers")
                                                            .doc("${el.id}")
                                                            .delete();
                                                      });
                                                    });
                                                    //make block disappear in its zone
                                                    await FirebaseFirestore
                                                        .instance
                                                        .collection("zones")
                                                        .doc("fgzone")
                                                        .update({
                                                      "fg2size": "",
                                                    });
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                                height: MediaQuery.of(context)
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
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Color(0xFF9AD6BD),
                                                    shape:
                                                        const StadiumBorder(),
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
                                }
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: fg2size == "" ? w : g,
                                border: Border.all(
                                    width: 0.3, color: fg2size == "" ? w : b),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 21.1, middle: 0.3295),
                        Pin(size: 16.0, start: 262), // lockrr3
                        child: Transform.rotate(
                          angle: 1.5708,
                          child: GestureDetector(
                            onTap: () {
                              if (widget.option == "ch") {
                                if (fg3size != "") {
                                  showLocker(context, "fg3", fg3size);
                                }
                              } else {
                                if (fg3size == "") {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const addblock(
                                            from: "fg",
                                            available: true,
                                            block: "fg3",
                                            type: "f",
                                          )));
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          clipBehavior: Clip.hardEdge,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          child: AlertDialog(
                                            title: Text(
                                              "Are you sure you want to delete the block",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                              ),
                                            ),
                                            actions: [
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                                height: MediaQuery.of(context)
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
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Color(0xFF9AD6BD),
                                                    shape:
                                                        const StadiumBorder(),
                                                  ),
                                                  onPressed: () async {
                                                    //delete lockers
                                                    await FirebaseFirestore
                                                        .instance
                                                        .collection("lockers")
                                                        .where("block",
                                                            isEqualTo: "fg3")
                                                        .limit(16)
                                                        .get()
                                                        .then((v) {
                                                      v.docs.forEach((el) {
                                                        FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                "lockers")
                                                            .doc("${el.id}")
                                                            .delete();
                                                      });
                                                    });
                                                    //make block disappear in its zone
                                                    await FirebaseFirestore
                                                        .instance
                                                        .collection("zones")
                                                        .doc("fgzone")
                                                        .update({
                                                      "fg3size": "",
                                                    });
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                                height: MediaQuery.of(context)
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
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Color(0xFF9AD6BD),
                                                    shape:
                                                        const StadiumBorder(),
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
                                }
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: fg3size == "" ? w : g,
                                border: Border.all(
                                    width: 0.3, color: fg3size == "" ? w : b),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 21.1, middle: 0.3295),
                        Pin(size: 16.0, start: 282), // lockrr4
                        child: Transform.rotate(
                          angle: 1.5708,
                          child: GestureDetector(
                            onTap: () {
                              if (widget.option == "ch") {
                                if (fg4size != "") {
                                  showLocker(context, "fg4", fg4size);
                                }
                              } else {
                                if (fg4size == "") {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const addblock(
                                            from: "fg",
                                            available: true,
                                            block: "fg4",
                                            type: "f",
                                          )));
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          clipBehavior: Clip.hardEdge,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          child: AlertDialog(
                                            title: Text(
                                              "Are you sure you want to delete the block",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                              ),
                                            ),
                                            actions: [
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                                height: MediaQuery.of(context)
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
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Color(0xFF9AD6BD),
                                                    shape:
                                                        const StadiumBorder(),
                                                  ),
                                                  onPressed: () async {
                                                    //delete lockers
                                                    await FirebaseFirestore
                                                        .instance
                                                        .collection("lockers")
                                                        .where("block",
                                                            isEqualTo: "fg4")
                                                        .limit(16)
                                                        .get()
                                                        .then((v) {
                                                      v.docs.forEach((el) {
                                                        FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                "lockers")
                                                            .doc("${el.id}")
                                                            .delete();
                                                      });
                                                    });
                                                    //make block disappear in its zone
                                                    await FirebaseFirestore
                                                        .instance
                                                        .collection("zones")
                                                        .doc("fgzone")
                                                        .update({
                                                      "fg4size": "",
                                                    });
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                                height: MediaQuery.of(context)
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
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Color(0xFF9AD6BD),
                                                    shape:
                                                        const StadiumBorder(),
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
                                }
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: fg4size == "" ? w : g,
                                border: Border.all(
                                    width: 0.3, color: fg4size == "" ? w : b),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 21.1, middle: 0.3295),
                        Pin(size: 16.0, start: 302), // lockrr5
                        child: Transform.rotate(
                          angle: 1.5708,
                          child: GestureDetector(
                            onTap: () {
                              if (widget.option == "ch") {
                                if (fg5size != "") {
                                  showLocker(context, "fg5", fg5size);
                                }
                              } else {
                                if (fg5size == "") {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const addblock(
                                            from: "fg",
                                            available: true,
                                            block: "fg5",
                                            type: "f",
                                          )));
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          clipBehavior: Clip.hardEdge,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          child: AlertDialog(
                                            title: Text(
                                              "Are you sure you want to delete the block",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                              ),
                                            ),
                                            actions: [
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                                height: MediaQuery.of(context)
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
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Color(0xFF9AD6BD),
                                                    shape:
                                                        const StadiumBorder(),
                                                  ),
                                                  onPressed: () async {
                                                    //delete lockers
                                                    await FirebaseFirestore
                                                        .instance
                                                        .collection("lockers")
                                                        .where("block",
                                                            isEqualTo: "fg5")
                                                        .limit(16)
                                                        .get()
                                                        .then((v) {
                                                      v.docs.forEach((el) {
                                                        FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                "lockers")
                                                            .doc("${el.id}")
                                                            .delete();
                                                      });
                                                    });
                                                    //make block disappear in its zone
                                                    await FirebaseFirestore
                                                        .instance
                                                        .collection("zones")
                                                        .doc("fgzone")
                                                        .update({
                                                      "fg5size": "",
                                                    });
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                                height: MediaQuery.of(context)
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
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Color(0xFF9AD6BD),
                                                    shape:
                                                        const StadiumBorder(),
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
                                }
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: fg5size == "" ? w : g,
                                border: Border.all(
                                    width: 0.3, color: fg5size == "" ? w : b),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 21.1, middle: 0.3295),
                        Pin(size: 16.0, start: 322), // locker6
                        child: Transform.rotate(
                          angle: 1.5708,
                          child: GestureDetector(
                            onTap: () {
                              if (widget.option == "ch") {
                                if (fg6size != "") {
                                  showLocker(context, "fg6", fg6size);
                                }
                              } else {
                                if (fg6size == "") {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const addblock(
                                            from: "fg",
                                            available: true,
                                            block: "fg6",
                                            type: "f",
                                          )));
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          clipBehavior: Clip.hardEdge,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          child: AlertDialog(
                                            title: Text(
                                              "Are you sure you want to delete the block",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                              ),
                                            ),
                                            actions: [
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                                height: MediaQuery.of(context)
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
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Color(0xFF9AD6BD),
                                                    shape:
                                                        const StadiumBorder(),
                                                  ),
                                                  onPressed: () async {
                                                    //delete lockers
                                                    await FirebaseFirestore
                                                        .instance
                                                        .collection("lockers")
                                                        .where("block",
                                                            isEqualTo: "fg6")
                                                        .limit(16)
                                                        .get()
                                                        .then((v) {
                                                      v.docs.forEach((el) {
                                                        FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                "lockers")
                                                            .doc("${el.id}")
                                                            .delete();
                                                      });
                                                    });
                                                    //make block disappear in its zone
                                                    await FirebaseFirestore
                                                        .instance
                                                        .collection("zones")
                                                        .doc("fgzone")
                                                        .update({
                                                      "fg6size": "",
                                                    });
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                                height: MediaQuery.of(context)
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
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Color(0xFF9AD6BD),
                                                    shape:
                                                        const StadiumBorder(),
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
                                }
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: fg6size == "" ? w : g,
                                border: Border.all(
                                    width: 0.3, color: fg6size == "" ? w : b),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 21.1, middle: 0.3295),
                        Pin(size: 16.0, start: 342), // locker7
                        child: Transform.rotate(
                          angle: 1.5708,
                          child: GestureDetector(
                            onTap: () {
                              if (widget.option == "ch") {
                                if (fg7size != "") {
                                  showLocker(context, "fg7", fg7size);
                                }
                              } else {
                                if (fg7size == "") {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const addblock(
                                            from: "fg",
                                            available: true,
                                            block: "fg7",
                                            type: "f",
                                          )));
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          clipBehavior: Clip.hardEdge,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          child: AlertDialog(
                                            title: Text(
                                              "Are you sure you want to delete the block",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                              ),
                                            ),
                                            actions: [
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                                height: MediaQuery.of(context)
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
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Color(0xFF9AD6BD),
                                                    shape:
                                                        const StadiumBorder(),
                                                  ),
                                                  onPressed: () async {
                                                    //delete lockers
                                                    await FirebaseFirestore
                                                        .instance
                                                        .collection("lockers")
                                                        .where("block",
                                                            isEqualTo: "fg7")
                                                        .limit(16)
                                                        .get()
                                                        .then((v) {
                                                      v.docs.forEach((el) {
                                                        FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                "lockers")
                                                            .doc("${el.id}")
                                                            .delete();
                                                      });
                                                    });
                                                    //make block disappear in its zone
                                                    await FirebaseFirestore
                                                        .instance
                                                        .collection("zones")
                                                        .doc("fgzone")
                                                        .update({
                                                      "fg7size": "",
                                                    });
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                                height: MediaQuery.of(context)
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
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Color(0xFF9AD6BD),
                                                    shape:
                                                        const StadiumBorder(),
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
                                }
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: fg7size == "" ? w : g,
                                border: Border.all(
                                    width: 0.3, color: fg7size == "" ? w : b),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 21.1, middle: 0.3295),
                        Pin(size: 16.0, start: 362), // locker8
                        child: Transform.rotate(
                          angle: 1.5708,
                          child: GestureDetector(
                            onTap: () {
                              if (widget.option == "ch") {
                                if (fg8size != "") {
                                  showLocker(context, "fg8", fg8size);
                                }
                              } else {
                                if (fg8size == "") {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const addblock(
                                            from: "fg",
                                            available: true,
                                            block: "fg8",
                                            type: "f",
                                          )));
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          clipBehavior: Clip.hardEdge,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          child: AlertDialog(
                                            title: Text(
                                              "Are you sure you want to delete the block",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                              ),
                                            ),
                                            actions: [
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                                height: MediaQuery.of(context)
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
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Color(0xFF9AD6BD),
                                                    shape:
                                                        const StadiumBorder(),
                                                  ),
                                                  onPressed: () async {
                                                    //delete lockers
                                                    await FirebaseFirestore
                                                        .instance
                                                        .collection("lockers")
                                                        .where("block",
                                                            isEqualTo: "fg8")
                                                        .limit(16)
                                                        .get()
                                                        .then((v) {
                                                      v.docs.forEach((el) {
                                                        FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                "lockers")
                                                            .doc("${el.id}")
                                                            .delete();
                                                      });
                                                    });
                                                    //make block disappear in its zone
                                                    await FirebaseFirestore
                                                        .instance
                                                        .collection("zones")
                                                        .doc("fgzone")
                                                        .update({
                                                      "fg8size": "",
                                                    });
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                                height: MediaQuery.of(context)
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
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Color(0xFF9AD6BD),
                                                    shape:
                                                        const StadiumBorder(),
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
                                }
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: fg8size == "" ? w : g,
                                border: Border.all(
                                    width: 0.3, color: fg8size == "" ? w : b),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 21.1, middle: 0.3295),
                        Pin(size: 16.0, start: 382), // lcoker9
                        child: Transform.rotate(
                          angle: 1.5708,
                          child: GestureDetector(
                            onTap: () {
                              if (widget.option == "ch") {
                                if (fg9size != "") {
                                  showLocker(context, "fg9", fg9size);
                                }
                              } else {
                                if (fg9size == "") {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const addblock(
                                            from: "fg",
                                            available: true,
                                            block: "fg9",
                                            type: "f",
                                          )));
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          clipBehavior: Clip.hardEdge,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          child: AlertDialog(
                                            title: Text(
                                              "Are you sure you want to delete the block",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                              ),
                                            ),
                                            actions: [
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                                height: MediaQuery.of(context)
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
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Color(0xFF9AD6BD),
                                                    shape:
                                                        const StadiumBorder(),
                                                  ),
                                                  onPressed: () async {
                                                    //delete lockers
                                                    await FirebaseFirestore
                                                        .instance
                                                        .collection("lockers")
                                                        .where("block",
                                                            isEqualTo: "fg9")
                                                        .limit(16)
                                                        .get()
                                                        .then((v) {
                                                      v.docs.forEach((el) {
                                                        FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                "lockers")
                                                            .doc("${el.id}")
                                                            .delete();
                                                      });
                                                    });
                                                    //make block disappear in its zone
                                                    await FirebaseFirestore
                                                        .instance
                                                        .collection("zones")
                                                        .doc("fgzone")
                                                        .update({
                                                      "fg9size": "",
                                                    });
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                                height: MediaQuery.of(context)
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
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Color(0xFF9AD6BD),
                                                    shape:
                                                        const StadiumBorder(),
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
                                }
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: fg9size == "" ? w : g,
                                border: Border.all(
                                    width: 0.3, color: fg9size == "" ? w : b),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 21.1, middle: 0.3295),
                        Pin(size: 16.0, start: 402), // locker10
                        child: Transform.rotate(
                          angle: 1.5708,
                          child: GestureDetector(
                            onTap: () {
                              if (widget.option == "ch") {
                                if (fg10size != "") {
                                  showLocker(context, "fg10", fg10size);
                                }
                              } else {
                                if (fg10size == "") {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const addblock(
                                            from: "fg",
                                            available: true,
                                            block: "fg10",
                                            type: "f",
                                          )));
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          clipBehavior: Clip.hardEdge,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          child: AlertDialog(
                                            title: Text(
                                              "Are you sure you want to delete the block",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                              ),
                                            ),
                                            actions: [
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                                height: MediaQuery.of(context)
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
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Color(0xFF9AD6BD),
                                                    shape:
                                                        const StadiumBorder(),
                                                  ),
                                                  onPressed: () async {
                                                    //delete lockers
                                                    await FirebaseFirestore
                                                        .instance
                                                        .collection("lockers")
                                                        .where("block",
                                                            isEqualTo: "fg10")
                                                        .limit(16)
                                                        .get()
                                                        .then((v) {
                                                      v.docs.forEach((el) {
                                                        FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                "lockers")
                                                            .doc("${el.id}")
                                                            .delete();
                                                      });
                                                    });
                                                    //make block disappear in its zone
                                                    await FirebaseFirestore
                                                        .instance
                                                        .collection("zones")
                                                        .doc("fgzone")
                                                        .update({
                                                      "fg10size": "",
                                                    });
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                                height: MediaQuery.of(context)
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
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Color(0xFF9AD6BD),
                                                    shape:
                                                        const StadiumBorder(),
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
                                }
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: fg10size == "" ? w : g,
                                border: Border.all(
                                    width: 0.3, color: fg10size == "" ? w : b),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 21.1, middle: 0.73),
                        Pin(size: 16.0, start: 94), // lockrr11
                        child: Transform.rotate(
                          angle: 0,
                          child: GestureDetector(
                            onTap: () {
                              if (widget.option == "ch") {
                                if (fg11size != "") {
                                  showLocker(context, "fg11", fg11size);
                                }
                              } else {
                                if (fg11size == "") {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const addblock(
                                            from: "fg",
                                            available: true,
                                            block: "fg11",
                                            type: "f",
                                          )));
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          clipBehavior: Clip.hardEdge,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          child: AlertDialog(
                                            title: Text(
                                              "Are you sure you want to delete the block",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                              ),
                                            ),
                                            actions: [
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                                height: MediaQuery.of(context)
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
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Color(0xFF9AD6BD),
                                                    shape:
                                                        const StadiumBorder(),
                                                  ),
                                                  onPressed: () async {
                                                    //delete lockers
                                                    await FirebaseFirestore
                                                        .instance
                                                        .collection("lockers")
                                                        .where("block",
                                                            isEqualTo: "fg11")
                                                        .limit(16)
                                                        .get()
                                                        .then((v) {
                                                      v.docs.forEach((el) {
                                                        FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                "lockers")
                                                            .doc("${el.id}")
                                                            .delete();
                                                      });
                                                    });
                                                    //make block disappear in its zone
                                                    await FirebaseFirestore
                                                        .instance
                                                        .collection("zones")
                                                        .doc("fgzone")
                                                        .update({
                                                      "fg11size": "",
                                                    });
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                                height: MediaQuery.of(context)
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
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Color(0xFF9AD6BD),
                                                    shape:
                                                        const StadiumBorder(),
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
                                }
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: fg11size == "" ? w : g,
                                border: Border.all(
                                    width: 0.3, color: fg11size == "" ? w : b),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 21.1, middle: 0.66),
                        Pin(size: 16.0, start: 94), // lockrr12
                        child: Transform.rotate(
                          angle: 0,
                          child: GestureDetector(
                            onTap: () {
                              if (widget.option == "ch") {
                                if (fg12size != "") {
                                  showLocker(context, "fg12", fg12size);
                                }
                              } else {
                                if (fg12size == "") {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const addblock(
                                            from: "fg",
                                            available: true,
                                            block: "fg12",
                                            type: "f",
                                          )));
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          clipBehavior: Clip.hardEdge,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          child: AlertDialog(
                                            title: Text(
                                              "Are you sure you want to delete the block",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                              ),
                                            ),
                                            actions: [
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                                height: MediaQuery.of(context)
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
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Color(0xFF9AD6BD),
                                                    shape:
                                                        const StadiumBorder(),
                                                  ),
                                                  onPressed: () async {
                                                    //delete lockers
                                                    await FirebaseFirestore
                                                        .instance
                                                        .collection("lockers")
                                                        .where("block",
                                                            isEqualTo: "fg12")
                                                        .limit(16)
                                                        .get()
                                                        .then((v) {
                                                      v.docs.forEach((el) {
                                                        FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                "lockers")
                                                            .doc("${el.id}")
                                                            .delete();
                                                      });
                                                    });
                                                    //make block disappear in its zone
                                                    await FirebaseFirestore
                                                        .instance
                                                        .collection("zones")
                                                        .doc("fgzone")
                                                        .update({
                                                      "fg12size": "",
                                                    });
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                                height: MediaQuery.of(context)
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
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Color(0xFF9AD6BD),
                                                    shape:
                                                        const StadiumBorder(),
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
                                }
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: fg12size == "" ? w : g,
                                border: Border.all(
                                    width: 0.3, color: fg12size == "" ? w : b),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 21.1, middle: 0.59),
                        Pin(size: 16.0, start: 94), // lockrr13
                        child: Transform.rotate(
                          angle: 0,
                          child: GestureDetector(
                            onTap: () {
                              if (widget.option == "ch") {
                                if (fg13size != "") {
                                  showLocker(context, "fg13", fg13size);
                                }
                              } else {
                                if (fg13size == "") {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const addblock(
                                            from: "fg13",
                                            available: true,
                                            block: "fg13",
                                            type: "f",
                                          )));
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          clipBehavior: Clip.hardEdge,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          child: AlertDialog(
                                            title: Text(
                                              "Are you sure you want to delete the block",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                              ),
                                            ),
                                            actions: [
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                                height: MediaQuery.of(context)
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
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Color(0xFF9AD6BD),
                                                    shape:
                                                        const StadiumBorder(),
                                                  ),
                                                  onPressed: () async {
                                                    //delete lockers
                                                    await FirebaseFirestore
                                                        .instance
                                                        .collection("lockers")
                                                        .where("block",
                                                            isEqualTo: "fg13")
                                                        .limit(16)
                                                        .get()
                                                        .then((v) {
                                                      v.docs.forEach((el) {
                                                        FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                "lockers")
                                                            .doc("${el.id}")
                                                            .delete();
                                                      });
                                                    });
                                                    //make block disappear in its zone
                                                    await FirebaseFirestore
                                                        .instance
                                                        .collection("zones")
                                                        .doc("fgzone")
                                                        .update({
                                                      "fg13size": "",
                                                    });
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                                height: MediaQuery.of(context)
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
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Color(0xFF9AD6BD),
                                                    shape:
                                                        const StadiumBorder(),
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
                                }
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: fg13size == "" ? w : g,
                                border: Border.all(
                                    width: 0.3, color: fg13size == "" ? w : b),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 21.1, middle: 0.527),
                        Pin(size: 16.0, start: 94), // lockrr14
                        child: Transform.rotate(
                          angle: 0,
                          child: GestureDetector(
                            onTap: () {
                              if (widget.option == "ch") {
                                if (fg14size != "") {
                                  showLocker(context, "fg14", fg14size);
                                }
                              } else {
                                if (fg14size == "") {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const addblock(
                                            from: "fg",
                                            available: true,
                                            block: "fg14",
                                            type: "f",
                                          )));
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          clipBehavior: Clip.hardEdge,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          child: AlertDialog(
                                            title: Text(
                                              "Are you sure you want to delete the block",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                              ),
                                            ),
                                            actions: [
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                                height: MediaQuery.of(context)
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
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Color(0xFF9AD6BD),
                                                    shape:
                                                        const StadiumBorder(),
                                                  ),
                                                  onPressed: () async {
                                                    //delete lockers
                                                    await FirebaseFirestore
                                                        .instance
                                                        .collection("lockers")
                                                        .where("block",
                                                            isEqualTo: "fg14")
                                                        .limit(16)
                                                        .get()
                                                        .then((v) {
                                                      v.docs.forEach((el) {
                                                        FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                "lockers")
                                                            .doc("${el.id}")
                                                            .delete();
                                                      });
                                                    });
                                                    //make block disappear in its zone
                                                    await FirebaseFirestore
                                                        .instance
                                                        .collection("zones")
                                                        .doc("fgzone")
                                                        .update({
                                                      "fg14size": "",
                                                    });
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                                height: MediaQuery.of(context)
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
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Color(0xFF9AD6BD),
                                                    shape:
                                                        const StadiumBorder(),
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
                                }
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: fg14size == "" ? w : g,
                                border: Border.all(
                                    width: 0.3, color: fg14size == "" ? w : b),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 21.1, middle: 0.427),
                        Pin(size: 16.0, start: 145), // lockrr15
                        child: Transform.rotate(
                          angle: 1.5708,
                          child: GestureDetector(
                            onTap: () {
                              if (widget.option == "ch") {
                                if (fg15size != "") {
                                  showLocker(context, "fg15", fg15size);
                                }
                              } else {
                                if (fg15size == "") {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const addblock(
                                            from: "fg",
                                            available: true,
                                            block: "fg15",
                                            type: "f",
                                          )));
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          clipBehavior: Clip.hardEdge,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          child: AlertDialog(
                                            title: Text(
                                              "Are you sure you want to delete the block",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                              ),
                                            ),
                                            actions: [
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                                height: MediaQuery.of(context)
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
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Color(0xFF9AD6BD),
                                                    shape:
                                                        const StadiumBorder(),
                                                  ),
                                                  onPressed: () async {
                                                    //delete lockers
                                                    await FirebaseFirestore
                                                        .instance
                                                        .collection("lockers")
                                                        .where("block",
                                                            isEqualTo: "fg15")
                                                        .limit(16)
                                                        .get()
                                                        .then((v) {
                                                      v.docs.forEach((el) {
                                                        FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                "lockers")
                                                            .doc("${el.id}")
                                                            .delete();
                                                      });
                                                    });
                                                    //make block disappear in its zone
                                                    await FirebaseFirestore
                                                        .instance
                                                        .collection("zones")
                                                        .doc("fgzone")
                                                        .update({
                                                      "fg15size": "",
                                                    });
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                                height: MediaQuery.of(context)
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
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Color(0xFF9AD6BD),
                                                    shape:
                                                        const StadiumBorder(),
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
                                }
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: fg15size == "" ? w : g,
                                border: Border.all(
                                    width: 0.3, color: fg15size == "" ? w : b),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 21.1, middle: 0.427),
                        Pin(size: 16.0, start: 125), // lockrr16
                        child: Transform.rotate(
                          angle: 1.5708,
                          child: GestureDetector(
                            onTap: () {
                              if (widget.option == "ch") {
                                if (fg16size != "") {
                                  showLocker(context, "fg16", fg16size);
                                }
                              } else {
                                if (fg16size == "") {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const addblock(
                                            from: "fg",
                                            available: true,
                                            block: "fg16",
                                            type: "f",
                                          )));
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          clipBehavior: Clip.hardEdge,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          child: AlertDialog(
                                            title: Text(
                                              "Are you sure you want to delete the block",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                              ),
                                            ),
                                            actions: [
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                                height: MediaQuery.of(context)
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
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Color(0xFF9AD6BD),
                                                    shape:
                                                        const StadiumBorder(),
                                                  ),
                                                  onPressed: () async {
                                                    //delete lockers
                                                    await FirebaseFirestore
                                                        .instance
                                                        .collection("lockers")
                                                        .where("block",
                                                            isEqualTo: "fg16")
                                                        .limit(16)
                                                        .get()
                                                        .then((v) {
                                                      v.docs.forEach((el) {
                                                        FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                "lockers")
                                                            .doc("${el.id}")
                                                            .delete();
                                                      });
                                                    });
                                                    //make block disappear in its zone
                                                    await FirebaseFirestore
                                                        .instance
                                                        .collection("zones")
                                                        .doc("fgzone")
                                                        .update({
                                                      "fg16size": "",
                                                    });
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                                height: MediaQuery.of(context)
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
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Color(0xFF9AD6BD),
                                                    shape:
                                                        const StadiumBorder(),
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
                                }
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: fg16size == "" ? w : g,
                                border: Border.all(
                                    width: 0.3, color: fg16size == "" ? w : b),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 27.0, middle: 0.5524),
                        Pin(size: 8.0, start: 368), // between stairs1 bases
                        child: Transform.rotate(
                          angle: 1.5708,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffe5e5e5),
                              border: Border.all(
                                  width: 0.3, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, middle: 0.548),
                        Pin(size: 26.7, start: 358), // stairs line
                        child: SvgPicture.string(
                          _svg_ndxdyq,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, middle: 0.5432),
                        Pin(size: 26.7, start: 358), // stairs line
                        child: SvgPicture.string(
                          _svg_inin3v,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, middle: 0.5528),
                        Pin(size: 27.0, start: 358), // stairs line
                        child: SvgPicture.string(
                          _svg_if9bag,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 39.0, middle: 0.5546),
                        Pin(size: 8.0, start: 398), // between stairs1 bases
                        child: Transform.rotate(
                          angle: 1.5708,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffe5e5e5),
                              border: Border.all(
                                  width: 0.3, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 23.0, middle: 0.6),
                        Pin(size: 63.0, start: 358), //stairs base1
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffe5e5e5),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.6008),
                        Pin(size: 1.0, start: 385), // stairs line
                        child: SvgPicture.string(
                          _svg_pa14i,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.6008),
                        Pin(size: 1.0, start: 385), // stairs line
                        child: SvgPicture.string(
                          _svg_e9l6,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.6008),
                        Pin(size: 1.0, start: 393), // stairs line
                        child: SvgPicture.string(
                          _svg_feiliz,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.6008),
                        Pin(size: 1.0, start: 397), // stairs line
                        child: SvgPicture.string(
                          _svg_sohgwp,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.6008),
                        Pin(size: 1.0, start: 401), // stairs line
                        child: SvgPicture.string(
                          _svg_yxplo,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.6008),
                        Pin(size: 1.0, start: 405), // stairs line
                        child: SvgPicture.string(
                          _svg_x33p3l,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.6008),
                        Pin(size: 1.0, start: 409), // stairs line
                        child: SvgPicture.string(
                          _svg_b2nwt4,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.6008),
                        Pin(size: 1.0, start: 413), // stairs line
                        child: SvgPicture.string(
                          _svg_unqi3,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.6008),
                        Pin(size: 1.0, start: 417), // stairs line
                        child: SvgPicture.string(
                          _svg_fdv8qi,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),

                      Pinned.fromPins(
                        Pin(size: 23.0, middle: 0.5033),
                        Pin(size: 63.0, start: 358), // stairs base1
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffe5e5e5),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.5043),
                        Pin(size: 1.0, start: 390), // stairs line 3
                        child: SvgPicture.string(
                          _svg_o6swbu,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.5043),
                        Pin(size: 1.0, start: 387), // stairs line2
                        child: SvgPicture.string(
                          _svg_jg4lm6,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.5043),
                        Pin(size: 1.0, start: 393), // stairs line4
                        child: SvgPicture.string(
                          _svg_z52l8t,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.5043),
                        Pin(size: 1.0, start: 400), // stairs line6
                        child: SvgPicture.string(
                          _svg_ylpd,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.5043),
                        Pin(size: 1.0, start: 384), // stairs line1
                        child: SvgPicture.string(
                          _svg_cil5lo,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.5043),
                        Pin(size: 1.0, start: 403), // stairs line7
                        child: SvgPicture.string(
                          _svg_clktw9,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.5043),
                        Pin(size: 1.0, start: 411), // stairs line9
                        child: SvgPicture.string(
                          _svg_euye8,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.5043),
                        Pin(size: 1.0, start: 415), // stairs line10
                        child: SvgPicture.string(
                          _svg_bmv4p9,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.5034),
                        Pin(size: 1.0, start: 407), // stairs line8
                        child: SvgPicture.string(
                          _svg_z5py1a,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.4, middle: 0.5043),
                        Pin(size: 1.0, start: 397), // stairs line5
                        child: SvgPicture.string(
                          _svg_kp61nv,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 80.0, middle: 0.6132),
                        Pin(size: 36.0, start: 317),
                        child: Text(
                          'Photocopy room',
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 14,
                            color: const Color(0xff1c0000),
                            height: 1.4285714285714286,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 80.0, start: 30.0),
                        Pin(size: 36.0, start: 100),
                        child: Text(
                          '6F28\n6F34',
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 14,
                            color: const Color(0xff1c0000),
                            height: 1.4285714285714286,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
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

const String _svg_jx3xp =
    '<svg viewBox="249.1 690.3 78.9 125.7" ><path transform="translate(-2194.24, 816.18)" d="M 2443.54541015625 -125.6716384887695 C 2443.5869140625 -123.7803497314453 2443.677490234375 -126.4785385131836 2443.54541015625 -125.6716384887695 C 2443.53173828125 -123.8471298217773 2443.54541015625 -124.5504608154297 2443.54541015625 -124.5504608154297 L 2443.980224609375 -0.175445556640625 C 2443.980224609375 -0.1754300594329834 2522.24072265625 -0.175445556640625 2522.24072265625 -0.175445556640625 L 2522.24072265625 -75.53519439697266 L 2483.88623046875 -75.53519439697266 L 2483.88623046875 -124.5504608154297 L 2443.29638671875 -124.5504608154297 L 2443.54541015625 -124.5504608154297 L 2443.54541015625 -125.6716384887695 Z" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_o73xbw =
    '<svg viewBox="249.0 618.1 79.0 122.4" ><path transform="translate(-2194.52, 743.73)" d="M 2522.52490234375 -3.299476623535156 C 2521.978515625 -27.48745727539062 2522.08837890625 -3.299476623535156 2522.08837890625 -3.299476623535156 L 2522.08837890625 -125.671630859375 C 2522.08837890625 -125.671630859375 2443.545166015625 -125.671630859375 2443.545166015625 -125.671630859375 L 2443.545166015625 -52.18785095214844 L 2484.196044921875 -52.18785095214844 L 2484.196044921875 -3.299476623535156 L 2522.52490234375 -3.299476623535156 Z" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ct53v6 =
    '<svg viewBox="249.1 690.3 78.9 125.7" ><path transform="translate(-2194.24, 816.18)" d="M 2443.54541015625 -125.6716384887695 C 2443.5869140625 -123.7803497314453 2443.677490234375 -126.4785385131836 2443.54541015625 -125.6716384887695 C 2443.53173828125 -123.8471298217773 2443.54541015625 -124.5504608154297 2443.54541015625 -124.5504608154297 L 2443.980224609375 -0.175445556640625 C 2443.980224609375 -0.1754300594329834 2522.24072265625 -0.175445556640625 2522.24072265625 -0.175445556640625 L 2522.24072265625 -75.53519439697266 L 2483.88623046875 -75.53519439697266 L 2483.88623046875 -124.5504608154297 L 2443.29638671875 -124.5504608154297 L 2443.54541015625 -124.5504608154297 L 2443.54541015625 -125.6716384887695 Z" fill="#d6fff0" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_f2vz4y =
    '<svg viewBox="249.0 618.1 79.0 122.4" ><path transform="translate(-2194.52, 743.73)" d="M 2522.52490234375 -3.299476623535156 C 2521.978515625 -27.48745727539062 2522.08837890625 -3.299476623535156 2522.08837890625 -3.299476623535156 L 2522.08837890625 -125.671630859375 C 2522.08837890625 -125.671630859375 2443.545166015625 -125.671630859375 2443.545166015625 -125.671630859375 L 2443.545166015625 -52.18785095214844 L 2484.196044921875 -52.18785095214844 L 2484.196044921875 -3.299476623535156 L 2522.52490234375 -3.299476623535156 Z" fill="#efecec" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ehjdeq =
    '<svg viewBox="171.1 690.3 78.9 125.7" ><path transform="translate(-2272.24, 816.18)" d="M 2443.54541015625 -125.6716384887695 C 2443.5869140625 -123.7803497314453 2443.677490234375 -126.4785385131836 2443.54541015625 -125.6716384887695 C 2443.53173828125 -123.8471298217773 2443.54541015625 -124.5504608154297 2443.54541015625 -124.5504608154297 L 2443.980224609375 -0.175445556640625 C 2443.980224609375 -0.1754300594329834 2522.24072265625 -0.175445556640625 2522.24072265625 -0.175445556640625 L 2522.24072265625 -75.53519439697266 L 2483.88623046875 -75.53519439697266 L 2483.88623046875 -124.5504608154297 L 2443.29638671875 -124.5504608154297 L 2443.54541015625 -124.5504608154297 L 2443.54541015625 -125.6716384887695 Z" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_i06p =
    '<svg viewBox="171.0 618.1 79.0 122.4" ><path transform="translate(-2272.52, 743.73)" d="M 2522.52490234375 -3.299476623535156 C 2521.978515625 -27.48745727539062 2522.08837890625 -3.299476623535156 2522.08837890625 -3.299476623535156 L 2522.08837890625 -125.671630859375 C 2522.08837890625 -125.671630859375 2443.545166015625 -125.671630859375 2443.545166015625 -125.671630859375 L 2443.545166015625 -52.18785095214844 L 2484.196044921875 -52.18785095214844 L 2484.196044921875 -3.299476623535156 L 2522.52490234375 -3.299476623535156 Z" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_fn5nh9 =
    '<svg viewBox="171.1 690.3 78.9 125.7" ><path transform="translate(-2272.24, 816.18)" d="M 2443.54541015625 -125.6716384887695 C 2443.5869140625 -123.7803497314453 2443.677490234375 -126.4785385131836 2443.54541015625 -125.6716384887695 C 2443.53173828125 -123.8471298217773 2443.54541015625 -124.5504608154297 2443.54541015625 -124.5504608154297 L 2443.980224609375 -0.175445556640625 C 2443.980224609375 -0.1754300594329834 2522.24072265625 -0.175445556640625 2522.24072265625 -0.175445556640625 L 2522.24072265625 -75.53519439697266 L 2483.88623046875 -75.53519439697266 L 2483.88623046875 -124.5504608154297 L 2443.29638671875 -124.5504608154297 L 2443.54541015625 -124.5504608154297 L 2443.54541015625 -125.6716384887695 Z" fill="#d6fff0" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_nn2c3 =
    '<svg viewBox="171.0 618.1 79.0 122.4" ><path transform="translate(-2272.52, 743.73)" d="M 2522.52490234375 -3.299476623535156 C 2521.978515625 -27.48745727539062 2522.08837890625 -3.299476623535156 2522.08837890625 -3.299476623535156 L 2522.08837890625 -125.671630859375 C 2522.08837890625 -125.671630859375 2443.545166015625 -125.671630859375 2443.545166015625 -125.671630859375 L 2443.545166015625 -52.18785095214844 L 2484.196044921875 -52.18785095214844 L 2484.196044921875 -3.299476623535156 L 2522.52490234375 -3.299476623535156 Z" fill="#efecec" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_iye8o =
    '<svg viewBox="92.1 690.3 78.9 125.7" ><path transform="translate(-2351.24, 816.18)" d="M 2443.54541015625 -125.6716384887695 C 2443.5869140625 -123.7803497314453 2443.677490234375 -126.4785385131836 2443.54541015625 -125.6716384887695 C 2443.53173828125 -123.8471298217773 2443.54541015625 -124.5504608154297 2443.54541015625 -124.5504608154297 L 2443.980224609375 -0.175445556640625 C 2443.980224609375 -0.1754300594329834 2522.24072265625 -0.175445556640625 2522.24072265625 -0.175445556640625 L 2522.24072265625 -75.53519439697266 L 2483.88623046875 -75.53519439697266 L 2483.88623046875 -124.5504608154297 L 2443.29638671875 -124.5504608154297 L 2443.54541015625 -124.5504608154297 L 2443.54541015625 -125.6716384887695 Z" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_lcdqx =
    '<svg viewBox="92.0 618.1 79.0 122.4" ><path transform="translate(-2351.52, 743.73)" d="M 2522.52490234375 -3.299476623535156 C 2521.978515625 -27.48745727539062 2522.08837890625 -3.299476623535156 2522.08837890625 -3.299476623535156 L 2522.08837890625 -125.671630859375 C 2522.08837890625 -125.671630859375 2443.545166015625 -125.671630859375 2443.545166015625 -125.671630859375 L 2443.545166015625 -52.18785095214844 L 2484.196044921875 -52.18785095214844 L 2484.196044921875 -3.299476623535156 L 2522.52490234375 -3.299476623535156 Z" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_aongdj =
    '<svg viewBox="92.1 690.3 78.9 125.7" ><path transform="translate(-2351.24, 816.18)" d="M 2443.54541015625 -125.6716384887695 C 2443.5869140625 -123.7803497314453 2443.677490234375 -126.4785385131836 2443.54541015625 -125.6716384887695 C 2443.53173828125 -123.8471298217773 2443.54541015625 -124.5504608154297 2443.54541015625 -124.5504608154297 L 2443.980224609375 -0.175445556640625 C 2443.980224609375 -0.1754300594329834 2522.24072265625 -0.175445556640625 2522.24072265625 -0.175445556640625 L 2522.24072265625 -75.53519439697266 L 2483.88623046875 -75.53519439697266 L 2483.88623046875 -124.5504608154297 L 2443.29638671875 -124.5504608154297 L 2443.54541015625 -124.5504608154297 L 2443.54541015625 -125.6716384887695 Z" fill="#d6fff0" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_dida0n =
    '<svg viewBox="92.0 618.1 79.0 122.4" ><path transform="translate(-2351.52, 743.73)" d="M 2522.52490234375 -3.299476623535156 C 2521.978515625 -27.48745727539062 2522.08837890625 -3.299476623535156 2522.08837890625 -3.299476623535156 L 2522.08837890625 -125.671630859375 C 2522.08837890625 -125.671630859375 2443.545166015625 -125.671630859375 2443.545166015625 -125.671630859375 L 2443.545166015625 -52.18785095214844 L 2484.196044921875 -52.18785095214844 L 2484.196044921875 -3.299476623535156 L 2522.52490234375 -3.299476623535156 Z" fill="#efecec" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_u8p0r6 =
    '<svg viewBox="14.1 690.3 78.9 125.7" ><path transform="translate(-2429.24, 816.18)" d="M 2443.54541015625 -125.6716384887695 C 2443.5869140625 -123.7803497314453 2443.677490234375 -126.4785385131836 2443.54541015625 -125.6716384887695 C 2443.53173828125 -123.8471298217773 2443.54541015625 -124.5504608154297 2443.54541015625 -124.5504608154297 L 2443.980224609375 -0.175445556640625 C 2443.980224609375 -0.1754300594329834 2522.24072265625 -0.175445556640625 2522.24072265625 -0.175445556640625 L 2522.24072265625 -75.53519439697266 L 2483.88623046875 -75.53519439697266 L 2483.88623046875 -124.5504608154297 L 2443.29638671875 -124.5504608154297 L 2443.54541015625 -124.5504608154297 L 2443.54541015625 -125.6716384887695 Z" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_plkc3n =
    '<svg viewBox="14.0 618.1 79.0 122.4" ><path transform="translate(-2429.52, 743.73)" d="M 2522.52490234375 -3.299476623535156 C 2521.978515625 -27.48745727539062 2522.08837890625 -3.299476623535156 2522.08837890625 -3.299476623535156 L 2522.08837890625 -125.671630859375 C 2522.08837890625 -125.671630859375 2443.545166015625 -125.671630859375 2443.545166015625 -125.671630859375 L 2443.545166015625 -52.18785095214844 L 2484.196044921875 -52.18785095214844 L 2484.196044921875 -3.299476623535156 L 2522.52490234375 -3.299476623535156 Z" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_aa0bz =
    '<svg viewBox="14.1 690.3 78.9 125.7" ><path transform="translate(-2429.24, 816.18)" d="M 2443.54541015625 -125.6716384887695 C 2443.5869140625 -123.7803497314453 2443.677490234375 -126.4785385131836 2443.54541015625 -125.6716384887695 C 2443.53173828125 -123.8471298217773 2443.54541015625 -124.5504608154297 2443.54541015625 -124.5504608154297 L 2443.980224609375 -0.175445556640625 C 2443.980224609375 -0.1754300594329834 2522.24072265625 -0.175445556640625 2522.24072265625 -0.175445556640625 L 2522.24072265625 -75.53519439697266 L 2483.88623046875 -75.53519439697266 L 2483.88623046875 -124.5504608154297 L 2443.29638671875 -124.5504608154297 L 2443.54541015625 -124.5504608154297 L 2443.54541015625 -125.6716384887695 Z" fill="#d6fff0" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_gxlwbj =
    '<svg viewBox="14.0 618.1 79.0 122.4" ><path transform="translate(-2429.52, 743.73)" d="M 2522.52490234375 -3.299476623535156 C 2521.978515625 -27.48745727539062 2522.08837890625 -3.299476623535156 2522.08837890625 -3.299476623535156 L 2522.08837890625 -125.671630859375 C 2522.08837890625 -125.671630859375 2443.545166015625 -125.671630859375 2443.545166015625 -125.671630859375 L 2443.545166015625 -52.18785095214844 L 2484.196044921875 -52.18785095214844 L 2484.196044921875 -3.299476623535156 L 2522.52490234375 -3.299476623535156 Z" fill="#efecec" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_co67m9 =
    '<svg viewBox="241.0 277.5 26.7 1.0" ><path transform="translate(241.0, 277.55)" d="M 0 0 L 26.705078125 0" fill="none" stroke="#000000" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_zan6zu =
    '<svg viewBox="241.0 279.1 26.7 1.0" ><path transform="translate(241.0, 279.09)" d="M 0 0 L 26.705078125 0" fill="none" stroke="#000000" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_so97s =
    '<svg viewBox="241.0 276.0 27.0 1.0" ><path transform="translate(241.0, 276.0)" d="M 0 0 L 27 0" fill="none" stroke="#000000" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_qs7urw =
    '<svg viewBox="271.4 253.6 1.0 20.3" ><path transform="translate(271.4, 253.62)" d="M 0 0 L 0 20.299560546875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_g77jpq =
    '<svg viewBox="275.2 253.6 1.0 20.3" ><path transform="translate(275.17, 253.62)" d="M 0 0 L 0 20.299560546875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_o0dmv =
    '<svg viewBox="279.6 253.6 1.0 20.3" ><path transform="translate(279.63, 253.62)" d="M 0 0 L 0 20.299560546875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_y4j9qf =
    '<svg viewBox="283.7 253.6 1.0 20.3" ><path transform="translate(283.75, 253.62)" d="M 0 0 L 0 20.299560546875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_vj2m0f =
    '<svg viewBox="291.3 253.6 1.0 20.3" ><path transform="translate(291.31, 253.62)" d="M 0 0 L 0 20.299560546875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_m9naz7 =
    '<svg viewBox="294.3 253.6 1.0 20.3" ><path transform="translate(294.28, 253.62)" d="M 0 0 L 0 20.299560546875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ecu =
    '<svg viewBox="271.4 254.3 1.0 20.2" ><path transform="translate(271.4, 254.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ea22zy =
    '<svg viewBox="275.2 254.3 1.0 20.2" ><path transform="translate(275.17, 254.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_xp5 =
    '<svg viewBox="279.6 254.3 1.0 20.2" ><path transform="translate(279.63, 254.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_rm3jvr =
    '<svg viewBox="283.7 254.3 1.0 20.2" ><path transform="translate(283.75, 254.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_fjj2mn =
    '<svg viewBox="291.3 254.3 1.0 20.2" ><path transform="translate(291.31, 254.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_g90z =
    '<svg viewBox="294.3 254.3 1.0 20.2" ><path transform="translate(294.28, 254.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_haivz2 =
    '<svg viewBox="298.3 254.7 1.0 20.2" ><path transform="translate(298.28, 254.68)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_nb5hd2 =
    '<svg viewBox="301.0 254.7 1.0 20.2" ><path transform="translate(300.99, 254.68)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_h9pi =
    '<svg viewBox="288.1 254.3 1.0 20.2" ><path transform="translate(288.12, 254.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_vn1f2 =
    '<svg viewBox="271.4 280.3 1.0 20.2" ><path transform="translate(271.4, 280.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_aemh0 =
    '<svg viewBox="275.2 280.3 1.0 20.2" ><path transform="translate(275.17, 280.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_gerrt =
    '<svg viewBox="279.6 280.3 1.0 20.2" ><path transform="translate(279.63, 280.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_c1muet =
    '<svg viewBox="283.7 280.3 1.0 20.2" ><path transform="translate(283.75, 280.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_v3zs3l =
    '<svg viewBox="291.3 280.3 1.0 20.2" ><path transform="translate(291.31, 280.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_d0gfz =
    '<svg viewBox="294.3 280.3 1.0 20.2" ><path transform="translate(294.28, 280.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_wuzlg0 =
    '<svg viewBox="298.3 280.7 1.0 20.2" ><path transform="translate(298.28, 280.68)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_w5hv54 =
    '<svg viewBox="301.0 280.7 1.0 20.2" ><path transform="translate(300.99, 280.68)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ezfrg =
    '<svg viewBox="288.1 280.3 1.0 20.2" ><path transform="translate(288.12, 280.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ndxdyq =
    '<svg viewBox="186.5 445.0 1.0 26.7" ><path transform="matrix(0.0, 1.0, -1.0, 0.0, 186.45, 445.0)" d="M 0 0 L 26.705078125 0" fill="none" stroke="#000000" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_inin3v =
    '<svg viewBox="184.9 445.0 1.0 26.7" ><path transform="matrix(0.0, 1.0, -1.0, 0.0, 184.91, 445.0)" d="M 0 0 L 26.705078125 0" fill="none" stroke="#000000" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_if9bag =
    '<svg viewBox="188.0 445.0 1.0 27.0" ><path transform="matrix(0.0, 1.0, -1.0, 0.0, 188.0, 445.0)" d="M 0 0 L 27 0" fill="none" stroke="#000000" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_pa14i =
    '<svg viewBox="190.6 477.2 22.4 1.0" ><path transform="translate(190.61, 477.17)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_e9l6 =
    '<svg viewBox="190.6 473.0 22.4 1.0" ><path transform="translate(190.61, 472.98)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_feiliz =
    '<svg viewBox="190.6 481.4 22.4 1.0" ><path transform="translate(190.61, 481.36)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_sohgwp =
    '<svg viewBox="190.6 489.5 22.4 1.0" ><path transform="translate(190.61, 489.55)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_yxplo =
    '<svg viewBox="190.6 468.8 22.4 1.0" ><path transform="translate(190.61, 468.79)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_x33p3l =
    '<svg viewBox="190.6 493.7 22.4 1.0" ><path transform="translate(190.61, 493.73)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_b2nwt4 =
    '<svg viewBox="190.6 500.5 22.4 1.0" ><path transform="translate(190.61, 500.45)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_unqi3 =
    '<svg viewBox="190.6 503.9 22.4 1.0" ><path transform="translate(190.61, 503.91)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_fdv8qi =
    '<svg viewBox="190.3 497.0 22.4 1.0" ><path transform="translate(190.32, 496.99)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_n6gj =
    '<svg viewBox="190.6 485.4 22.4 1.0" ><path transform="translate(190.61, 485.36)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_o6swbu =
    '<svg viewBox="161.6 477.2 22.4 1.0" ><path transform="translate(161.61, 477.17)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_jg4lm6 =
    '<svg viewBox="161.6 473.0 22.4 1.0" ><path transform="translate(161.61, 472.98)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_z52l8t =
    '<svg viewBox="161.6 481.4 22.4 1.0" ><path transform="translate(161.61, 481.36)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ylpd =
    '<svg viewBox="161.6 489.5 22.4 1.0" ><path transform="translate(161.61, 489.55)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_cil5lo =
    '<svg viewBox="161.6 468.8 22.4 1.0" ><path transform="translate(161.61, 468.79)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_clktw9 =
    '<svg viewBox="161.6 493.7 22.4 1.0" ><path transform="translate(161.61, 493.73)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_euye8 =
    '<svg viewBox="161.6 500.5 22.4 1.0" ><path transform="translate(161.61, 500.45)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_bmv4p9 =
    '<svg viewBox="161.6 503.9 22.4 1.0" ><path transform="translate(161.61, 503.91)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_z5py1a =
    '<svg viewBox="161.3 497.0 22.4 1.0" ><path transform="translate(161.32, 496.99)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_kp61nv =
    '<svg viewBox="161.6 485.4 22.4 1.0" ><path transform="translate(161.61, 485.36)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
