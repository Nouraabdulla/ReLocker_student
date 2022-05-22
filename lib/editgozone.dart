import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:adobe_xd/blend_mask.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:relocker_sa/payment_view/reservation_details.dart';

import 'addblock.dart';
import 'controller_admin.dart';
import 'controller_view_screen.dart';
import 'home_view.dart';

int Rendifference = 0;
int Resdifference = 0;
String go1size = "";
String go2size = "";
String go3size = "";
String go4size = "";
String go5size = "";
String go6size = "";
String go7size = "";
String go8size = "";
String go9size = "";
String go10size = "";

Color w = Color.fromARGB(255, 164, 161, 161);
Color g = Color(0xFFA1E2C9);
Color b = Color.fromARGB(255, 10, 10, 10);

class editgozone extends StatefulWidget {
  final String? option;

  editgozone({
    Key? key,
    this.option = "",
  }) : super(key: key);

  @override
  State<editgozone> createState() => _editgozoneState();
}

class _editgozoneState extends State<editgozone> {
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
                          "Select a locker to change its state",
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
                                                                    FirebaseDatabase
                                                                        .instance
                                                                        .ref(
                                                                            '/${data['name']}/pin')
                                                                        .set('')
                                                                        .then(
                                                                            (_) {
                                                                      // Data saved successfully!
                                                                    }).catchError(
                                                                            (error) {
                                                                      // The write failed...
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
                                                                          FirebaseDatabase
                                                                              .instance
                                                                              .ref('/${data1['name']}/pin')
                                                                              .set('')
                                                                              .then((_) {
                                                                            // Data saved successfully!
                                                                          }).catchError((error) {
                                                                            // The write failed...
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
                                                                          FirebaseDatabase
                                                                              .instance
                                                                              .ref('/${data2['name']}/pin')
                                                                              .set('')
                                                                              .then((_) {
                                                                            // Data saved successfully!
                                                                          }).catchError((error) {
                                                                            // The write failed...
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

  User? user = FirebaseAuth.instance.currentUser;
  Map<String, dynamic> datares = {};
  getData() {
    FirebaseFirestore.instance
        .collection("Reservation")
        .where("Owner", isEqualTo: user!.email)
        .get()
        .then((value) {
      List<DocumentSnapshot<Map<String, dynamic>>> list = value.docs;
      list.forEach((element) async {
        setState(() {
          datares = element.data()!;
        });
      });
    });
  }

//get new block data
  checkAvailableblockes() async {
    final DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('zones')
        .doc("gozone") //zone
        .get();

    setState(() {
      go1size = doc['go1size'];
      go2size = doc['go2size'];
      go3size = doc['go3size'];
      go4size = doc['go4size'];
      go5size = doc['go5size'];
      go6size = doc['go6size'];
      go7size = doc['go7size'];
      go8size = doc['go8size'];
      go9size = doc['go9size'];
      go10size = doc['go10size'];

      //اكمل باقي البلوكس لهذا الزون
    });
    // gg0size = doc['gg0size'];
  }

  @override
  void initState() {
    checkAvailableblockes();
    getData();
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
            Pin(size: 23.1, middle: 0.2595),
            Pin(size: 16.0, start: 50), // lockrr5
            child: Transform.rotate(
              angle: 1.5708,
              child: GestureDetector(
                onTap: () {
                  // showLocker(context, "fg5", "l");
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: widget.option == "ch"
                        ? w
                        : Color.fromARGB(255, 255, 255, 255),
                    border: Border.all(
                      width: 0.3,
                      color: widget.option == "ch"
                          ? b
                          : Color.fromARGB(255, 255, 255, 255),
                    ), //colore changes based on add/delete not user type
                  ),
                ),
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 200.1, middle: 0.6295),
            Pin(size: 20.0, start: 50),
            child: widget.option == "ch"
                ? Text('Represents a set of lockers',
                    style: TextStyle(
                      fontSize: 15,
                    ))
                : Text(""),
          ),
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
                      // ------------------ map --------------

                      Pinned.fromPins(
                        Pin(size: 93.0, start: 28.6),
                        Pin(size: 76.0, start: 0.0), //21
                        child: Transform.rotate(
                          angle: 3.1416,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xfff3922c),
                              border: Border.all(
                                  width: 0.5, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 149.5, start: 28.6),
                        Pin(size: 185.0, start: 96.5), // 16
                        child: Transform.rotate(
                          angle: 3.1416,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xfff3922c),
                              border: Border.all(
                                  width: 0.5, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 53.0, middle: 0.1808),
                        Pin(size: 16.0, start: 32.9),
                        child: Text(
                          '6G21',
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
                        Pin(size: 41.5, start: 28.6),
                        Pin(size: 185.0, start: 96.5), // grey area
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffe4e4e4),
                            border: Border.all(
                                width: 1.0, color: const Color(0xff707070)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 87.6, middle: 0.3835),
                        Pin(size: 107.6, start: 281), //13
                        child: Transform.rotate(
                          angle: 3.1416,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xfff3922c),
                              border: Border.all(
                                  width: 0.5, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 53.0, middle: 0.395),
                        Pin(size: 16.0, start: 323),
                        child: Text(
                          '6G13',
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
                        Pin(size: 53.0, middle: 0.3904),
                        Pin(size: 16.0, start: 180),
                        child: Text(
                          '6G16',
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
                        Pin(size: 69.4, end: 39.8),
                        Pin(size: 111.5, start: 00.0), //18
                        child: Transform.rotate(
                          angle: 3.1416,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xfff3922c),
                              border: Border.all(
                                  width: 0.5, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 92.3, middle: 0.5269),
                        Pin(size: 76.0, start: 0.0), //20
                        child: Transform.rotate(
                          angle: 3.1416,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xfff3922c),
                              border: Border.all(
                                  width: 0.5, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 69.6, end: 39.6),
                        Pin(size: 83.5, start: 133), //15
                        child: Transform.rotate(
                          angle: 3.1416,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xfff3922c),
                              border: Border.all(
                                  width: 0.5, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 69.6, end: 39.6),
                        Pin(size: 107.1, start: 216), //14
                        child: Transform.rotate(
                          angle: 3.1416,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xfff3922c),
                              border: Border.all(
                                  width: 0.5, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 69.6, end: 39.6),
                        Pin(size: 85.9, start: 323), //12
                        child: Transform.rotate(
                          angle: 3.1416,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xfff3922c),
                              border: Border.all(
                                  width: 0.5, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 53.0, middle: 0.5238),
                        Pin(size: 16.0, start: 32.9),
                        child: Text(
                          '6G20',
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 14,
                            color: const Color(0xe31c0000),
                            height: 3.142857142857143,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 53.0, end: 47.1),
                        Pin(size: 16.0, start: 32.9),
                        child: Text(
                          '6G18',
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
                        Pin(size: 65.0, end: 40.8),
                        Pin(size: 16.0, start: 165),
                        child: Text(
                          '6G15',
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
                        Pin(size: 65.0, end: 40.8),
                        Pin(size: 16.0, start: 260),
                        child: Text(
                          '6G14',
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
                        Pin(size: 65.0, end: 40.8),
                        Pin(size: 16.0, start: 365),
                        child: Text(
                          '6G12',
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
                        Pin(size: 46.8, middle: 0.4746),
                        Pin(size: 20.1, start: 388), // wc around lockers
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffffdfbe),
                            border: Border.all(
                                width: 1.0, color: const Color(0xff707070)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.0, middle: 0.4822),
                        Pin(size: 10.0, start: 394),
                        child: Text(
                          'WC',
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 8,
                            color: const Color(0xff000000),
                            fontWeight: FontWeight.w500,
                            height: 5.5,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 69.6, end: 39.6),
                        Pin(size: 23.1, start: 110), // exit
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
                        Pin(size: 30.0, middle: 0.8066),
                        Pin(size: 14.0, start: 115),
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
                        Pin(size: 46.8, middle: 0.4746),
                        Pin(size: 19.9, start: 96.5), // wc
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffffdfbe),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.0, middle: 0.4829),
                        Pin(size: 10.0, start: 102.5),
                        child: Text(
                          'WC',
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 8,
                            color: const Color(0xff000000),
                            fontWeight: FontWeight.w500,
                            height: 5.5,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 21.1, middle: 0.5814),
                        Pin(size: 16.0, start: 370),
                        child: Transform.rotate(
                          angle: 1.5708,
                          child: GestureDetector(
                            onTap: () {
                              if (widget.option == "ch") {
                                if (go1size != "") {
                                  showLocker(context, "go1", go1size);
                                }
                              } else {
                                if (go1size == "") {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const addblock(
                                            from: "go",
                                            available: true,
                                            block: "go1",
                                            type: "r",
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
                                                            isEqualTo: "go1")
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
                                                        .doc("gozone")
                                                        .update({
                                                      "go1size": "",
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
                                color: go1size == "" ? w : g,
                                border: Border.all(
                                    width: 0.3, color: go1size == "" ? w : b),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 21.1, middle: 0.5814),
                        Pin(size: 16.0, start: 350), // locker 2
                        child: Transform.rotate(
                          angle: 1.5708,
                          child: GestureDetector(
                            onTap: () {
                              if (widget.option == "ch") {
                                if (go2size != "") {
                                  showLocker(context, "go2", go2size);
                                }
                              } else {
                                if (go2size == "") {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const addblock(
                                            from: "go",
                                            available: true,
                                            block: "go2",
                                            type: "r",
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
                                                            isEqualTo: "go2")
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
                                                        .doc("gozone")
                                                        .update({
                                                      "go2size": "",
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
                                color: go2size == "" ? w : g,
                                border: Border.all(
                                    width: 0.3, color: go2size == "" ? w : b),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 21.1, middle: 0.5814),
                        Pin(size: 16.0, start: 330), // lockr3
                        child: Transform.rotate(
                          angle: 1.5708,
                          child: GestureDetector(
                            onTap: () {
                              if (widget.option == "ch") {
                                if (go3size != "") {
                                  showLocker(context, "go3", go3size);
                                }
                              } else {
                                if (go3size == "") {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const addblock(
                                            from: "go",
                                            available: true,
                                            block: "go3",
                                            type: "r",
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
                                                            isEqualTo: "go3")
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
                                                        .doc("gozone")
                                                        .update({
                                                      "go3size": "",
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
                                color: go3size == "" ? w : g,
                                border: Border.all(
                                    width: 0.3, color: go3size == "" ? w : b),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 21.1, middle: 0.5814),
                        Pin(size: 16.0, start: 310), // locker4
                        child: Transform.rotate(
                          angle: 1.5708,
                          child: GestureDetector(
                            onTap: () {
                              if (widget.option == "ch") {
                                if (go4size != "") {
                                  showLocker(context, "go4", go4size);
                                }
                              } else {
                                if (go4size == "") {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const addblock(
                                            from: "go",
                                            available: true,
                                            block: "go4",
                                            type: "r",
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
                                                            isEqualTo: "go4")
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
                                                        .doc("gozone")
                                                        .update({
                                                      "go4size": "",
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
                                color: go4size == "" ? w : g,
                                border: Border.all(
                                    width: 0.3, color: go4size == "" ? w : b),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 21.1, middle: 0.5814),
                        Pin(size: 16.0, start: 220), // locker5
                        child: Transform.rotate(
                          angle: 1.5708,
                          child: GestureDetector(
                            onTap: () {
                              if (widget.option == "ch") {
                                if (go5size != "") {
                                  showLocker(context, "go5", go5size);
                                }
                              } else {
                                if (go5size == "") {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const addblock(
                                            from: "go",
                                            available: true,
                                            block: "go5",
                                            type: "r",
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
                                                            isEqualTo: "go5")
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
                                                        .doc("gozone")
                                                        .update({
                                                      "go5size": "",
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
                                color: go5size == "" ? w : g,
                                border: Border.all(
                                    width: 0.3, color: go5size == "" ? w : b),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 21.1, middle: 0.5814),
                        Pin(size: 16.0, start: 200), // locker6
                        child: Transform.rotate(
                          angle: 1.5708,
                          child: GestureDetector(
                            onTap: () {
                              if (widget.option == "ch") {
                                if (go6size != "") {
                                  showLocker(context, "go6", go6size);
                                }
                              } else {
                                if (go6size == "") {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const addblock(
                                            from: "go",
                                            available: true,
                                            block: "go6",
                                            type: "r",
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
                                                            isEqualTo: "go6")
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
                                                        .doc("gozone")
                                                        .update({
                                                      "go6size": "",
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
                                color: go6size == "" ? w : g,
                                border: Border.all(
                                    width: 0.3, color: go6size == "" ? w : b),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 21.1, middle: 0.5814),
                        Pin(size: 16.0, start: 180), // locker7
                        child: Transform.rotate(
                          angle: 1.5708,
                          child: GestureDetector(
                            onTap: () {
                              if (widget.option == "ch") {
                                if (go7size != "") {
                                  showLocker(context, "go7", go7size);
                                }
                              } else {
                                if (go7size == "") {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const addblock(
                                            from: "go",
                                            available: true,
                                            block: "go7",
                                            type: "r",
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
                                                            isEqualTo: "go7")
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
                                                        .doc("gozone")
                                                        .update({
                                                      "go7size": "",
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
                                color: go7size == "" ? w : g,
                                border: Border.all(
                                    width: 0.3, color: go7size == "" ? w : b),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 21.1, middle: 0.5814),
                        Pin(size: 16.0, start: 160), // locker8
                        child: Transform.rotate(
                          angle: 1.5708,
                          child: GestureDetector(
                            onTap: () {
                              if (widget.option == "ch") {
                                if (go8size != "") {
                                  showLocker(context, "go8", go8size);
                                }
                              } else {
                                if (go8size == "") {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const addblock(
                                            from: "go",
                                            available: true,
                                            block: "go8",
                                            type: "r",
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
                                                            isEqualTo: "go8")
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
                                                        .doc("gozone")
                                                        .update({
                                                      "go8size": "",
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
                                color: go8size == "" ? w : g,
                                border: Border.all(
                                    width: 0.3, color: go8size == "" ? w : b),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 21.1, middle: 0.2414),
                        Pin(size: 16.0, start: 80), // locker9
                        child: Transform.rotate(
                          angle: 0,
                          child: GestureDetector(
                            onTap: () {
                              if (widget.option == "ch") {
                                if (go9size != "") {
                                  showLocker(context, "go9", go9size);
                                }
                              } else {
                                if (go9size == "") {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const addblock(
                                            from: "go",
                                            available: true,
                                            block: "go9",
                                            type: "r",
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
                                                            isEqualTo: "go9")
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
                                                        .doc("gozone")
                                                        .update({
                                                      "go9size": "",
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
                                color: go9size == "" ? w : g,
                                border: Border.all(
                                    width: 0.3, color: go9size == "" ? w : b),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 21.1, middle: 0.313),
                        Pin(size: 16.0, start: 80), // locker10
                        child: Transform.rotate(
                          angle: 0,
                          child: GestureDetector(
                            onTap: () {
                              if (widget.option == "ch") {
                                if (go10size != "") {
                                  showLocker(context, "go10", go10size);
                                }
                              } else {
                                if (go10size == "") {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const addblock(
                                            from: "go",
                                            available: true,
                                            block: "go10",
                                            type: "r",
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
                                                            isEqualTo: "go10")
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
                                                        .doc("gozone")
                                                        .update({
                                                      "go10size": "",
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
                                color: go10size == "" ? w : g,
                                border: Border.all(
                                    width: 0.3, color: go10size == "" ? w : b),
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

const String _svg_eb1si9 =
    '<svg viewBox="154.6 464.2 22.4 1.0" ><path transform="translate(154.6, 464.17)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_jqkp =
    '<svg viewBox="154.6 459.0 22.4 1.0" ><path transform="translate(154.6, 458.98)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_hxyn74 =
    '<svg viewBox="154.6 469.4 22.4 1.0" ><path transform="translate(154.6, 469.36)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_umwi =
    '<svg viewBox="154.6 474.5 22.4 1.0" ><path transform="translate(154.6, 474.55)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_s1ynlr =
    '<svg viewBox="154.6 478.0 22.4 1.0" ><path transform="translate(154.6, 478.0)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_tijdap =
    '<svg viewBox="154.6 466.2 22.4 1.0" ><path transform="translate(154.6, 466.17)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ay9r5j =
    '<svg viewBox="154.6 462.0 22.4 1.0" ><path transform="translate(154.6, 461.98)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_knuc9c =
    '<svg viewBox="154.6 470.4 22.4 1.0" ><path transform="translate(154.6, 470.36)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_rc4ioe =
    '<svg viewBox="154.6 478.5 22.4 1.0" ><path transform="translate(154.6, 478.55)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_cw72j7 =
    '<svg viewBox="154.6 457.8 22.4 1.0" ><path transform="translate(154.6, 457.79)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_dkp1o =
    '<svg viewBox="154.6 482.7 22.4 1.0" ><path transform="translate(154.6, 482.73)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_omj78x =
    '<svg viewBox="154.6 489.5 22.4 1.0" ><path transform="translate(154.6, 489.45)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_n1hlsa =
    '<svg viewBox="154.6 492.9 22.4 1.0" ><path transform="translate(154.6, 492.91)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_lnz2x =
    '<svg viewBox="234.0 265.5 26.7 1.0" ><path transform="translate(234.0, 265.55)" d="M 0 0 L 26.705078125 0" fill="none" stroke="#000000" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_nnymfy =
    '<svg viewBox="234.0 267.1 26.7 1.0" ><path transform="translate(234.0, 267.09)" d="M 0 0 L 26.705078125 0" fill="none" stroke="#000000" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_dx800g =
    '<svg viewBox="234.0 264.0 27.0 1.0" ><path transform="translate(234.0, 264.0)" d="M 0 0 L 27 0" fill="none" stroke="#000000" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_iy9gwn =
    '<svg viewBox="154.3 486.0 22.4 1.0" ><path transform="translate(154.31, 485.99)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_jyak4w =
    '<svg viewBox="154.6 474.4 22.4 1.0" ><path transform="translate(154.6, 474.36)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_vpmvr8 =
    '<svg viewBox="264.4 241.6 1.0 20.3" ><path transform="translate(264.4, 241.62)" d="M 0 0 L 0 20.299560546875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_w0qrc =
    '<svg viewBox="268.2 241.6 1.0 20.3" ><path transform="translate(268.17, 241.62)" d="M 0 0 L 0 20.299560546875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_my8dz =
    '<svg viewBox="272.6 241.6 1.0 20.3" ><path transform="translate(272.63, 241.62)" d="M 0 0 L 0 20.299560546875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_d1az9d =
    '<svg viewBox="276.7 241.6 1.0 20.3" ><path transform="translate(276.75, 241.62)" d="M 0 0 L 0 20.299560546875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_iet5hn =
    '<svg viewBox="284.3 241.6 1.0 20.3" ><path transform="translate(284.31, 241.62)" d="M 0 0 L 0 20.299560546875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_f0i5 =
    '<svg viewBox="287.3 241.6 1.0 20.3" ><path transform="translate(287.28, 241.62)" d="M 0 0 L 0 20.299560546875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_sz5js6 =
    '<svg viewBox="290.5 241.6 1.0 20.3" ><path transform="translate(290.49, 241.62)" d="M 0 0 L 0 20.299560546875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_j0ir3 =
    '<svg viewBox="293.2 241.6 1.0 20.3" ><path transform="translate(293.21, 241.62)" d="M 0 0 L 0 20.299560546875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_k2xp6 =
    '<svg viewBox="264.4 242.3 1.0 20.2" ><path transform="translate(264.4, 242.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_soa8o =
    '<svg viewBox="268.2 242.3 1.0 20.2" ><path transform="translate(268.17, 242.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_kyz015 =
    '<svg viewBox="272.6 242.3 1.0 20.2" ><path transform="translate(272.63, 242.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_jd6n5 =
    '<svg viewBox="276.7 242.3 1.0 20.2" ><path transform="translate(276.75, 242.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_xeum3v =
    '<svg viewBox="284.3 242.3 1.0 20.2" ><path transform="translate(284.31, 242.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_fva47n =
    '<svg viewBox="287.3 242.3 1.0 20.2" ><path transform="translate(287.28, 242.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_txj5y =
    '<svg viewBox="290.5 242.3 1.0 20.2" ><path transform="translate(290.49, 242.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_md3kz5 =
    '<svg viewBox="293.2 242.3 1.0 20.2" ><path transform="translate(293.21, 242.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_l0ec1i =
    '<svg viewBox="281.1 242.3 1.0 20.2" ><path transform="translate(281.12, 242.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_lcaj =
    '<svg viewBox="264.4 268.5 1.0 19.4" ><path transform="translate(264.4, 268.5)" d="M 0.09765625 0 L 0 19.416748046875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_yormcd =
    '<svg viewBox="268.2 268.5 1.0 19.4" ><path transform="translate(268.17, 268.5)" d="M 0.3310546875 0 L 0 19.416748046875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ufja0 =
    '<svg viewBox="272.5 268.5 1.0 19.4" ><path transform="translate(272.5, 268.5)" d="M 0 0 L 0.1318359375 19.416748046875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_dcx164 =
    '<svg viewBox="276.5 268.5 1.0 19.4" ><path transform="translate(276.5, 268.5)" d="M 0 0 L 0.2490234375 19.416748046875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ule6p =
    '<svg viewBox="284.3 268.5 1.0 19.4" ><path transform="translate(284.31, 268.5)" d="M 0.1904296875 0 L 0 19.416748046875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_keuec8 =
    '<svg viewBox="287.3 268.5 1.0 19.4" ><path transform="translate(287.28, 268.5)" d="M 0.2236328125 0 L 0 19.416748046875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_izqcxj =
    '<svg viewBox="290.5 268.5 1.0 19.4" ><path transform="translate(290.49, 268.5)" d="M 0.0068359375 0 L 0 19.416748046875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_o62gh =
    '<svg viewBox="293.2 268.5 1.0 19.4" ><path transform="translate(293.21, 268.5)" d="M 0.291015625 0 L 0 19.416748046875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_h5wa =
    '<svg viewBox="264.4 268.3 1.0 20.2" ><path transform="translate(264.4, 268.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_s28bog =
    '<svg viewBox="268.2 268.3 1.0 20.2" ><path transform="translate(268.17, 268.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_e78g0v =
    '<svg viewBox="272.6 268.3 1.0 20.2" ><path transform="translate(272.63, 268.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_tmu9ev =
    '<svg viewBox="276.7 268.3 1.0 20.2" ><path transform="translate(276.75, 268.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_rcty5 =
    '<svg viewBox="284.3 268.3 1.0 20.2" ><path transform="translate(284.31, 268.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_jzmhph =
    '<svg viewBox="287.3 268.3 1.0 20.2" ><path transform="translate(287.28, 268.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_v0z2r6 =
    '<svg viewBox="290.5 268.3 1.0 20.2" ><path transform="translate(290.49, 268.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ct3v2v =
    '<svg viewBox="293.2 268.3 1.0 20.2" ><path transform="translate(293.21, 268.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_e5t40i =
    '<svg viewBox="281.1 268.3 1.0 20.2" ><path transform="translate(281.12, 268.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
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
const String _svg_uhgxe1 =
    '<svg viewBox="161.6 464.2 22.4 1.0" ><path transform="translate(161.6, 464.17)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_mfyvgh =
    '<svg viewBox="161.6 459.0 22.4 1.0" ><path transform="translate(161.6, 458.98)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_rjibc =
    '<svg viewBox="161.6 469.4 22.4 1.0" ><path transform="translate(161.6, 469.36)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_d3khza =
    '<svg viewBox="161.6 474.5 22.4 1.0" ><path transform="translate(161.6, 474.55)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_mthb3r =
    '<svg viewBox="161.6 478.0 22.4 1.0" ><path transform="translate(161.6, 478.0)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_pc5jsn =
    '<svg viewBox="161.6 466.2 22.4 1.0" ><path transform="translate(161.6, 466.17)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_dq9 =
    '<svg viewBox="161.6 462.0 22.4 1.0" ><path transform="translate(161.6, 461.98)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_y6uku0 =
    '<svg viewBox="161.6 470.4 22.4 1.0" ><path transform="translate(161.6, 470.36)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_rikeey =
    '<svg viewBox="161.6 478.5 22.4 1.0" ><path transform="translate(161.6, 478.55)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_t2m7ez =
    '<svg viewBox="161.6 457.8 22.4 1.0" ><path transform="translate(161.6, 457.79)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ijztxg =
    '<svg viewBox="161.6 482.7 22.4 1.0" ><path transform="translate(161.6, 482.73)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_g42d5 =
    '<svg viewBox="161.6 489.5 22.4 1.0" ><path transform="translate(161.6, 489.45)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_vt7bb2 =
    '<svg viewBox="161.6 492.9 22.4 1.0" ><path transform="translate(161.6, 492.91)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ufvtd =
    '<svg viewBox="241.0 265.5 26.7 1.0" ><path transform="translate(241.0, 265.55)" d="M 0 0 L 26.705078125 0" fill="none" stroke="#000000" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_owqj6e =
    '<svg viewBox="241.0 267.1 26.7 1.0" ><path transform="translate(241.0, 267.09)" d="M 0 0 L 26.705078125 0" fill="none" stroke="#000000" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_cdt27c =
    '<svg viewBox="241.0 264.0 27.0 1.0" ><path transform="translate(241.0, 264.0)" d="M 0 0 L 27 0" fill="none" stroke="#000000" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_g30pb =
    '<svg viewBox="161.3 486.0 22.4 1.0" ><path transform="translate(161.31, 485.99)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_rvf94 =
    '<svg viewBox="161.6 474.4 22.4 1.0" ><path transform="translate(161.6, 474.36)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_dg14j8 =
    '<svg viewBox="271.4 241.6 1.0 20.3" ><path transform="translate(271.4, 241.62)" d="M 0 0 L 0 20.299560546875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_czms0 =
    '<svg viewBox="275.2 241.6 1.0 20.3" ><path transform="translate(275.17, 241.62)" d="M 0 0 L 0 20.299560546875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ki8akl =
    '<svg viewBox="279.6 241.6 1.0 20.3" ><path transform="translate(279.63, 241.62)" d="M 0 0 L 0 20.299560546875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_labcsp =
    '<svg viewBox="283.7 241.6 1.0 20.3" ><path transform="translate(283.75, 241.62)" d="M 0 0 L 0 20.299560546875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_qntj0z =
    '<svg viewBox="291.3 241.6 1.0 20.3" ><path transform="translate(291.31, 241.62)" d="M 0 0 L 0 20.299560546875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ffe1h =
    '<svg viewBox="294.3 241.6 1.0 20.3" ><path transform="translate(294.28, 241.62)" d="M 0 0 L 0 20.299560546875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_r6og0c =
    '<svg viewBox="297.5 241.6 1.0 20.3" ><path transform="translate(297.49, 241.62)" d="M 0 0 L 0 20.299560546875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_jvsgsj =
    '<svg viewBox="300.2 241.6 1.0 20.3" ><path transform="translate(300.21, 241.62)" d="M 0 0 L 0 20.299560546875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_y3ii6 =
    '<svg viewBox="271.4 242.3 1.0 20.2" ><path transform="translate(271.4, 242.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_i2rrg0 =
    '<svg viewBox="275.2 242.3 1.0 20.2" ><path transform="translate(275.17, 242.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_cwrm57 =
    '<svg viewBox="279.6 242.3 1.0 20.2" ><path transform="translate(279.63, 242.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_vet8bt =
    '<svg viewBox="283.7 242.3 1.0 20.2" ><path transform="translate(283.75, 242.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_bqte6l =
    '<svg viewBox="291.3 242.3 1.0 20.2" ><path transform="translate(291.31, 242.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_a05xh1 =
    '<svg viewBox="294.3 242.3 1.0 20.2" ><path transform="translate(294.28, 242.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_cw4x1w =
    '<svg viewBox="297.5 242.3 1.0 20.2" ><path transform="translate(297.49, 242.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_p496xv =
    '<svg viewBox="300.2 242.3 1.0 20.2" ><path transform="translate(300.21, 242.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_cy6y5k =
    '<svg viewBox="288.1 242.3 1.0 20.2" ><path transform="translate(288.12, 242.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_kfm6ml =
    '<svg viewBox="271.4 268.5 1.0 19.4" ><path transform="translate(271.4, 268.5)" d="M 0.09765625 0 L 0 19.416748046875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_lqekyz =
    '<svg viewBox="275.2 268.5 1.0 19.4" ><path transform="translate(275.17, 268.5)" d="M 0.3310546875 0 L 0 19.416748046875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_m6oo0q =
    '<svg viewBox="279.5 268.5 1.0 19.4" ><path transform="translate(279.5, 268.5)" d="M 0 0 L 0.1318359375 19.416748046875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_t15mqk =
    '<svg viewBox="283.5 268.5 1.0 19.4" ><path transform="translate(283.5, 268.5)" d="M 0 0 L 0.2490234375 19.416748046875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_rcgh3 =
    '<svg viewBox="291.3 268.5 1.0 19.4" ><path transform="translate(291.31, 268.5)" d="M 0.1904296875 0 L 0 19.416748046875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_z0s900 =
    '<svg viewBox="294.3 268.5 1.0 19.4" ><path transform="translate(294.28, 268.5)" d="M 0.2236328125 0 L 0 19.416748046875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_iokmfr =
    '<svg viewBox="297.5 268.5 1.0 19.4" ><path transform="translate(297.49, 268.5)" d="M 0.0068359375 0 L 0 19.416748046875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ozvlnn =
    '<svg viewBox="300.2 268.5 1.0 19.4" ><path transform="translate(300.21, 268.5)" d="M 0.291015625 0 L 0 19.416748046875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_dpab2 =
    '<svg viewBox="271.4 268.3 1.0 20.2" ><path transform="translate(271.4, 268.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_h3fom0 =
    '<svg viewBox="275.2 268.3 1.0 20.2" ><path transform="translate(275.17, 268.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_m9ftwt =
    '<svg viewBox="279.6 268.3 1.0 20.2" ><path transform="translate(279.63, 268.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_re7q7 =
    '<svg viewBox="283.7 268.3 1.0 20.2" ><path transform="translate(283.75, 268.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_o437qj =
    '<svg viewBox="291.3 268.3 1.0 20.2" ><path transform="translate(291.31, 268.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_p61ikz =
    '<svg viewBox="294.3 268.3 1.0 20.2" ><path transform="translate(294.28, 268.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_myrov8 =
    '<svg viewBox="297.5 268.3 1.0 20.2" ><path transform="translate(297.49, 268.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_a1y945 =
    '<svg viewBox="300.2 268.3 1.0 20.2" ><path transform="translate(300.21, 268.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_m80hwg =
    '<svg viewBox="288.1 268.3 1.0 20.2" ><path transform="translate(288.12, 268.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
