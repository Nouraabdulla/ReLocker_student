import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:adobe_xd/blend_mask.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
  getUserData(){
    FirebaseFirestore.instance.collection("Users").doc(user!.uid).get().then((value) {

      setState(() {
        userData = value.data()!;
        nameCont.text = value.data()!['user_name'];
        phoneCont.text = value.data()!['phone'];
      });
    });
  }

  editUserData()async{
  await  FirebaseFirestore.instance.collection("Users").doc(user!.uid)
        .set({"user_name": "${nameCont.text}", "phone":"${phoneCont.text}"},
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
        title: Text("Edit Profile"),

      ),
      body:ListView(
        padding:EdgeInsets.all(32.0),
        children: [
          CircleAvatar(
            child: Icon(Icons.person, size: 68,),
            radius: 100,
            backgroundColor: Colors.grey,
          ),
          Text("Username:"),
          TextField(
            controller: nameCont,
          ),
          Text("Phone:"),
          TextField(
            controller: phoneCont,
          ),
          ElevatedButton(onPressed: (){editUserData();}, child: Text("Edit"))
        ],
      ),
    );
  }
}
