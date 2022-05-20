import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:relocker_sa/controller_admin.dart';
import 'package:relocker_sa/profile.dart';
import 'package:relocker_sa/recommendations.dart';

import 'lockerset1_fg.dart';

class zones_list extends StatefulWidget {
  final List<num> number;
  const zones_list({Key? key, required this.number}) : super(key: key);
  @override
  _zones_list createState() => _zones_list();
}

class _zones_list extends State<zones_list> {
  void sorting() {
    setState(() {
      // number.reversed;
      // number.sort();
      number.sort((b, a) => a.compareTo(b));
    });
  }

  Iterable<num> number1 = number.reversed;
//  String f111=number[0].toString();

  @override
  Widget build(BuildContext context) {
    print(number);
    return Scaffold(
      backgroundColor: Colors.grey[400],
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   title: Text("Reorderable ListView In Flutter",
      //     style: TextStyle(color: Colors.pinkAccent[100]),
      //   ),
      //   centerTitle: true,
      //   actions: <Widget>[
      //     IconButton(icon: Icon(Icons.sort_by_alpha),
      //         tooltip:"Sort",
      //         onPressed: sorting
      //     ),
      //   ],
      // ),
      appBar: AppBar(
        backgroundColor: const Color(0xff88d8bb),
        title: Text("recommendations"),
        centerTitle: true,
        foregroundColor: Colors.black,
        leading: IconButton(
            color: Colors.black,
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.sort_sharp),
              tooltip: "Sort",
              onPressed: sorting),
        ],
      ),
      body: ListView(
        children: <Widget>[
          for (final number in widget.number)
            Card(
              color: Colors.blueGrey,
              key: ValueKey(number),
              elevation: 2,
              child: ListTile(
                title: Text(number.toString()),
                leading: Icon(
                  Icons.work,
                  color: Colors.black,
                ),
                // trailing: InkWell()
              ),
            ),
        ],
      ),
    );
  }
}
