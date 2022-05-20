import 'dart:math';

import 'package:adobe_xd/pinned.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:relocker_sa/payment_view/reservation_details.dart';

import 'addblock.dart';
import 'controller_admin.dart';
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

Color w = Color.fromARGB(255, 164, 161, 161);
Color g = Color(0xFFA1E2C9);
Color b = Color.fromARGB(255, 10, 10, 10);

class editfpzone extends StatefulWidget {
  final String? option;

  editfpzone({
    Key? key,
    this.option = "",
  }) : super(key: key);

  @override
  State<editfpzone> createState() => _editfpzoneState();
}

class _editfpzoneState extends State<editfpzone> {
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
                    builder: (context) => controlleradmin()));
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
                              if (widget.option == "ch") {
                                if (fp1size != "") {
                                  showLocker(context, "fp1", fp1size);
                                }
                              } else {
                                if (fp1size == "") {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const addblock(
                                            from: "fp",
                                            available: true,
                                            block: "fp1",
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
                                                            isEqualTo: "fp1")
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
                                                        .doc("fpzone")
                                                        .update({
                                                      "fp1size": "",
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
                              if (widget.option == "ch") {
                                if (fp2size != "") {
                                  showLocker(context, "fp2", fp2size);
                                }
                              } else {
                                if (fp2size == "") {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const addblock(
                                            from: "fp",
                                            available: true,
                                            block: "fp2",
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
                                                            isEqualTo: "fp2")
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
                                                        .doc("fpzone")
                                                        .update({
                                                      "fp2size": "",
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
                              if (widget.option == "ch") {
                                if (fp3size != "") {
                                  showLocker(context, "fp3", fp3size);
                                }
                              } else {
                                if (fp3size == "") {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const addblock(
                                            from: "fp",
                                            available: true,
                                            block: "fp3",
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
                                                            isEqualTo: "fp3")
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
                                                        .doc("fpzone")
                                                        .update({
                                                      "fp3size": "",
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
                              if (widget.option == "ch") {
                                if (fp4size != "") {
                                  showLocker(context, "fp4", fp4size);
                                }
                              } else {
                                if (fp4size == "") {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const addblock(
                                            from: "fp",
                                            available: true,
                                            block: "fp4",
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
                                                            isEqualTo: "fp4")
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
                                                        .doc("fpzone")
                                                        .update({
                                                      "fp4size": "",
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
                              if (widget.option == "ch") {
                                if (fp5size != "") {
                                  showLocker(context, "fp5", fp5size);
                                }
                              } else {
                                if (fp5size == "") {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const addblock(
                                            from: "fp",
                                            available: true,
                                            block: "fp5",
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
                                                            isEqualTo: "fp5")
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
                                                        .doc("fpzone")
                                                        .update({
                                                      "fp5size": "",
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
                              if (widget.option == "ch") {
                                if (fp7size != "") {
                                  showLocker(context, "fp6", fp6size);
                                }
                              } else {
                                if (fp6size == "") {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const addblock(
                                            from: "fp",
                                            available: true,
                                            block: "fp6",
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
                                                            isEqualTo: "fp6")
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
                                                        .doc("fpzone")
                                                        .update({
                                                      "fp6size": "",
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
                              if (widget.option == "ch") {
                                if (fp7size != "") {
                                  showLocker(context, "fp7", fp7size);
                                }
                              } else {
                                if (fp7size == "") {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const addblock(
                                            from: "fp",
                                            available: true,
                                            block: "fp7",
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
                                                            isEqualTo: "fp7")
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
                                                        .doc("fpzone")
                                                        .update({
                                                      "fp7size": "",
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
                              if (widget.option == "ch") {
                                if (fp8size != "") {
                                  showLocker(context, "fp8", fp8size);
                                }
                              } else {
                                if (fp8size == "") {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const addblock(
                                            from: "fp",
                                            available: true,
                                            block: "fp8",
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
                                                            isEqualTo: "fp8")
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
                                                        .doc("fpzone")
                                                        .update({
                                                      "fp8size": "",
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
                              if (widget.option == "ch") {
                                if (fp9size != "") {
                                  showLocker(context, "fp9", fp9size);
                                }
                              } else {
                                if (fp9size == "") {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const addblock(
                                            from: "fp",
                                            available: true,
                                            block: "fp9",
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
                                                            isEqualTo: "fp9")
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
                                                        .doc("fpzone")
                                                        .update({
                                                      "fp9size": "",
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
                              if (widget.option == "ch") {
                                if (fp10size != "") {
                                  showLocker(context, "fp10", fp10size);
                                }
                              } else {
                                if (fp10size == "") {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const addblock(
                                            from: "fp",
                                            available: true,
                                            block: "fp10",
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
                                                            isEqualTo: "fp10")
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
                                                        .doc("fpzone")
                                                        .update({
                                                      "fp10size": "",
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
                              if (widget.option == "ch") {
                                if (fp11size != "") {
                                  showLocker(context, "fp11", fp11size);
                                }
                              } else {
                                if (fp11size == "") {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const addblock(
                                            from: "fp",
                                            available: true,
                                            block: "fp11",
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
                                                            isEqualTo: "fp11")
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
                                                        .doc("fpzone")
                                                        .update({
                                                      "fp11size": "",
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
                              if (widget.option == "ch") {
                                if (fp12size != "") {
                                  showLocker(context, "fp12", fp12size);
                                }
                              } else {
                                if (fp12size == "") {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const addblock(
                                            from: "fp",
                                            available: true,
                                            block: "fp12",
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
                                                            isEqualTo: "fp12")
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
                                                        .doc("fpzone")
                                                        .update({
                                                      "fp12size": "",
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
                              if (widget.option == "ch") {
                                if (fp13size != "") {
                                  showLocker(context, "fp13", fp13size);
                                }
                              } else {
                                if (fp13size == "") {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const addblock(
                                            from: "fp",
                                            available: true,
                                            block: "fp13",
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
                                                            isEqualTo: "fp13")
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
                                                        .doc("fpzone")
                                                        .update({
                                                      "fp13size": "",
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
                              if (widget.option == "ch") {
                                if (fp14size != "") {
                                  showLocker(context, "fp14", fp14size);
                                }
                              } else {
                                if (fp14size == "") {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const addblock(
                                            from: "fp",
                                            available: true,
                                            block: "fp14",
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
                                                            isEqualTo: "fp14")
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
                                                        .doc("fpzone")
                                                        .update({
                                                      "fp14size": "",
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
                              if (widget.option == "ch") {
                                if (fp15size != "") {
                                  showLocker(context, "fp15", fp15size);
                                }
                              } else {
                                if (fp15size == "") {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const addblock(
                                            from: "fp",
                                            available: true,
                                            block: "fp15",
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
                                                            isEqualTo: "fp15")
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
                                                        .doc("fpzone")
                                                        .update({
                                                      "fp15size": "",
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
                              if (widget.option == "ch") {
                                if (fp16size != "") {
                                  showLocker(context, "fp16", fp16size);
                                }
                              } else {
                                if (fp16size == "") {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const addblock(
                                            from: "fp",
                                            available: true,
                                            block: "fp16",
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
                                                            isEqualTo: "fp16")
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
                                                        .doc("fpzone")
                                                        .update({
                                                      "fp16size": "",
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
                              if (widget.option == "ch") {
                                if (fp17size != "") {
                                  showLocker(context, "fp17", fp17size);
                                }
                              } else {
                                if (fp17size == "") {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const addblock(
                                            from: "fp",
                                            available: true,
                                            block: "fp17",
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
                                                            isEqualTo: "fp17")
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
                                                        .doc("fpzone")
                                                        .update({
                                                      "fp17size": "",
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
                              if (widget.option == "ch") {
                                if (fp18size != "") {
                                  showLocker(context, "fp18", fp18size);
                                }
                              } else {
                                if (fp18size == "") {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const addblock(
                                            from: "fp",
                                            available: true,
                                            block: "fp18",
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
                                                            isEqualTo: "fp18")
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
                                                        .doc("fpzone")
                                                        .update({
                                                      "fp18size": "",
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
