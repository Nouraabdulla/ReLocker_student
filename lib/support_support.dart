import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:relocker_sa/controller_view_screen.dart';

class support_support extends StatefulWidget {
  support_support({Key? key}) : super(key: key);

  @override
  State<support_support> createState() => _support_supportState();
}

int i = 1;

class _support_supportState extends State<support_support> {
  GlobalKey<FormState> _resetFormKey = GlobalKey<FormState>();

  String? message = "";
  String? state = "inprogress";
  String? title = "";

// get the current user data
  User? user = FirebaseAuth.instance.currentUser;
  Map<String, dynamic> userData = {};
  getUserData() {
    FirebaseFirestore.instance
        .collection("Users")
        .doc(user!.uid)
        .get()
        .then((value) {
      setState(() {
        userData = value.data()!;
      });
    });
  }

//get the lockernumber of the user
  Map<String, dynamic> datares = {};
  getData() {
    FirebaseFirestore.instance
        .collection("Reservation")
        .where("user_id", isEqualTo: user!.uid)
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

  @override
  void initState() {
    getData();
    getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        appBar: AppBar(
          backgroundColor: const Color(0xff88d8bb),
          title: Text("Technical support"),
          centerTitle: true,
          foregroundColor: Colors.black,
          leading: IconButton(
              color: Colors.black,
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                // ان افضل هذا الامر
                // //////////////////////
                  Navigator.of(context).pop();
                  /////////////////////////////////
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => ControllerViewScreen()));
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
                              SizedBox(
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
                         const SizedBox(
                            height: 30,
                          ),
                         
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                child: TextField(
                                  maxLines: 7,
                                  decoration: InputDecoration(
                                    filled: true,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: const BorderSide(
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
                          const SizedBox(
                            height: 40,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2.0,
                            height: MediaQuery.of(context).size.width / 9,
                            child: ElevatedButton(
                              child: const Text(
                                'Submit',
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
                                  FirebaseFirestore.instance
                                      .collection('support')
                                      .add({
                                    'title': title,
                                    'email': '${userData['email'] ?? ''}',
                                    'message': message,
                                    'state': state,
                                    'lockername':
                                        '${datares['locker_name'] ?? ''}',
                                  });
                                  
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                          title: Text("Your request is sent"),
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
                                                Navigator.of(context).pushReplacement(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ControllerViewScreen()));
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
