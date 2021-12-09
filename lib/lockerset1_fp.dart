import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:adobe_xd/blend_mask.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'home_view.dart';

class lockerset1_fp extends StatefulWidget {
  final int numberOfWeek;

  lockerset1_fp({Key? key, required this.numberOfWeek}) : super(key: key);

  @override
  State<lockerset1_fp> createState() => _lockerset1_fpState();
}

class _lockerset1_fpState extends State<lockerset1_fp> {
  showLocker(context, text) {
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
                          "Choose the locker that suits you",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        ListTile(
                          title: Text("Not Available"),
                          leading: Icon(Icons.circle, color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('lockers')
                          .orderBy("name")
                          .where("block", isEqualTo: text)
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
                          child: GridView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.all(16.0),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4, childAspectRatio: 4 / 3),
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              Map<String, dynamic> data =
                                  snapshot.data!.docs[index].data()!
                                      as Map<String, dynamic>;
                              return GestureDetector(
                                onTap: data['available']
                                    ? () {
                                        var rslp = 125;
                                        var rllp = 150;
                                        var fslp = 15;
                                        var fllp = 25;
                                        print(data);

                                        var locker_type = data['type'];
                                        var locker_size = data['size'];

                                        if (locker_type == "r") {
                                          if (locker_size == "s") {
                                            print(rslp);
                                          } else {
                                            print(rllp);
                                          }
                                        } else {
                                          if (locker_size == "s") {
                                            print(fslp * widget.numberOfWeek);
                                          } else {
                                            print(fllp * widget.numberOfWeek);
                                          }
                                        }
                                      }
                                    : () {},
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: data['available']
                                          ? Colors.green.shade300
                                          : Colors.grey,
                                      border: Border.all(
                                          width: 1, color: Colors.grey)),
                                  child: Text("${data['name']}"),
                                ),
                              );
                            },
                          ),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff88d8bb),
        title: Text(
          'Choose locker',
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
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => HomeView()));
              },
              child: Text("Cancle", style: TextStyle(color: Colors.black)))
        ],
      ),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(start: 0.0, end: -16.0),
            Pin(size: 90.0, start: 0.0),
            child: BlendMask(
              blendMode: BlendMode.multiply,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xff88d8bb),
                ),
              ),
            ),
          ),
          Container(),
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
                      //--------------- map ------------------
                      Pinned.fromPins(
                        Pin(size: 66.9, start: 40.2),
                        Pin(size: 92.3, start: 317), //54
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffbe97c3),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 95.1, start: 106),
                        Pin(size: 69.4, start: 340), //55
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffbe97c3),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 66.9, start: 40.2),
                        Pin(size: 61.7, start: 236), //53
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffbe97c3),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 66.9, start: 40.2),
                        Pin(size: 156.6, start: 11.4), // 50
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffbe97c3),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 142.0, end: 40.9),
                        Pin(size: 251.5, start: 73.4), //48,51
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffbe97c3),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 61.6, middle: 0.5362), // above 48,51
                        Pin(size: 63.2, start: 11.4),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffbe97c3),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 93.3, end: 29.7),
                        Pin(size: 69.4, start: 340), //56
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffbe97c3),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 53.0, middle: 0.8045),
                        Pin(size: 16.0, start: 370),
                        child: Text(
                          '6F56',
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
                        Pin(size: 53.0, middle: 0.4823),
                        Pin(size: 16.0, start: 370),
                        child: Text(
                          '6F55',
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
                        Pin(size: 53.0, start: 45.7),
                        Pin(size: 16.0, start: 370),
                        child: Text(
                          '6F54',
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
                        Pin(size: 65.0, start: 42.1),
                        Pin(size: 16.0, start: 270),
                        child: Text(
                          '6F53',
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
                        Pin(size: 65.0, start: 40.0),
                        Pin(size: 16.0, start: 90),
                        child: Text(
                          '6F50',
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
                        Pin(size: 53.0, middle: 0.5547),
                        Pin(size: 16.0, start: 220),
                        child: Text(
                          '6F51',
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
                        Pin(size: 53.0, end: 44.0),
                        Pin(size: 16.0, start: 130),
                        child: Text(
                          '6F48',
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
                        Pin(size: 66.9, start: 40.2),
                        Pin(size: 70.4, start: 167), //52
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffbe97c3),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 65.0, start: 41.1),
                        Pin(size: 16.0, start: 195),
                        child: Text(
                          '6F52',
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
                        Pin(size: 66.9, start: 40.2),
                        Pin(size: 20.3, start: 297), // Exit
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff7dd871),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 42.0, middle: 0.1789),
                        Pin(size: 14.0, start: 300),
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
                        Pin(size: 71.0, middle: 0.5561),
                        Pin(size: 60.7, start: 73.4), // grey area
                        child: Transform.rotate(
                          angle: 3.1416,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffe4e4e4),
                              border: Border.all(
                                  width: 0.5, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 53.0, start: 140),
                        Pin(size: 19.0, start: 306), //wc
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffe4e4e4),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.0, start: 155),
                        Pin(size: 15.0, start: 308),
                        child: Text(
                          'WC',
                          style: TextStyle(
                            fontFamily: 'Helvetica Neue',
                            fontSize: 12,
                            color: const Color(0xff000000),
                            fontWeight: FontWeight.w500,
                            height: 3.6666666666666665,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 20.5, end: 40.7),
                        Pin(size: 42.0, start: 283), // small grey
                        child: Transform.rotate(
                          angle: 3.1416,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffe4e4e4),
                              border: Border.all(
                                  width: 0.5, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 71.0, end: 39.6),
                        Pin(size: 54.7, start: 222), // white area
                        child: Transform.rotate(
                          angle: 3.1416,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 21.1, end: 22.1),
                        Pin(size: 16.0, start: 95.4), //locker2
                        child: Transform.rotate(
                          angle: 1.5708,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xff88d8bb),
                              border: Border.all(
                                  width: 0.3, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 21.1, end: 22.1),
                        Pin(size: 16.0, start: 115.4), // locker3
                        child: Transform.rotate(
                          angle: 1.5708,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xff88d8bb),
                              border: Border.all(
                                  width: 0.3, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 21.1, end: 22.1),
                        Pin(size: 16.0, start: 143.4), // locker4
                        child: Transform.rotate(
                          angle: 1.5708,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xff88d8bb),
                              border: Border.all(
                                  width: 0.3, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 21.1, end: 22.1),
                        Pin(size: 16.0, start: 163.4), // locker5
                        child: Transform.rotate(
                          angle: 1.5708,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xff88d8bb),
                              border: Border.all(
                                  width: 0.3, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 21.1, end: 22.1),
                        Pin(size: 16.0, start: 183.4), // locker6
                        child: Transform.rotate(
                          angle: 1.5708,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xff88d8bb),
                              border: Border.all(
                                  width: 0.3, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 21.1, end: 22.1),
                        Pin(size: 16.0, start: 203.4), // locker7
                        child: Transform.rotate(
                          angle: 1.5708,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xff88d8bb),
                              border: Border.all(
                                  width: 0.3, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 21.1, end: 22.1),
                        Pin(size: 16.0, start: 75.4), // locker1
                        child: Transform.rotate(
                          angle: 1.5708,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xff88d8bb),
                              border: Border.all(
                                  width: 0.3, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),

                      //-------------------- locker set ----------------

                      // Container(
                      //   child: CarouselSlider(
                      //     options: CarouselOptions(
                      //       height: 900.0,
                      //       viewportFraction: 1,
                      //       aspectRatio: 16 / 9,
                      //       enableInfiniteScroll: false,
                      //       autoPlay: false,
                      //     ),
                      //     items: _lockers.map((i) {
                      //       return Builder(
                      //         builder: (BuildContext context) {
                      //           return Container(
                      //             child: i,
                      //           );
                      //         },
                      //       );
                      // //     }).toList(),
                      //   ),
                      // ),
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

  //larg locker widget

  //list

  List _lockers = [
    // ------------------- small lockers -------------------
    // -------------------- 1 --------------------
    Stack(children: <Widget>[
      Pinned.fromPins(
        Pin(size: 79.0, end: 12.0),
        Pin(size: 71.0, end: 230), //6-g-004
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffd6fff0),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, end: 12.0),
        Pin(size: 69.0, end: 162), //6-g-008
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffefecec),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, end: 12.0),
        Pin(size: 69.0, end: 94), //6-g-012
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffd6fff0),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, middle: 0.6393),
        Pin(size: 71.0, end: 230), //6-g-003
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffd6fff0),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, middle: 0.6393),
        Pin(size: 69.0, end: 162), //6-g-007
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffefecec),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, middle: 0.6393),
        Pin(size: 69.0, end: 94), //6-g-011
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffd6fff0),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, middle: 0.3279),
        Pin(size: 71.0, end: 230), //6-g-002
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffd6fff0),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, middle: 0.3279),
        Pin(size: 69.0, end: 162), //6-g-006
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffefecec),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, middle: 0.3279),
        Pin(size: 69.0, end: 94), //6-g-010
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffd6fff0),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, start: 4.0),
        Pin(size: 71.0, end: 230), //6-g-001
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffd6fff0),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, start: 4.0),
        Pin(size: 69.0, end: 162), //6-g-005
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffefecec),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, start: 4.0),
        Pin(size: 69.0, end: 94), //6-g-009
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffd6fff0),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, end: 12.0),
        Pin(size: 69.0, end: 26), // 6-G-016
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffefecec),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, middle: 0.6393),
        Pin(size: 69.0, end: 26), // 6-G-015
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffefecec),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, middle: 0.3238),
        Pin(size: 69.0, end: 26), // 6-G-014
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffefecec),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 78.0, start: 4.0),
        Pin(size: 69.0, end: 26), // 6-G-013
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffefecec),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, start: 14.0),
        Pin(size: 14.0, end: 280), //6-G-001
        child: Text(
          '6-G-017',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, middle: 0.337),
        Pin(size: 14.0, end: 280), // 6-G-002
        child: Text(
          '6-G-018',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, middle: 0.6087),
        Pin(size: 14.0, end: 280), // 6-G-003
        child: Text(
          '6-G-019',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, end: 33.0),
        Pin(size: 14.0, end: 280),
        child: Text(
          '6-G-020',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, start: 14.0),
        Pin(size: 14.0, end: 210),
        child: Text(
          '6-G-021',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, middle: 0.337),
        Pin(size: 14.0, end: 210),
        child: Text(
          '6-G-022',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, middle: 0.6087),
        Pin(size: 14.0, end: 210),
        child: Text(
          '6-G-023',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, end: 33.0),
        Pin(size: 14.0, end: 210),
        child: Text(
          '6-G-024',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, start: 14.0),
        Pin(size: 14.0, end: 140),
        child: Text(
          '6-G-025',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, middle: 0.337),
        Pin(size: 14.0, end: 140),
        child: Text(
          '6-G-026',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, middle: 0.6087),
        Pin(size: 14.0, end: 140),
        child: Text(
          '6-G-027',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, end: 33.0),
        Pin(size: 14.0, end: 140), //6-G-012
        child: Text(
          '6-G-028',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, start: 13.0),
        Pin(size: 14.0, end: 70),
        child: Text(
          '6-G-029',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, middle: 0.3188),
        Pin(size: 14.0, end: 70),
        child: Text(
          '6-G-030',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, middle: 0.6014),
        Pin(size: 14.0, end: 70),
        child: Text(
          '6-G-031',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, end: 33.0),
        Pin(size: 14.0, end: 70),
        child: Text(
          '6-G-032',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
    ]),

    //-------------------------- 2 -------------------

    Stack(children: <Widget>[
      Pinned.fromPins(
        Pin(size: 79.0, end: 12.0),
        Pin(size: 71.0, end: 230), //6-g-004
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffd6fff0),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, end: 12.0),
        Pin(size: 69.0, end: 162), //6-g-008
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffefecec),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, end: 12.0),
        Pin(size: 69.0, end: 94), //6-g-012
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffd6fff0),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, middle: 0.6393),
        Pin(size: 71.0, end: 230), //6-g-003
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffd6fff0),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, middle: 0.6393),
        Pin(size: 69.0, end: 162), //6-g-007
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffefecec),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, middle: 0.6393),
        Pin(size: 69.0, end: 94), //6-g-011
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffd6fff0),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, middle: 0.3279),
        Pin(size: 71.0, end: 230), //6-g-002
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffd6fff0),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, middle: 0.3279),
        Pin(size: 69.0, end: 162), //6-g-006
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffefecec),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, middle: 0.3279),
        Pin(size: 69.0, end: 94), //6-g-010
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffd6fff0),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, start: 4.0),
        Pin(size: 71.0, end: 230), //6-g-001
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffd6fff0),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, start: 4.0),
        Pin(size: 69.0, end: 162), //6-g-005
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffefecec),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, start: 4.0),
        Pin(size: 69.0, end: 94), //6-g-009
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffd6fff0),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, end: 12.0),
        Pin(size: 69.0, end: 26), // 6-G-016
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffefecec),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, middle: 0.6393),
        Pin(size: 69.0, end: 26), // 6-G-015
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffefecec),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, middle: 0.3238),
        Pin(size: 69.0, end: 26), // 6-G-014
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffefecec),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 78.0, start: 4.0),
        Pin(size: 69.0, end: 26), // 6-G-013
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffefecec),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, start: 14.0),
        Pin(size: 14.0, end: 280), //6-G-001
        child: Text(
          '6-G-017',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, middle: 0.337),
        Pin(size: 14.0, end: 280), // 6-G-002
        child: Text(
          '6-G-018',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, middle: 0.6087),
        Pin(size: 14.0, end: 280), // 6-G-003
        child: Text(
          '6-G-019',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, end: 33.0),
        Pin(size: 14.0, end: 280),
        child: Text(
          '6-G-020',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, start: 14.0),
        Pin(size: 14.0, end: 210),
        child: Text(
          '6-G-021',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, middle: 0.337),
        Pin(size: 14.0, end: 210),
        child: Text(
          '6-G-022',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, middle: 0.6087),
        Pin(size: 14.0, end: 210),
        child: Text(
          '6-G-023',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, end: 33.0),
        Pin(size: 14.0, end: 210),
        child: Text(
          '6-G-024',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, start: 14.0),
        Pin(size: 14.0, end: 140),
        child: Text(
          '6-G-025',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, middle: 0.337),
        Pin(size: 14.0, end: 140),
        child: Text(
          '6-G-026',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, middle: 0.6087),
        Pin(size: 14.0, end: 140),
        child: Text(
          '6-G-027',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, end: 33.0),
        Pin(size: 14.0, end: 140), //6-G-012
        child: Text(
          '6-G-028',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, start: 13.0),
        Pin(size: 14.0, end: 70),
        child: Text(
          '6-G-029',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, middle: 0.3188),
        Pin(size: 14.0, end: 70),
        child: Text(
          '6-G-030',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, middle: 0.6014),
        Pin(size: 14.0, end: 70),
        child: Text(
          '6-G-031',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, end: 33.0),
        Pin(size: 14.0, end: 70),
        child: Text(
          '6-G-032',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
    ]),

    // ---------------------- 3 -----------------------

    Stack(children: <Widget>[
      Pinned.fromPins(
        Pin(size: 79.0, end: 12.0),
        Pin(size: 71.0, end: 230), //6-g-004
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffd6fff0),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, end: 12.0),
        Pin(size: 69.0, end: 162), //6-g-008
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffefecec),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, end: 12.0),
        Pin(size: 69.0, end: 94), //6-g-012
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffd6fff0),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, middle: 0.6393),
        Pin(size: 71.0, end: 230), //6-g-003
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffd6fff0),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, middle: 0.6393),
        Pin(size: 69.0, end: 162), //6-g-007
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffefecec),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, middle: 0.6393),
        Pin(size: 69.0, end: 94), //6-g-011
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffd6fff0),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, middle: 0.3279),
        Pin(size: 71.0, end: 230), //6-g-002
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffd6fff0),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, middle: 0.3279),
        Pin(size: 69.0, end: 162), //6-g-006
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffefecec),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, middle: 0.3279),
        Pin(size: 69.0, end: 94), //6-g-010
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffd6fff0),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, start: 4.0),
        Pin(size: 71.0, end: 230), //6-g-001
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffd6fff0),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, start: 4.0),
        Pin(size: 69.0, end: 162), //6-g-005
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffefecec),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, start: 4.0),
        Pin(size: 69.0, end: 94), //6-g-009
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffd6fff0),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, end: 12.0),
        Pin(size: 69.0, end: 26), // 6-G-016
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffefecec),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, middle: 0.6393),
        Pin(size: 69.0, end: 26), // 6-G-015
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffefecec),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, middle: 0.3238),
        Pin(size: 69.0, end: 26), // 6-G-014
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffefecec),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 78.0, start: 4.0),
        Pin(size: 69.0, end: 26), // 6-G-013
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffefecec),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, start: 14.0),
        Pin(size: 14.0, end: 280), //6-G-001
        child: Text(
          '6-G-017',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, middle: 0.337),
        Pin(size: 14.0, end: 280), // 6-G-002
        child: Text(
          '6-G-018',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, middle: 0.6087),
        Pin(size: 14.0, end: 280), // 6-G-003
        child: Text(
          '6-G-019',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, end: 33.0),
        Pin(size: 14.0, end: 280),
        child: Text(
          '6-G-020',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, start: 14.0),
        Pin(size: 14.0, end: 210),
        child: Text(
          '6-G-021',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, middle: 0.337),
        Pin(size: 14.0, end: 210),
        child: Text(
          '6-G-022',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, middle: 0.6087),
        Pin(size: 14.0, end: 210),
        child: Text(
          '6-G-023',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, end: 33.0),
        Pin(size: 14.0, end: 210),
        child: Text(
          '6-G-024',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, start: 14.0),
        Pin(size: 14.0, end: 140),
        child: Text(
          '6-G-025',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, middle: 0.337),
        Pin(size: 14.0, end: 140),
        child: Text(
          '6-G-026',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, middle: 0.6087),
        Pin(size: 14.0, end: 140),
        child: Text(
          '6-G-027',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, end: 33.0),
        Pin(size: 14.0, end: 140), //6-G-012
        child: Text(
          '6-G-028',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, start: 13.0),
        Pin(size: 14.0, end: 70),
        child: Text(
          '6-G-029',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, middle: 0.3188),
        Pin(size: 14.0, end: 70),
        child: Text(
          '6-G-030',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, middle: 0.6014),
        Pin(size: 14.0, end: 70),
        child: Text(
          '6-G-031',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, end: 33.0),
        Pin(size: 14.0, end: 70),
        child: Text(
          '6-G-032',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
    ]),

    // ----------------- 4 -----------------------

    Stack(children: <Widget>[
      Pinned.fromPins(
        Pin(size: 79.0, end: 12.0),
        Pin(size: 71.0, end: 230), //6-g-004
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffd6fff0),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, end: 12.0),
        Pin(size: 69.0, end: 162), //6-g-008
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffefecec),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, end: 12.0),
        Pin(size: 69.0, end: 94), //6-g-012
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffd6fff0),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, middle: 0.6393),
        Pin(size: 71.0, end: 230), //6-g-003
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffd6fff0),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, middle: 0.6393),
        Pin(size: 69.0, end: 162), //6-g-007
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffefecec),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, middle: 0.6393),
        Pin(size: 69.0, end: 94), //6-g-011
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffd6fff0),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, middle: 0.3279),
        Pin(size: 71.0, end: 230), //6-g-002
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffd6fff0),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, middle: 0.3279),
        Pin(size: 69.0, end: 162), //6-g-006
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffefecec),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, middle: 0.3279),
        Pin(size: 69.0, end: 94), //6-g-010
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffd6fff0),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, start: 4.0),
        Pin(size: 71.0, end: 230), //6-g-001
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffd6fff0),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, start: 4.0),
        Pin(size: 69.0, end: 162), //6-g-005
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffefecec),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, start: 4.0),
        Pin(size: 69.0, end: 94), //6-g-009
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffd6fff0),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, end: 12.0),
        Pin(size: 69.0, end: 26), // 6-G-016
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffefecec),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, middle: 0.6393),
        Pin(size: 69.0, end: 26), // 6-G-015
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffefecec),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, middle: 0.3238),
        Pin(size: 69.0, end: 26), // 6-G-014
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffefecec),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 78.0, start: 4.0),
        Pin(size: 69.0, end: 26), // 6-G-013
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffefecec),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, start: 14.0),
        Pin(size: 14.0, end: 280), //6-G-001
        child: Text(
          '6-G-017',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, middle: 0.337),
        Pin(size: 14.0, end: 280), // 6-G-002
        child: Text(
          '6-G-018',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, middle: 0.6087),
        Pin(size: 14.0, end: 280), // 6-G-003
        child: Text(
          '6-G-019',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, end: 33.0),
        Pin(size: 14.0, end: 280),
        child: Text(
          '6-G-020',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, start: 14.0),
        Pin(size: 14.0, end: 210),
        child: Text(
          '6-G-021',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, middle: 0.337),
        Pin(size: 14.0, end: 210),
        child: Text(
          '6-G-022',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, middle: 0.6087),
        Pin(size: 14.0, end: 210),
        child: Text(
          '6-G-023',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, end: 33.0),
        Pin(size: 14.0, end: 210),
        child: Text(
          '6-G-024',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, start: 14.0),
        Pin(size: 14.0, end: 140),
        child: Text(
          '6-G-025',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, middle: 0.337),
        Pin(size: 14.0, end: 140),
        child: Text(
          '6-G-026',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, middle: 0.6087),
        Pin(size: 14.0, end: 140),
        child: Text(
          '6-G-027',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, end: 33.0),
        Pin(size: 14.0, end: 140), //6-G-012
        child: Text(
          '6-G-028',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, start: 13.0),
        Pin(size: 14.0, end: 70),
        child: Text(
          '6-G-029',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, middle: 0.3188),
        Pin(size: 14.0, end: 70),
        child: Text(
          '6-G-030',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, middle: 0.6014),
        Pin(size: 14.0, end: 70),
        child: Text(
          '6-G-031',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, end: 33.0),
        Pin(size: 14.0, end: 70),
        child: Text(
          '6-G-032',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
    ]),

    //---------------------- 5 --------------------------
    Stack(children: <Widget>[
      Pinned.fromPins(
        Pin(size: 79.0, end: 12.0),
        Pin(size: 71.0, end: 230), //6-g-004
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffd6fff0),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, end: 12.0),
        Pin(size: 69.0, end: 162), //6-g-008
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffefecec),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, end: 12.0),
        Pin(size: 69.0, end: 94), //6-g-012
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffd6fff0),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, middle: 0.6393),
        Pin(size: 71.0, end: 230), //6-g-003
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffd6fff0),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, middle: 0.6393),
        Pin(size: 69.0, end: 162), //6-g-007
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffefecec),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, middle: 0.6393),
        Pin(size: 69.0, end: 94), //6-g-011
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffd6fff0),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, middle: 0.3279),
        Pin(size: 71.0, end: 230), //6-g-002
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffd6fff0),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, middle: 0.3279),
        Pin(size: 69.0, end: 162), //6-g-006
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffefecec),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, middle: 0.3279),
        Pin(size: 69.0, end: 94), //6-g-010
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffd6fff0),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, start: 4.0),
        Pin(size: 71.0, end: 230), //6-g-001
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffd6fff0),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, start: 4.0),
        Pin(size: 69.0, end: 162), //6-g-005
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffefecec),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, start: 4.0),
        Pin(size: 69.0, end: 94), //6-g-009
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffd6fff0),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, end: 12.0),
        Pin(size: 69.0, end: 26), // 6-G-016
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffefecec),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, middle: 0.6393),
        Pin(size: 69.0, end: 26), // 6-G-015
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffefecec),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, middle: 0.3238),
        Pin(size: 69.0, end: 26), // 6-G-014
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffefecec),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 78.0, start: 4.0),
        Pin(size: 69.0, end: 26), // 6-G-013
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffefecec),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, start: 14.0),
        Pin(size: 14.0, end: 280), //6-G-001
        child: Text(
          '6-G-017',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, middle: 0.337),
        Pin(size: 14.0, end: 280), // 6-G-002
        child: Text(
          '6-G-018',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, middle: 0.6087),
        Pin(size: 14.0, end: 280), // 6-G-003
        child: Text(
          '6-G-019',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, end: 33.0),
        Pin(size: 14.0, end: 280),
        child: Text(
          '6-G-020',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, start: 14.0),
        Pin(size: 14.0, end: 210),
        child: Text(
          '6-G-021',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, middle: 0.337),
        Pin(size: 14.0, end: 210),
        child: Text(
          '6-G-022',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, middle: 0.6087),
        Pin(size: 14.0, end: 210),
        child: Text(
          '6-G-023',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, end: 33.0),
        Pin(size: 14.0, end: 210),
        child: Text(
          '6-G-024',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, start: 14.0),
        Pin(size: 14.0, end: 140),
        child: Text(
          '6-G-025',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, middle: 0.337),
        Pin(size: 14.0, end: 140),
        child: Text(
          '6-G-026',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, middle: 0.6087),
        Pin(size: 14.0, end: 140),
        child: Text(
          '6-G-027',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, end: 33.0),
        Pin(size: 14.0, end: 140), //6-G-012
        child: Text(
          '6-G-028',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, start: 13.0),
        Pin(size: 14.0, end: 70),
        child: Text(
          '6-G-029',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, middle: 0.3188),
        Pin(size: 14.0, end: 70),
        child: Text(
          '6-G-030',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, middle: 0.6014),
        Pin(size: 14.0, end: 70),
        child: Text(
          '6-G-031',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, end: 33.0),
        Pin(size: 14.0, end: 70),
        child: Text(
          '6-G-032',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
    ]),

    //---------------------------6 ----------------------------
    Stack(children: <Widget>[
      Pinned.fromPins(
        Pin(size: 79.0, end: 12.0),
        Pin(size: 71.0, end: 230), //6-g-004
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffd6fff0),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, end: 12.0),
        Pin(size: 69.0, end: 162), //6-g-008
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffefecec),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, end: 12.0),
        Pin(size: 69.0, end: 94), //6-g-012
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffd6fff0),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, middle: 0.6393),
        Pin(size: 71.0, end: 230), //6-g-003
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffd6fff0),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, middle: 0.6393),
        Pin(size: 69.0, end: 162), //6-g-007
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffefecec),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, middle: 0.6393),
        Pin(size: 69.0, end: 94), //6-g-011
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffd6fff0),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, middle: 0.3279),
        Pin(size: 71.0, end: 230), //6-g-002
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffd6fff0),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, middle: 0.3279),
        Pin(size: 69.0, end: 162), //6-g-006
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffefecec),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, middle: 0.3279),
        Pin(size: 69.0, end: 94), //6-g-010
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffd6fff0),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, start: 4.0),
        Pin(size: 71.0, end: 230), //6-g-001
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffd6fff0),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, start: 4.0),
        Pin(size: 69.0, end: 162), //6-g-005
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffefecec),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, start: 4.0),
        Pin(size: 69.0, end: 94), //6-g-009
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffd6fff0),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, end: 12.0),
        Pin(size: 69.0, end: 26), // 6-G-016
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffefecec),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, middle: 0.6393),
        Pin(size: 69.0, end: 26), // 6-G-015
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffefecec),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, middle: 0.3238),
        Pin(size: 69.0, end: 26), // 6-G-014
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffefecec),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 78.0, start: 4.0),
        Pin(size: 69.0, end: 26), // 6-G-013
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffefecec),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, start: 14.0),
        Pin(size: 14.0, end: 280), //6-G-001
        child: Text(
          '6-G-017',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, middle: 0.337),
        Pin(size: 14.0, end: 280), // 6-G-002
        child: Text(
          '6-G-018',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, middle: 0.6087),
        Pin(size: 14.0, end: 280), // 6-G-003
        child: Text(
          '6-G-019',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, end: 33.0),
        Pin(size: 14.0, end: 280),
        child: Text(
          '6-G-020',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, start: 14.0),
        Pin(size: 14.0, end: 210),
        child: Text(
          '6-G-021',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, middle: 0.337),
        Pin(size: 14.0, end: 210),
        child: Text(
          '6-G-022',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, middle: 0.6087),
        Pin(size: 14.0, end: 210),
        child: Text(
          '6-G-023',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, end: 33.0),
        Pin(size: 14.0, end: 210),
        child: Text(
          '6-G-024',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, start: 14.0),
        Pin(size: 14.0, end: 140),
        child: Text(
          '6-G-025',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, middle: 0.337),
        Pin(size: 14.0, end: 140),
        child: Text(
          '6-G-026',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, middle: 0.6087),
        Pin(size: 14.0, end: 140),
        child: Text(
          '6-G-027',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, end: 33.0),
        Pin(size: 14.0, end: 140), //6-G-012
        child: Text(
          '6-G-028',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, start: 13.0),
        Pin(size: 14.0, end: 70),
        child: Text(
          '6-G-029',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, middle: 0.3188),
        Pin(size: 14.0, end: 70),
        child: Text(
          '6-G-030',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, middle: 0.6014),
        Pin(size: 14.0, end: 70),
        child: Text(
          '6-G-031',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, end: 33.0),
        Pin(size: 14.0, end: 70),
        child: Text(
          '6-G-032',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
    ]),

    //----------------------------- 7 ----------------------
    Stack(children: <Widget>[
      Pinned.fromPins(
        Pin(size: 79.0, end: 12.0),
        Pin(size: 71.0, end: 230), //6-g-004
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffd6fff0),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, end: 12.0),
        Pin(size: 69.0, end: 162), //6-g-008
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffefecec),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, end: 12.0),
        Pin(size: 69.0, end: 94), //6-g-012
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffd6fff0),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, middle: 0.6393),
        Pin(size: 71.0, end: 230), //6-g-003
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffd6fff0),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, middle: 0.6393),
        Pin(size: 69.0, end: 162), //6-g-007
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffefecec),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, middle: 0.6393),
        Pin(size: 69.0, end: 94), //6-g-011
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffd6fff0),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, middle: 0.3279),
        Pin(size: 71.0, end: 230), //6-g-002
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffd6fff0),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, middle: 0.3279),
        Pin(size: 69.0, end: 162), //6-g-006
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffefecec),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, middle: 0.3279),
        Pin(size: 69.0, end: 94), //6-g-010
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffd6fff0),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, start: 4.0),
        Pin(size: 71.0, end: 230), //6-g-001
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffd6fff0),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, start: 4.0),
        Pin(size: 69.0, end: 162), //6-g-005
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffefecec),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, start: 4.0),
        Pin(size: 69.0, end: 94), //6-g-009
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffd6fff0),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, end: 12.0),
        Pin(size: 69.0, end: 26), // 6-G-016
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffefecec),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, middle: 0.6393),
        Pin(size: 69.0, end: 26), // 6-G-015
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffefecec),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, middle: 0.3238),
        Pin(size: 69.0, end: 26), // 6-G-014
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffefecec),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 78.0, start: 4.0),
        Pin(size: 69.0, end: 26), // 6-G-013
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffefecec),
            border: Border.all(width: 1.0, color: const Color(0xff707070)),
          ),
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, start: 14.0),
        Pin(size: 14.0, end: 280), //6-G-001
        child: Text(
          '6-G-017',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, middle: 0.337),
        Pin(size: 14.0, end: 280), // 6-G-002
        child: Text(
          '6-G-018',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, middle: 0.6087),
        Pin(size: 14.0, end: 280), // 6-G-003
        child: Text(
          '6-G-019',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, end: 33.0),
        Pin(size: 14.0, end: 280),
        child: Text(
          '6-G-020',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, start: 14.0),
        Pin(size: 14.0, end: 210),
        child: Text(
          '6-G-021',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, middle: 0.337),
        Pin(size: 14.0, end: 210),
        child: Text(
          '6-G-022',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, middle: 0.6087),
        Pin(size: 14.0, end: 210),
        child: Text(
          '6-G-023',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, end: 33.0),
        Pin(size: 14.0, end: 210),
        child: Text(
          '6-G-024',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, start: 14.0),
        Pin(size: 14.0, end: 140),
        child: Text(
          '6-G-025',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, middle: 0.337),
        Pin(size: 14.0, end: 140),
        child: Text(
          '6-G-026',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, middle: 0.6087),
        Pin(size: 14.0, end: 140),
        child: Text(
          '6-G-027',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, end: 33.0),
        Pin(size: 14.0, end: 140), //6-G-012
        child: Text(
          '6-G-028',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, start: 13.0),
        Pin(size: 14.0, end: 70),
        child: Text(
          '6-G-029',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, middle: 0.3188),
        Pin(size: 14.0, end: 70),
        child: Text(
          '6-G-030',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, middle: 0.6014),
        Pin(size: 14.0, end: 70),
        child: Text(
          '6-G-031',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, end: 33.0),
        Pin(size: 14.0, end: 70),
        child: Text(
          '6-G-032',
          style: TextStyle(
            fontFamily: 'Helvetica Neue',
            fontSize: 12,
            color: const Color(0xff0f0000),
            height: 3.6666666666666665,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
      ),
    ]),
  ];
}
