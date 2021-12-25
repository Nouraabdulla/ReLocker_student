import 'dart:async';

import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:adobe_xd/blend_mask.dart';
import 'package:relocker_sa/controller_view_screen.dart';
import 'package:relocker_sa/first.dart';
import 'package:relocker_sa/locker_type.dart';

class locker_floor extends StatelessWidget {
  locker_floor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        backgroundColor: const Color(0xff88d8bb),
        automaticallyImplyLeading: false,
        title: Text("Choose floor"),
        centerTitle: true,
        foregroundColor: Colors.black,
        leading: IconButton(
            color: Colors.black,
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(start: 26.0, end: 20.0),
            Pin(size: 259.9, middle: 0.1013),
            child: IconButton(
              icon: Image.asset('assets/images/1floor.jpg'),
              iconSize: 50,
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => first()));
              },
            ),
          ),
          Pinned.fromPins(
            Pin(start: 26.0, end: 20.0),
            Pin(size: 259.0, middle: 0.8194),
            child: IconButton(
              icon: Image.asset('assets/images/Gfloor.jpg'),
              iconSize: 50,
              onPressed: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("title"),
                      content: Container(
                        child: Text("text here"),
                      ),
                    );
                  },
                );
                Future.delayed(
                    Duration(seconds: 7), () => Navigator.of(context).pop());
                //Navigator.of(context).push(MaterialPageRoute(  builder: (context) => ControllerViewScreen()));
              },
            ),
          ),

          /*Pinned.fromPins(
            Pin(size: 125.0, middle: 0.5052),
            Pin(size: 21.0, start: 38.0),
            child: Text(
              'Choose floor',
              style: TextStyle(
                fontFamily: 'Helvetica Neue',
                fontSize: 18,
                color: const Color(0xff1c0000),
                height: 2.4444444444444446,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
            ),
          ),

          Pinned.fromPins(
            Pin(start: 0.0, end: -16.0),
            Pin(size: 90.0, start: -1.0),
            child: BlendMask(
              blendMode: BlendMode.multiply,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xff88d8bb),
                ),
              ),
            ),
          ),*/
          Container(),
        ],
      ),
    );
  }
}
