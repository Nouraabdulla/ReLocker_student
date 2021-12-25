import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:adobe_xd/blend_mask.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:relocker_sa/profile.dart';

class edit_profile extends StatefulWidget {
  edit_profile({Key? key}) : super(key: key);

  @override
  State<edit_profile> createState() => _edit_profileState();
}

class _edit_profileState extends State<edit_profile> {
  TextEditingController nameCont = TextEditingController();
  TextEditingController phoneCont = TextEditingController();
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
        nameCont.text = value.data()!['user_name'];
        phoneCont.text = value.data()!['phone'];
      });
    });
  }

  editUserData() async {
    await FirebaseFirestore.instance.collection("Users").doc(user!.uid).set(
        {"user_name": "${nameCont.text}", "phone": "${phoneCont.text}"},
        SetOptions(merge: true)).then((value) => Navigator.of(context).pop());
  }

  @override
  void initState() {
    getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
          backgroundColor: const Color(0xff88d8bb),
          title: Text("Edit Profile"),
          centerTitle: true,
          foregroundColor: Colors.black,
          leading: IconButton(
            color: Colors.black,
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.of(context).pop(),
          )),
      body: ListView(
        padding: EdgeInsets.all(70.0),
        children: [
          CircleAvatar(
            child: Icon(
              Icons.person,
              color: Colors.black,
              size: 100,
            ),
            radius: 80,
            backgroundColor: Colors.grey.shade200,
          ),
          SizedBox(
            height: 70,
          ),
          Text(
            "Username:",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          TextField(
            controller: nameCont,
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Phone:",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          TextField(
            controller: phoneCont,
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {
                editUserData();
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => profile()));
              },
              child: Text(
                "Edit",
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                primary: Color(0xff88d8bb),
                shape: const StadiumBorder(),
                textStyle: TextStyle(
                  fontSize: 20,
                ),
              ))
        ],
      ),
    );
  }
}
