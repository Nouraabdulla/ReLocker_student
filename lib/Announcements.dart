import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:relocker_sa/controller_admin.dart';
import 'package:relocker_sa/controller_view_screen.dart';

class Announcements extends StatefulWidget {
  const Announcements({Key? key}) : super(key: key);

  @override
  _Announcements createState() => _Announcements();
}

class _Announcements extends State<Announcements> {
  // List<dynamic> responseList = [];
  User? user = FirebaseAuth.instance.currentUser;
  Map<String, dynamic> userData = {};
  getUserData() {
    FirebaseFirestore.instance
        .collection("Reservation")
        .where("Owner", isEqualTo: user!.email)
        .get()
        .then((value) {
      List<DocumentSnapshot<Map<String, dynamic>>> list = value.docs;
      list.forEach((element) async {
        setState(() {
          userData = element.data()!;
        });
      });
    });
  }

  @override
  void initState() {
    getUserData();
    // getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFd3f3e6),
        appBar: AppBar(
          backgroundColor: const Color(0xff88d8bb),
          title: const Text("Personal announcements"),
          centerTitle: true,
          foregroundColor: Colors.black,
          leading: IconButton(
              color: Colors.black,
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ControllerViewScreen()));
              }),
        ),
        body: //Center(
            //  child: Column(
            //  children: [
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('Announcements')
                    .orderBy('counter', descending: true)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return ListView(
                    scrollDirection: Axis.vertical,
                    children: snapshot.data!.docs.map((document) {
                      return Column(children: <Widget>[
                        if (document['lockername'] ==
                            userData['locker_name']) ...[
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withAlpha(100),
                                      blurRadius: 10.0),
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 15),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Title: ' + document['title'],
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            'Messsage:\n' + document['message'],
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ])
                                  ]),
                            ),
                          ),
                        ]
                      ]);
                    }).toList(),
                  );
                })

        //  ],
        //  )
        // ),
        );
  }
}
