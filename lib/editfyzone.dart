import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:adobe_xd/blend_mask.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:relocker_sa/payment_view/reservation_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'addblock.dart';
import 'controller_admin.dart';
import 'controller_view_screen.dart';

int Rendifference = 0;
int Resdifference = 0;
String fy1size = "";
String fy2size = "";
String fy3size = "";
String fy4size = "";
String fy5size = "";
String fy6size = "";
String fy7size = "";
String fy8size = "";
String fy9size = "";
String fy10size = "";
String fy11size = "";
String fy12size = "";
String fy13size = "";
String fy14size = "";
String fy15size = "";
String fy16size = "";

Color w = Color.fromARGB(255, 164, 161, 161);
Color g = Color(0xFFA1E2C9);
Color b = Color.fromARGB(255, 10, 10, 10);

class editfyzone extends StatefulWidget {
  final String? option;

  editfyzone({
    Key? key,
    this.option = "",
  }) : super(key: key);

  @override
  State<editfyzone> createState() => _editfyzoneState();
}

class _editfyzoneState extends State<editfyzone> {
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
                  // Container(
                  //   width: 80.0,
                  //   height: 200,
                  //   child: Stack(
                  //     children: [
                  //       Positioned(
                  //         top: 0,
                  //         child: Container(
                  //           child: SvgPicture.string(
                  //             _svg_f2vz4y,
                  //             allowDrawingOutsideViewBox: true,
                  //             fit: BoxFit.fill,
                  //           ),
                  //         ),
                  //       ),
                  //       Positioned(
                  //         bottom: 0,
                  //         child: Container(
                  //             child: SvgPicture.string(
                  //           _svg_ct53v6,
                  //           allowDrawingOutsideViewBox: true,
                  //           fit: BoxFit.fill,
                  //         )),
                  //       )
                  //     ],
                  //   ),
                  // ),

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
                                                    ? Colors.redAccent.shade100
                                                    : Colors.grey,
                                          ),
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
                                                      mySvg1(
                                                        data1["available"]
                                                            ? "FFA5D6A7"
                                                            : data1['maintanence']
                                                                ? "FFFF8A80"
                                                                : "FF9E9E9E",
                                                      ),
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
        .doc("fyzone") //zone
        .get();

    setState(() {
      fy1size = doc['fy1size'];
      fy2size = doc['fy2size'];
      fy3size = doc['fy3size'];
      fy4size = doc['fy4size'];
      fy5size = doc['fy5size'];
      fy6size = doc['fy6size'];
      fy7size = doc['fy7size'];
      fy8size = doc['fy8size'];
      fy9size = doc['fy9size'];
      fy10size = doc['fy10size'];
      fy11size = doc['fy11size'];
      fy12size = doc['fy12size'];
      fy13size = doc['fy13size'];
      fy14size = doc['fy14size'];
      fy15size = doc['fy15size'];
      fy16size = doc['fy16size'];
    });
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
            Pin(size: 323.0, middle: 0.5618),
            Pin(start: 109.0, end: 0.0),
            child: Scrollbar(
              child: SingleChildScrollView(
                child: SizedBox(
                  width: 323.0,
                  height: 800.0,
                  child: Stack(
                    children: <Widget>[
                      // ------------------- map -------------------------

                      Pinned.fromPins(
                        Pin(size: 152.7, start: 24.1),
                        Pin(size: 218.1, start: 86), // middle area
                        child: Transform.rotate(
                          angle: 3.1416,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xfffcc425),
                              border: Border.all(
                                  width: 0.5, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 53.0, start: 110.3),
                        Pin(size: 16.0, start: 200), // 6G02
                        child: Text(
                          '6G02',
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
                        Pin(size: 53.0, start: 39.9),
                        Pin(size: 16.0, start: 100), // 6G01
                        child: Text(
                          '6G01',
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
                        Pin(size: 96.8, start: 24.1),
                        Pin(size: 74.9, start: 328), // 6G03 class
                        child: Transform.rotate(
                          angle: 3.1416,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xfffcc51f),
                              border: Border.all(
                                  width: 0.5, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 53.0, start: 43.1),
                        Pin(size: 16.0, start: 360), // 6G03
                        child: Text(
                          '6G03',
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
                        Pin(size: 77.1, start: 23.3),
                        Pin(size: 57.4, start: 180), // white
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                            border: Border.all(
                                width: 0.3,
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 47.1, start: 24.3),
                        Pin(size: 27.4, start: 276), // stairs base
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffe4e4e4),
                            border: Border.all(
                                width: 0.3, color: const Color(0xff1c0000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, start: 49.0),
                        Pin(size: 27.1, start: 276), // stairs line
                        child: SvgPicture.string(
                          _svg_keikg,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, start: 44.3),
                        Pin(size: 27.1, start: 276), // stairs line
                        child: SvgPicture.string(
                          _svg_xhp1c,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, start: 39.6),
                        Pin(size: 27.1, start: 276), // stairs line
                        child: SvgPicture.string(
                          _svg_bj8reo,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, start: 34.9),
                        Pin(size: 27.1, start: 276), // stairs line
                        child: SvgPicture.string(
                          _svg_dwbxvk,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, start: 26.8),
                        Pin(size: 27.1, start: 276), // stairs line
                        child: SvgPicture.string(
                          _svg_dw3n40,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, start: 30.9),
                        Pin(size: 27.1, start: 276), // stairs line
                        child: SvgPicture.string(
                          _svg_j0qngg,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 47.1, start: 24.3),
                        Pin(size: 13.4, start: 263), // between stairs base
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffe4e4e4),
                            border: Border.all(
                                width: 0.3, color: const Color(0xff1c0000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 47.1, start: 24.3),
                        Pin(size: 27.4, start: 243), // stairs base
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffe4e4e4),
                            border: Border.all(
                                width: 0.3, color: const Color(0xff1c0000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, start: 49.0),
                        Pin(size: 27.1, start: 243), // stairs line
                        child: SvgPicture.string(
                          _svg_keikg,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, start: 44.3),
                        Pin(size: 27.1, start: 243), // stairs line
                        child: SvgPicture.string(
                          _svg_xhp1c,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, start: 39.6),
                        Pin(size: 27.1, start: 243), // stairs line
                        child: SvgPicture.string(
                          _svg_bj8reo,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, start: 34.9),
                        Pin(size: 27.1, start: 243), // stairs line
                        child: SvgPicture.string(
                          _svg_dwbxvk,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, start: 26.8),
                        Pin(size: 27.1, start: 243), // stairs line
                        child: SvgPicture.string(
                          _svg_dw3n40,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, start: 30.9),
                        Pin(size: 27.1, start: 243), // stairs line
                        child: SvgPicture.string(
                          _svg_j0qngg,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 68.1, end: 39.4),
                        Pin(size: 59.5, start: 222), // 6g06 class
                        child: Transform.rotate(
                          angle: 3.1416,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xfffcc425),
                              border: Border.all(
                                  width: 0.5, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 68.1, end: 39.4),
                        Pin(size: 63.0, start: 160), // 6g07 class
                        child: Transform.rotate(
                          angle: 3.1416,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xfffcc425),
                              border: Border.all(
                                  width: 0.5, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 68.1, end: 39.4),
                        Pin(size: 24.7, start: 136), // exit
                        child: Transform.rotate(
                          angle: 3.1416,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xff7dd871),
                              border: Border.all(
                                  width: 0.5, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 68.1, end: 39.4),
                        Pin(size: 64.7, start: 72), // 6g09 class
                        child: Transform.rotate(
                          angle: 3.1416,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xfffcc425),
                              border: Border.all(
                                  width: 0.5, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 68.1, end: 39.4),
                        Pin(size: 64.3, start: 8.3), // 6g11 class
                        child: Transform.rotate(
                          angle: 3.1416,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xfffcc425),
                              border: Border.all(
                                  width: 0.5, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 65.0, end: 39.1),
                        Pin(size: 16.0, start: 32.5), // 6G11
                        child: Text(
                          '6G11',
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
                        Pin(size: 65.0, end: 41.0),
                        Pin(size: 16.0, start: 100), // 6G09
                        child: Text(
                          '6G09',
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
                        Pin(size: 65.0, end: 39.9),
                        Pin(size: 16.0, start: 185), // 6G07
                        child: Text(
                          '6G07',
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
                        Pin(size: 65.0, end: 39.9),
                        Pin(size: 16.0, start: 245), // 6G06
                        child: Text(
                          '6G06',
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
                        Pin(size: 42.0, middle: 0.817),
                        Pin(size: 14.0, start: 142), // Exit
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
                        Pin(size: 68.1, end: 39.4),
                        Pin(size: 29.3, start: 281), // empty class
                        child: Transform.rotate(
                          angle: 3.1416,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xfffcc425),
                              border: Border.all(
                                  width: 0.5, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 68.1, end: 39.4),
                        Pin(size: 93.1, start: 310), //6G05 class
                        child: Transform.rotate(
                          angle: 3.1416,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xfffcc425),
                              border: Border.all(
                                  width: 0.5, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 65.0, end: 39.1),
                        Pin(size: 16.0, start: 350), //6G05
                        child: Text(
                          '6G05',
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
                        Pin(size: 55.4, middle: 0.4515),
                        Pin(size: 78.6, start: 8.3), //6G10 class
                        child: Transform.rotate(
                          angle: 3.1416,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xfffcc425),
                              border: Border.all(
                                  width: 0.5, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 53.0, middle: 0.4582),
                        Pin(size: 16.0, start: 45.0), //6G10
                        child: Text(
                          '6G10',
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
                        Pin(size: 94.7, middle: 0.5291),
                        Pin(size: 75.1, start: 328), // 6G04 calss
                        child: Transform.rotate(
                          angle: 3.1416,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xfffcc51f),
                              border: Border.all(
                                  width: 0.5, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 62.6, middle: 0.4364),
                        Pin(size: 57.7, start: 87), //grey box
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
                        Pin(size: 53.0, middle: 0.5195),
                        Pin(size: 16.0, start: 360), //6G04
                        child: Text(
                          '6G04',
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
                        Pin(size: 18.0, start: 37.1),
                        Pin(size: 24.0, start: 301), // lockr1
                        child: Transform.rotate(
                          angle: 1.5708,
                          child: GestureDetector(
                            onTap: () {
                              if (widget.option == "ch") {
                                if (fy1size != "") {
                                  showLocker(context, "fy1", fy1size);
                                }
                              } else {
                                if (fy1size == "") {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const addblock(
                                            from: "fy",
                                            available: true,
                                            block: "fy1",
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
                                                            isEqualTo: "fy1")
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
                                                        .doc("fyzone")
                                                        .update({
                                                      "fy1size": "",
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
                                color: fy1size == "" ? w : g,
                                border: Border.all(
                                    width: 0.3, color: fy1size == "" ? w : b),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 18.0, start: 61),
                        Pin(size: 24.0, start: 301), // lockr 2
                        child: Transform.rotate(
                          angle: 1.5708,
                          child: GestureDetector(
                            onTap: () {
                              if (widget.option == "ch") {
                                if (fy2size != "") {
                                  showLocker(context, "fy2", fy2size);
                                }
                              } else {
                                if (fy2size == "") {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const addblock(
                                            from: "fy",
                                            available: true,
                                            block: "fy2",
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
                                                            isEqualTo: "fy2")
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
                                                        .doc("fyzone")
                                                        .update({
                                                      "fy2size": "",
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
                                color: fy2size == "" ? w : g,
                                border: Border.all(
                                    width: 0.3, color: fy2size == "" ? w : b),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 18.0, middle: 0.2764),
                        Pin(size: 24.0, start: 301), // locker3
                        child: Transform.rotate(
                          angle: 1.5708,
                          child: GestureDetector(
                            onTap: () {
                              if (widget.option == "ch") {
                                if (fy3size != "") {
                                  showLocker(context, "fy3", fy3size);
                                }
                              } else {
                                if (fy3size == "") {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const addblock(
                                            from: "fy",
                                            available: true,
                                            block: "fy3",
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
                                                            isEqualTo: "fy3")
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
                                                        .doc("fyzone")
                                                        .update({
                                                      "fy3size": "",
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
                                color: fy3size == "" ? w : g,
                                border: Border.all(
                                    width: 0.3, color: fy3size == "" ? w : b),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 18.0, middle: 0.3747),
                        Pin(size: 24.0, start: 301), // locker4
                        child: Transform.rotate(
                          angle: 1.5708,
                          child: GestureDetector(
                            onTap: () {
                              if (widget.option == "ch") {
                                if (fy4size != "") {
                                  showLocker(context, "fy4", fy4size);
                                }
                              } else {
                                if (fy4size == "") {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const addblock(
                                            from: "fy",
                                            available: true,
                                            block: "fy4",
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
                                                            isEqualTo: "fy4")
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
                                                        .doc("fyzone")
                                                        .update({
                                                      "fy4size": "",
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
                                color: fy4size == "" ? w : g,
                                border: Border.all(
                                    width: 0.3, color: fy4size == "" ? w : b),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 18.0, middle: 0.5794),
                        Pin(size: 24.0, start: 177), // locker 5

                        child: GestureDetector(
                          onTap: () {
                            if (widget.option == "ch") {
                              if (fy5size != "") {
                                showLocker(context, "fy5", fy5size);
                              }
                            } else {
                              if (fy5size == "") {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const addblock(
                                          from: "fy",
                                          available: true,
                                          block: "fy5",
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
                                                style: ElevatedButton.styleFrom(
                                                  primary: Color(0xFF9AD6BD),
                                                  shape: const StadiumBorder(),
                                                ),
                                                onPressed: () async {
                                                  //delete lockers
                                                  await FirebaseFirestore
                                                      .instance
                                                      .collection("lockers")
                                                      .where("block",
                                                          isEqualTo: "fy5")
                                                      .limit(16)
                                                      .get()
                                                      .then((v) {
                                                    v.docs.forEach((el) {
                                                      FirebaseFirestore.instance
                                                          .collection("lockers")
                                                          .doc("${el.id}")
                                                          .delete();
                                                    });
                                                  });
                                                  //make block disappear in its zone
                                                  await FirebaseFirestore
                                                      .instance
                                                      .collection("zones")
                                                      .doc("fyzone")
                                                      .update({
                                                    "fy5size": "",
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
                              }
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: fy5size == "" ? w : g,
                              border: Border.all(
                                  width: 0.3, color: fy5size == "" ? w : b),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 18.0, middle: 0.5794),
                        Pin(size: 24.0, start: 155), // locker6

                        child: GestureDetector(
                          onTap: () {
                            if (widget.option == "ch") {
                              if (fy6size != "") {
                                showLocker(context, "fy6", fy6size);
                              }
                            } else {
                              if (fy6size == "") {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const addblock(
                                          from: "fy",
                                          available: true,
                                          block: "fy6",
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
                                                style: ElevatedButton.styleFrom(
                                                  primary: Color(0xFF9AD6BD),
                                                  shape: const StadiumBorder(),
                                                ),
                                                onPressed: () async {
                                                  //delete lockers
                                                  await FirebaseFirestore
                                                      .instance
                                                      .collection("lockers")
                                                      .where("block",
                                                          isEqualTo: "fy6")
                                                      .limit(16)
                                                      .get()
                                                      .then((v) {
                                                    v.docs.forEach((el) {
                                                      FirebaseFirestore.instance
                                                          .collection("lockers")
                                                          .doc("${el.id}")
                                                          .delete();
                                                    });
                                                  });
                                                  //make block disappear in its zone
                                                  await FirebaseFirestore
                                                      .instance
                                                      .collection("zones")
                                                      .doc("fyzone")
                                                      .update({
                                                    "fy6size": "",
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
                              }
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: fy6size == "" ? w : g,
                              border: Border.all(
                                  width: 0.3, color: fy6size == "" ? w : b),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 18.0, middle: 0.5794),
                        Pin(size: 24.0, start: 123), // lockr7

                        child: GestureDetector(
                          onTap: () {
                            if (widget.option == "ch") {
                              if (fy7size != "") {
                                showLocker(context, "fy7", fy7size);
                              }
                            } else {
                              if (fy7size == "") {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const addblock(
                                          from: "fy",
                                          available: true,
                                          block: "fy7",
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
                                                style: ElevatedButton.styleFrom(
                                                  primary: Color(0xFF9AD6BD),
                                                  shape: const StadiumBorder(),
                                                ),
                                                onPressed: () async {
                                                  //delete lockers
                                                  await FirebaseFirestore
                                                      .instance
                                                      .collection("lockers")
                                                      .where("block",
                                                          isEqualTo: "fy7")
                                                      .limit(16)
                                                      .get()
                                                      .then((v) {
                                                    v.docs.forEach((el) {
                                                      FirebaseFirestore.instance
                                                          .collection("lockers")
                                                          .doc("${el.id}")
                                                          .delete();
                                                    });
                                                  });
                                                  //make block disappear in its zone
                                                  await FirebaseFirestore
                                                      .instance
                                                      .collection("zones")
                                                      .doc("fyzone")
                                                      .update({
                                                    "fy7size": "",
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
                              }
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: fy7size == "" ? w : g,
                              border: Border.all(
                                  width: 0.3, color: fy7size == "" ? w : b),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 18.0, middle: 0.5794),
                        Pin(size: 24.0, start: 100), // lockr8

                        child: GestureDetector(
                          onTap: () {
                            if (widget.option == "ch") {
                              if (fy8size != "") {
                                showLocker(context, "fy8", fy8size);
                              }
                            } else {
                              if (fy8size == "") {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const addblock(
                                          from: "fy",
                                          available: true,
                                          block: "fy8",
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
                                                style: ElevatedButton.styleFrom(
                                                  primary: Color(0xFF9AD6BD),
                                                  shape: const StadiumBorder(),
                                                ),
                                                onPressed: () async {
                                                  //delete lockers
                                                  await FirebaseFirestore
                                                      .instance
                                                      .collection("lockers")
                                                      .where("block",
                                                          isEqualTo: "fy8")
                                                      .limit(16)
                                                      .get()
                                                      .then((v) {
                                                    v.docs.forEach((el) {
                                                      FirebaseFirestore.instance
                                                          .collection("lockers")
                                                          .doc("${el.id}")
                                                          .delete();
                                                    });
                                                  });
                                                  //make block disappear in its zone
                                                  await FirebaseFirestore
                                                      .instance
                                                      .collection("zones")
                                                      .doc("fyzone")
                                                      .update({
                                                    "fy8size": "",
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
                              }
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: fy8size == "" ? w : g,
                              border: Border.all(
                                  width: 0.3, color: fy8size == "" ? w : b),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 18.0, middle: 0.5794),
                        Pin(size: 24.0, start: 220), // locker9

                        child: GestureDetector(
                          onTap: () {
                            if (widget.option == "ch") {
                              if (fy9size != "") {
                                showLocker(context, "fy9", fy9size);
                              }
                            } else {
                              if (fy9size == "") {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const addblock(
                                          from: "fy",
                                          available: true,
                                          block: "fy9",
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
                                                style: ElevatedButton.styleFrom(
                                                  primary: Color(0xFF9AD6BD),
                                                  shape: const StadiumBorder(),
                                                ),
                                                onPressed: () async {
                                                  //delete lockers
                                                  await FirebaseFirestore
                                                      .instance
                                                      .collection("lockers")
                                                      .where("block",
                                                          isEqualTo: "fy9")
                                                      .limit(16)
                                                      .get()
                                                      .then((v) {
                                                    v.docs.forEach((el) {
                                                      FirebaseFirestore.instance
                                                          .collection("lockers")
                                                          .doc("${el.id}")
                                                          .delete();
                                                    });
                                                  });
                                                  //make block disappear in its zone
                                                  await FirebaseFirestore
                                                      .instance
                                                      .collection("zones")
                                                      .doc("fyzone")
                                                      .update({
                                                    "fy9size": "",
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
                              }
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: fy9size == "" ? w : g,
                              border: Border.all(
                                  width: 0.3, color: fy9size == "" ? w : b),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 18.0, middle: 0.5794),
                        Pin(size: 24.0, start: 240), // locker10

                        child: GestureDetector(
                          onTap: () {
                            if (widget.option == "ch") {
                              if (fy10size != "") {
                                showLocker(context, "fy10", fy10size);
                              }
                            } else {
                              if (fy10size == "") {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const addblock(
                                          from: "fy",
                                          available: true,
                                          block: "fy10",
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
                                                style: ElevatedButton.styleFrom(
                                                  primary: Color(0xFF9AD6BD),
                                                  shape: const StadiumBorder(),
                                                ),
                                                onPressed: () async {
                                                  //delete lockers
                                                  await FirebaseFirestore
                                                      .instance
                                                      .collection("lockers")
                                                      .where("block",
                                                          isEqualTo: "fy10")
                                                      .limit(16)
                                                      .get()
                                                      .then((v) {
                                                    v.docs.forEach((el) {
                                                      FirebaseFirestore.instance
                                                          .collection("lockers")
                                                          .doc("${el.id}")
                                                          .delete();
                                                    });
                                                  });
                                                  //make block disappear in its zone
                                                  await FirebaseFirestore
                                                      .instance
                                                      .collection("zones")
                                                      .doc("fyzone")
                                                      .update({
                                                    "fy10size": "",
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
                              }
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: fy10size == "" ? w : g,
                              border: Border.all(
                                  width: 0.3, color: fy10size == "" ? w : b),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 18.0, middle: 0.5794),
                        Pin(size: 24.0, start: 260), // locker11

                        child: GestureDetector(
                          onTap: () {
                            if (widget.option == "ch") {
                              if (fy11size != "") {
                                showLocker(context, "fy11", fy11size);
                              }
                            } else {
                              if (fy11size == "") {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const addblock(
                                          from: "fy",
                                          available: true,
                                          block: "fy11",
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
                                                style: ElevatedButton.styleFrom(
                                                  primary: Color(0xFF9AD6BD),
                                                  shape: const StadiumBorder(),
                                                ),
                                                onPressed: () async {
                                                  //delete lockers
                                                  await FirebaseFirestore
                                                      .instance
                                                      .collection("lockers")
                                                      .where("block",
                                                          isEqualTo: "fy11")
                                                      .limit(16)
                                                      .get()
                                                      .then((v) {
                                                    v.docs.forEach((el) {
                                                      FirebaseFirestore.instance
                                                          .collection("lockers")
                                                          .doc("${el.id}")
                                                          .delete();
                                                    });
                                                  });
                                                  //make block disappear in its zone
                                                  await FirebaseFirestore
                                                      .instance
                                                      .collection("zones")
                                                      .doc("fyzone")
                                                      .update({
                                                    "fy11size": "",
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
                              }
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: fy11size == "" ? w : g,
                              border: Border.all(
                                  width: 0.3, color: fy11size == "" ? w : b),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 18.0, middle: 0.5794),
                        Pin(size: 24.0, start: 47), // lockr12

                        child: GestureDetector(
                          onTap: () {
                            if (widget.option == "ch") {
                              if (fy12size != "") {
                                showLocker(context, "fy12", fy12size);
                              }
                            } else {
                              if (fy12size == "") {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const addblock(
                                          from: "fy",
                                          available: true,
                                          block: "fy12",
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
                                                style: ElevatedButton.styleFrom(
                                                  primary: Color(0xFF9AD6BD),
                                                  shape: const StadiumBorder(),
                                                ),
                                                onPressed: () async {
                                                  //delete lockers
                                                  await FirebaseFirestore
                                                      .instance
                                                      .collection("lockers")
                                                      .where("block",
                                                          isEqualTo: "fy12")
                                                      .limit(16)
                                                      .get()
                                                      .then((v) {
                                                    v.docs.forEach((el) {
                                                      FirebaseFirestore.instance
                                                          .collection("lockers")
                                                          .doc("${el.id}")
                                                          .delete();
                                                    });
                                                  });
                                                  //make block disappear in its zone
                                                  await FirebaseFirestore
                                                      .instance
                                                      .collection("zones")
                                                      .doc("fyzone")
                                                      .update({
                                                    "fy12size": "",
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
                              }
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: fy12size == "" ? w : g,
                              border: Border.all(
                                  width: 0.3, color: fy12size == "" ? w : b),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 18.0, middle: 0.5794),
                        Pin(size: 24.0, start: 25), // lockr13

                        child: GestureDetector(
                          onTap: () {
                            if (widget.option == "ch") {
                              if (fy13size != "") {
                                showLocker(context, "fy13", fy13size);
                              }
                            } else {
                              if (fy13size == "") {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const addblock(
                                          from: "fy",
                                          available: true,
                                          block: "fy13",
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
                                                style: ElevatedButton.styleFrom(
                                                  primary: Color(0xFF9AD6BD),
                                                  shape: const StadiumBorder(),
                                                ),
                                                onPressed: () async {
                                                  //delete lockers
                                                  await FirebaseFirestore
                                                      .instance
                                                      .collection("lockers")
                                                      .where("block",
                                                          isEqualTo: "fy13")
                                                      .limit(16)
                                                      .get()
                                                      .then((v) {
                                                    v.docs.forEach((el) {
                                                      FirebaseFirestore.instance
                                                          .collection("lockers")
                                                          .doc("${el.id}")
                                                          .delete();
                                                    });
                                                  });
                                                  //make block disappear in its zone
                                                  await FirebaseFirestore
                                                      .instance
                                                      .collection("zones")
                                                      .doc("fyzone")
                                                      .update({
                                                    "fy13size": "",
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
                              }
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: fy13size == "" ? w : g,
                              border: Border.all(
                                  width: 0.3, color: fy13size == "" ? w : b),
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

const String _svg_keikg =
    '<svg viewBox="49.0 266.8 1.0 27.1" ><path transform="translate(49.0, 266.84)" d="M 0 0 L 0 27.1439208984375" fill="none" stroke="#1c0000" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_xhp1c =
    '<svg viewBox="44.3 266.8 1.0 27.1" ><path transform="translate(44.3, 266.84)" d="M 0 0 L 0 27.1439208984375" fill="none" stroke="#1c0000" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_bj8reo =
    '<svg viewBox="39.6 266.8 1.0 27.1" ><path transform="translate(39.6, 266.84)" d="M 0 0 L 0 27.1439208984375" fill="none" stroke="#1c0000" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_dwbxvk =
    '<svg viewBox="34.9 266.8 1.0 27.1" ><path transform="translate(34.9, 266.84)" d="M 0 0 L 0 27.1439208984375" fill="none" stroke="#1c0000" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_dw3n40 =
    '<svg viewBox="26.8 266.8 1.0 27.1" ><path transform="translate(26.8, 266.84)" d="M 0 0 L 0 27.1439208984375" fill="none" stroke="#1c0000" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_j0qngg =
    '<svg viewBox="30.9 266.8 1.0 27.1" ><path transform="translate(30.9, 266.84)" d="M 0 0 L 0 27.1439208984375" fill="none" stroke="#1c0000" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_xekqzk =
    '<svg viewBox="70.9 266.5 1.0 119.0" ><path transform="translate(70.91, 266.5)" d="M 0 0 L 0 119" fill="none" stroke="#1c0000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';

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
