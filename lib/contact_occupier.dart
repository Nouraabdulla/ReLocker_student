import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:relocker_sa/controller_admin.dart';
import 'package:relocker_sa/controller_view_screen.dart';
import 'package:relocker_sa/search_lockername.dart';

class contact_occupier extends StatefulWidget {
  final String lockername;
  contact_occupier({Key? key, required this.lockername}) : super(key: key);

  @override
  State<contact_occupier> createState() => _contact_occupierState();
}

int i = 1;

class _contact_occupierState extends State<contact_occupier> {
  GlobalKey<FormState> _resetFormKey = GlobalKey<FormState>();

  String? message = "";

  String? title = "";
  String? state = 'inprogress';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        appBar: AppBar(
          backgroundColor: const Color(0xff88d8bb),
          title: Text("Contact occupier"),
          centerTitle: true,
          foregroundColor: Colors.black,
          leading: IconButton(
              color: Colors.black,
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => search_lockername()));
              }),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Container(
                    height: 580,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withAlpha(100),
                              blurRadius: 10.0),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 50),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: TextField(
                                  key: _resetFormKey,
                                  decoration: InputDecoration(
                                      filled: true,
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.grey),
                                      ),
                                      hintText: 'Title'),
                                  onChanged: (value) => title = value,
                                ),
                                width: MediaQuery.of(context).size.width * 0.7,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: TextField(
                                  maxLines: 7,
                                  decoration: InputDecoration(
                                    filled: true,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.grey),
                                    ),
                                    hintText: 'Message',
                                  ),
                                  onChanged: (value) => message = value,
                                ),
                                width: MediaQuery.of(context).size.width * 0.7,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2.0,
                            height: MediaQuery.of(context).size.width / 9,
                            child: ElevatedButton(
                              child: const Text(
                                'Sumbit',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 18,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xFF9AD6BD),
                                shape: const StadiumBorder(),
                              ),
                              onPressed: () {
                                // if(userData['locker_name']==lockername){
                                //   print('yeeeees');
                                // }
                                if (i != 0) {
                                  FirebaseFirestore.instance
                                      .collection('Announcements')
                                      .add({
                                    'title': title,
                                    'message': message,
                                    'lockername': widget.lockername,
                                    'counter': i,
                                    'state': state
                                  });
                                  i++;
                                }
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                          title: Text(
                                              "your announcement was send"),
                                          actions: [
                                            ElevatedButton(
                                              child: Text(
                                                "Ok",
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
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            controlleradmin()));
                                              },
                                            )
                                          ]);
                                    });
                              },
                            ),
                          ),
                        ],
                      ),
                    )))));
  }
}
