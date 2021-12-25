import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:adobe_xd/blend_mask.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:relocker_sa/bloc/cubit/auth_cubit.dart';
import 'package:relocker_sa/bloc/states/auth_states.dart';
import 'package:relocker_sa/controller_view_screen.dart';
import 'package:relocker_sa/edit_profile.dart';
import 'package:relocker_sa/home_view.dart';
import 'package:relocker_sa/models/user_model.dart';
import 'package:relocker_sa/utils/constance.dart';
import 'package:relocker_sa/utils/utils-cache_helper.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
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
        title: Text("Profile"),
        centerTitle: true,
        foregroundColor: Colors.black,
        leading: IconButton(
            color: Colors.black,
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ControllerViewScreen()));
            }),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => edit_profile()));
              },
              icon: Icon(Icons.edit))
        ],
      ),
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
          Text("${userData['user_name'] ?? ''}",
              style: TextStyle(fontSize: 20)),
          SizedBox(
            height: 15,
          ),
          Text("Email:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text("${userData['email'] ?? ''}", style: TextStyle(fontSize: 20)),
          SizedBox(
            height: 15,
          ),
          Text("Phone:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text("${userData['phone'] ?? ''}", style: TextStyle(fontSize: 20))
        ],
      ),
    );
  }
}
