import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl/intl.dart';
import 'package:relocker_sa/contact_occupier.dart';
import 'package:relocker_sa/controller_admin.dart';
import 'package:relocker_sa/controller_view_screen.dart';

class search_lockername extends StatefulWidget {
  const search_lockername({Key? key}) : super(key: key);

  @override
  _search_lockername createState() => _search_lockername();
}

class _search_lockername extends State<search_lockername> {
  String name = "";
  final String? lockername = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xff88d8bb),
              title: TextFormField(
                decoration: InputDecoration(
                  hintText: "Search for locker number",
                ),
                onChanged: (val) => initiateSearch(val),
              ),
              leading: IconButton(
                  color: Colors.black,
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => controlleradmin()));
                  }),
            ),
            body: SafeArea(
                child: StreamBuilder(
                    stream: name == ""
                        ? FirebaseFirestore.instance
                            .collection('Reservation')
                            .where("locker_name", arrayContains: name)
                            .snapshots()
                        : FirebaseFirestore.instance
                            .collection("Reservation")
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
                            if (name == document['locker_name']) ...[
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              contact_occupier(
                                                  lockername: name)));
                                },
                                child: Container(
                                  height: 150,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
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
                                                  'Locker Number: ' +
                                                      document['locker_name'],
                                                  style: const TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ])
                                        ]),
                                  ),
                                ),
                              )
                            ]
                          ]);
                        }).toList(),
                      );
                    }))));
  }

  void initiateSearch(String val) {
    setState(() {
      name = val;
    });
  }
}
