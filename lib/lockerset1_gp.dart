import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:adobe_xd/blend_mask.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:relocker_sa/payment_view/reservation_details.dart';
import 'home_view.dart';
import 'locker_type.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class lockerset1_gpl extends StatefulWidget {
  final int numberOfWeek;
  lockerset1_gpl({Key? key, required this.numberOfWeek}) : super(key: key);

  @override
  _lockerset1_gplState createState() => _lockerset1_gplState();
}

class _lockerset1_gplState extends State<lockerset1_gpl> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: lockerspage(),
    );
  }
}

class lockerspage extends StatefulWidget {
  const lockerspage({Key? key}) : super(key: key);

  @override
  _lockerspageState createState() => _lockerspageState();
}

class _lockerspageState extends State<lockerspage> {
  String mySvg1(color) {
    return '<svg viewBox="249.0 618.1 79.0 122.4" ><path transform="translate(-2194.52, 743.73)" d="M 2522.52490234375 -3.299476623535156 C 2521.978515625 -27.48745727539062 2522.08837890625 -3.299476623535156 2522.08837890625 -3.299476623535156 L 2522.08837890625 -125.671630859375 C 2522.08837890625 -125.671630859375 2443.545166015625 -125.671630859375 2443.545166015625 -125.671630859375 L 2443.545166015625 -52.18785095214844 L 2484.196044921875 -52.18785095214844 L 2484.196044921875 -3.299476623535156 L 2522.52490234375 -3.299476623535156 Z" fill="#$color" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
  }

  String mySvg2(color) {
    return '<svg viewBox="249.1 690.3 78.9 125.7" ><path transform="translate(-2194.24, 816.18)" d="M 2443.54541015625 -125.6716384887695 C 2443.5869140625 -123.7803497314453 2443.677490234375 -126.4785385131836 2443.54541015625 -125.6716384887695 C 2443.53173828125 -123.8471298217773 2443.54541015625 -124.5504608154297 2443.54541015625 -124.5504608154297 L 2443.980224609375 -0.175445556640625 C 2443.980224609375 -0.1754300594329834 2522.24072265625 -0.175445556640625 2522.24072265625 -0.175445556640625 L 2522.24072265625 -75.53519439697266 L 2483.88623046875 -75.53519439697266 L 2483.88623046875 -124.5504608154297 L 2443.29638671875 -124.5504608154297 L 2443.54541015625 -124.5504608154297 L 2443.54541015625 -125.6716384887695 Z" fill="#$color" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
  }

  // showLocker(context, text, size) {
  //   //display lockers
  //   showModalBottomSheet<void>(
  //       context: context,
  //       shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.vertical(top: Radius.circular(16.0))),
  //       builder: (BuildContext context) {
  //         return Container(
  //           //color: Colors.amber,
  //           child: Center(
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: <Widget>[
  //                 Padding(
  //                   padding: const EdgeInsets.all(16.0),
  //                   child: Column(
  //                     children: [
  //                       Text(
  //                         "Choose the locker that suits you",
  //                         style: TextStyle(
  //                             fontSize: 22, fontWeight: FontWeight.bold),
  //                       ),
  //                       ListTile(
  //                         title: Text("Not Available"),
  //                         leading: Icon(Icons.circle, color: Colors.grey),
  //                       )
  //                     ],
  //                   ),
  //                 ),
  //                 // Container(
  //                 //   width: 80.0,
  //                 //   height: 200,
  //                 //   child: Stack(
  //                 //     children: [
  //                 //       Positioned(
  //                 //         top: 0,
  //                 //         child: Container(
  //                 //           child: SvgPicture.string(
  //                 //             _svg_f2vz4y,
  //                 //             allowDrawingOutsideViewBox: true,
  //                 //             fit: BoxFit.fill,
  //                 //           ),
  //                 //         ),
  //                 //       ),
  //                 //       Positioned(
  //                 //         bottom: 0,
  //                 //         child: Container(
  //                 //             child: SvgPicture.string(
  //                 //           _svg_ct53v6,
  //                 //           allowDrawingOutsideViewBox: true,
  //                 //           fit: BoxFit.fill,
  //                 //         )),
  //                 //       )
  //                 //     ],
  //                 //   ),
  //                 // ),

  //                 Expanded(
  //                   //display lockers
  //                   child: StreamBuilder<QuerySnapshot>(
  //                     stream: FirebaseFirestore.instance
  //                         .collection('lockers')
  //                         .where("block", isEqualTo: text)
  //                         .orderBy("name")
  //                         .snapshots(),
  //                     builder: (BuildContext context,
  //                         AsyncSnapshot<QuerySnapshot> snapshot) {
  //                       if (snapshot.hasError) {
  //                         return Text('Something went wrong');
  //                       }

  //                       if (snapshot.connectionState ==
  //                           ConnectionState.waiting) {
  //                         return Center(child: CircularProgressIndicator());
  //                       }

  //                       return Center(
  //                         child: size == "s"
  //                             ? GridView.builder(
  //                                 shrinkWrap: true,
  //                                 padding: EdgeInsets.all(16.0),
  //                                 gridDelegate:
  //                                     SliverGridDelegateWithFixedCrossAxisCount(
  //                                         crossAxisCount: 4,
  //                                         childAspectRatio: 3 / 4),
  //                                 itemCount: snapshot.data!.docs.length,
  //                                 itemBuilder: (context, index) {
  //                                   Map<String, dynamic> data =
  //                                       snapshot.data!.docs[index].data()!
  //                                           as Map<String, dynamic>;
  //                                   return GestureDetector(
  //                                       onTap: data['available']
  //                                           ? () {
  //                                               var rslp = 125;
  //                                               var rllp = 150;
  //                                               var fslp = 15;
  //                                               var fllp = 25;
  //                                               print(data);

  //                                               var locker_type = data['type'];
  //                                               var locker_size = data['size'];

  //                                               if (locker_type == "r") {
  //                                                 if (locker_size == "s") {
  //                                                   print(rslp);
  //                                                 } else {
  //                                                   print(rllp);
  //                                                 }
  //                                               } else {
  //                                                 if (locker_size == "s") {
  //                                                   print(fslp *
  //                                                       widget.numberOfWeek);
  //                                                 } else {
  //                                                   print(fllp *
  //                                                       widget.numberOfWeek);
  //                                                 }
  //                                               }
  //                                             }
  //                                           : () {},
  //                                       child: GestureDetector(
  //                                           onTap: () {
  //                                             //print('hi');
  //                                             Navigator.of(context).push(
  //                                                 MaterialPageRoute(
  //                                                     builder: (context) =>
  //                                                         ReservationDetails()));
  //                                           },
  //                                           child: Container(
  //                                             padding: EdgeInsets.all(10),
  //                                             decoration: BoxDecoration(
  //                                                 color: data['available']
  //                                                     ? Colors.green.shade300
  //                                                     : Colors.grey,
  //                                                 border: Border.all(
  //                                                     width: 1,
  //                                                     color: Colors.grey)),
  //                                             child: Text("${data['name']}"),
  //                                           )));
  //                                 },
  //                               )
  //                             : GridView.builder(
  //                                 shrinkWrap: true,
  //                                 padding: EdgeInsets.all(16.0),
  //                                 gridDelegate:
  //                                     SliverGridDelegateWithFixedCrossAxisCount(
  //                                         crossAxisCount: 4,
  //                                         childAspectRatio: 1 / 2.20),
  //                                 itemCount:
  //                                     (snapshot.data!.docs.length ~/ 2).toInt(),
  //                                 itemBuilder: (context, index) {
  //                                   Map<String, dynamic> data1 =
  //                                       snapshot.data!.docs[index * 2].data()!
  //                                           as Map<String, dynamic>;
  //                                   Map<String, dynamic> data2 = snapshot
  //                                       .data!.docs[index * 2 + 1]
  //                                       .data()! as Map<String, dynamic>;
  //                                   return Container(
  //                                     width: 80.0,
  //                                     height: 200,
  //                                     child: Stack(
  //                                       children: [
  //                                         Positioned(
  //                                           top: 0,
  //                                           child: GestureDetector(
  //                                             onTap: data1['available']
  //                                                 ? () {
  //                                                     var rslp = 125;
  //                                                     var rllp = 150;
  //                                                     var fslp = 15;
  //                                                     var fllp = 25;
  //                                                     print(data1);

  //                                                     var locker_type =
  //                                                         data1['type'];
  //                                                     var locker_size =
  //                                                         data1['size'];

  //                                                     if (locker_type == "r") {
  //                                                       if (locker_size ==
  //                                                           "s") {
  //                                                         print(rslp);
  //                                                       } else {
  //                                                         print(rllp);
  //                                                       }
  //                                                     } else {
  //                                                       if (locker_size ==
  //                                                           "s") {
  //                                                         print(fslp *
  //                                                             widget
  //                                                                 .numberOfWeek);
  //                                                       } else {
  //                                                         print(fllp *
  //                                                             widget
  //                                                                 .numberOfWeek);
  //                                                       }
  //                                                     }
  //                                                   }
  //                                                 : () {},
  //                                             child: GestureDetector(
  //                                               onTap: () {
  //                                                 //print('hi');
  //                                                 Navigator.of(context).push(
  //                                                     MaterialPageRoute(
  //                                                         builder: (context) =>
  //                                                             ReservationDetails()));
  //                                               },
  //                                               child: Container(
  //                                                 child: Stack(
  //                                                   children: [
  //                                                     SvgPicture.string(
  //                                                       mySvg1(
  //                                                           data1["available"]
  //                                                               ? "ff0000"
  //                                                               : "fafafa"),
  //                                                       allowDrawingOutsideViewBox:
  //                                                           true,
  //                                                       fit: BoxFit.fill,
  //                                                     ),
  //                                                     Text(
  //                                                       "${data1['name']}",
  //                                                       style: TextStyle(
  //                                                           fontSize: 20,
  //                                                           color:
  //                                                               Colors.black),
  //                                                     )
  //                                                   ],
  //                                                 ),
  //                                               ),
  //                                             ),
  //                                           ),
  //                                         ),
  //                                         Positioned(
  //                                           bottom: 0,
  //                                           child: GestureDetector(
  //                                             onTap: data2['available']
  //                                                 ? () {
  //                                                     var rslp = 125;
  //                                                     var rllp = 150;
  //                                                     var fslp = 15;
  //                                                     var fllp = 25;
  //                                                     print(data2);

  //                                                     var locker_type =
  //                                                         data2['type'];
  //                                                     var locker_size =
  //                                                         data2['size'];

  //                                                     if (locker_type == "r") {
  //                                                       if (locker_size ==
  //                                                           "s") {
  //                                                         print(rslp);
  //                                                       } else {
  //                                                         print(rllp);
  //                                                       }
  //                                                     } else {
  //                                                       if (locker_size ==
  //                                                           "s") {
  //                                                         print(fslp *
  //                                                             widget
  //                                                                 .numberOfWeek);
  //                                                       } else {
  //                                                         print(fllp *
  //                                                             widget
  //                                                                 .numberOfWeek);
  //                                                       }
  //                                                     }
  //                                                   }
  //                                                 : () {},
  //                                             child: GestureDetector(
  //                                               onTap: () {
  //                                                 //print('hi');
  //                                                 Navigator.of(context).push(
  //                                                     MaterialPageRoute(
  //                                                         builder: (context) =>
  //                                                             ReservationDetails()));
  //                                               },
  //                                               child: Container(
  //                                                   child: Stack(
  //                                                 children: [
  //                                                   SvgPicture.string(
  //                                                     mySvg2(data2["available"]
  //                                                         ? "ff0000"
  //                                                         : "fafafa"),
  //                                                     allowDrawingOutsideViewBox:
  //                                                         true,
  //                                                     fit: BoxFit.fill,
  //                                                   ),
  //                                                   Positioned(
  //                                                     bottom: 0,
  //                                                     child: Text(
  //                                                       "${data2['name']}",
  //                                                       style: TextStyle(
  //                                                           fontSize: 20,
  //                                                           color:
  //                                                               Colors.black),
  //                                                     ),
  //                                                   )
  //                                                 ],
  //                                               )),
  //                                             ),
  //                                           ),
  //                                         )
  //                                       ],
  //                                     ),
  //                                   );
  //                                 }),
  //                       );
  //                     },
  //                   ),
  //                 )
  //               ],
  //             ),
  //           ),
  //         );
  //       });
  // }

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
          Container(),
          Pinned.fromPins(
            Pin(size: 328.0, middle: 0.4762),
            Pin(start: 103.0, end: 0.5),
            child: Scrollbar(
              child: SingleChildScrollView(
                child: SizedBox(
                  width: 328.0,
                  height: 800.0,
                  child: Stack(
                    children: <Widget>[
                      //------------------- map ---------------
                      Pinned.fromPins(
                        Pin(size: 66.9, start: 40.2),
                        Pin(size: 92.3, start: 317), //49
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffbe97c3),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 95.1, middle: 0.4598),
                        Pin(size: 69.4, start: 340), //50
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
                        Pin(size: 61.7, start: 236), //48
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
                        Pin(size: 82.5, start: 100), //46
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
                        Pin(size: 74.0, start: 27.5), // 44
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffbe97c3),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 142.0, end: 35.9),
                        Pin(size: 203.8, start: 113), // 53,52
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffbe97c3),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 61.6, middle: 0.5636),
                        Pin(size: 85.8, start: 28), // above 53,52
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffbe97c3),
                            border: Border.all(
                                width: 0.5, color: const Color(0xff000000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 93.3, end: 35.7),
                        Pin(size: 69.4, start: 340), //51
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
                          '6G51',
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
                          '6G50',
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
                          '6G49',
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
                        Pin(size: 16.0, start: 260),
                        child: Text(
                          '6G48',
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
                        Pin(size: 65.0, start: 41.1),
                        Pin(size: 16.0, start: 135),
                        child: Text(
                          '6G46',
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
                        Pin(size: 65.0, start: 39.7),
                        Pin(size: 16.0, start: 55.0),
                        child: Text(
                          '6G44',
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
                        Pin(size: 53.0, middle: 0.6818),
                        Pin(size: 16.0, start: 220),
                        child: Text(
                          '6G52',
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
                        Pin(size: 53.0, end: 41.6),
                        Pin(size: 16.0, start: 140),
                        child: Text(
                          '6G53',
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
                        Pin(size: 55.4, start: 182), // 47
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
                        Pin(size: 16.0, start: 200),
                        child: Text(
                          '6G47',
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
                        Pin(size: 71.0, middle: 0.5842),
                        Pin(size: 60.7, start: 113), // grey area
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
                        Pin(size: 53.0, middle: 0.5459),
                        Pin(size: 19.0, start: 298), //wc
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffe4e4e4),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.0, middle: 0.5408),
                        Pin(size: 15.0, start: 301),
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
                        Pin(size: 20.5, end: 35.7),
                        Pin(size: 47.0, start: 270), // small grey
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
                        Pin(size: 21.1, middle: 0.3417),
                        Pin(size: 16.0, start: 42.0), // locker3
                        child: Transform.rotate(
                          angle: 1.5708,
                          child: GestureDetector(
                            onTap: () {
                              //showLocker(context, "gp3", "l");
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xff88d8bb),
                                border: Border.all(
                                    width: 0.3, color: const Color(0xff000000)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 21.1, middle: 0.3417),
                        Pin(size: 16.0, start: 62), //locker4
                        child: Transform.rotate(
                          angle: 1.5708,
                          child: GestureDetector(
                            onTap: () {
                              // showLocker(context, "gp4", "l");
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xff88d8bb),
                                border: Border.all(
                                    width: 0.3, color: const Color(0xff000000)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 21.1, middle: 0.3417),
                        Pin(size: 16.0, start: 82), //locker5
                        child: Transform.rotate(
                          angle: 1.5708,
                          child: GestureDetector(
                            onTap: () {
                              //showLocker(context, "gp5", "l");
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xff88d8bb),
                                border: Border.all(
                                    width: 0.3, color: const Color(0xff000000)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 21.1, middle: 0.1667),
                        Pin(size: 16.0, start: 11.4), //locker1

                        child: GestureDetector(
                          onTap: () {
                            //showLocker(context, "gp1", "l");
                          },
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
                        Pin(size: 21.1, middle: 0.2351),
                        Pin(size: 16.0, start: 11.4), //locker2

                        child: GestureDetector(
                          onTap: () {
                            // showLocker(context, "gp2", "l");
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xff88d8bb),
                              border: Border.all(
                                  width: 0.3, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),

                      //--------------------- locker set ---------------
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

  List _lockers = [
    //-------------- large lockers -------------------
    //--------------------- 1 -------------------------
    Stack(children: <Widget>[
      Pinned.fromPins(
        Pin(size: 78.9, end: 0.0),
        Pin(size: 125.7, end: 29.5),
        child: SvgPicture.string(
          _svg_ct53v6,
          allowDrawingOutsideViewBox: true,
          fit: BoxFit.fill,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, end: 0.0),
        Pin(size: 122.4, end: 105),
        child: SvgPicture.string(
          _svg_f2vz4y,
          allowDrawingOutsideViewBox: true,
          fit: BoxFit.fill,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 78.9, middle: 0.6868),
        Pin(size: 125.7, end: 29.5),
        child: SvgPicture.string(
          _svg_fn5nh9,
          allowDrawingOutsideViewBox: true,
          fit: BoxFit.fill,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, middle: 0.6868),
        Pin(size: 122.4, end: 105),
        child: SvgPicture.string(
          _svg_nn2c3,
          allowDrawingOutsideViewBox: true,
          fit: BoxFit.fill,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 78.9, middle: 0.3696),
        Pin(size: 125.7, end: 29.5),
        child: SvgPicture.string(
          _svg_aongdj,
          allowDrawingOutsideViewBox: true,
          fit: BoxFit.fill,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, middle: 0.3695),
        Pin(size: 122.4, end: 105),
        child: SvgPicture.string(
          _svg_dida0n,
          allowDrawingOutsideViewBox: true,
          fit: BoxFit.fill,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 78.9, start: 14.1),
        Pin(size: 125.7, end: 29.5),
        child: SvgPicture.string(
          _svg_aa0bz,
          allowDrawingOutsideViewBox: true,
          fit: BoxFit.fill,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, start: 14.0),
        Pin(size: 122.4, end: 105),
        child: SvgPicture.string(
          _svg_gxlwbj,
          allowDrawingOutsideViewBox: true,
          fit: BoxFit.fill,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, start: 39.0),
        Pin(size: 14.0, end: 197),
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
        Pin(size: 47.0, middle: 0.4164),
        Pin(size: 14.0, end: 197),
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
        Pin(size: 47.0, middle: 0.6975),
        Pin(size: 14.0, end: 197),
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
        Pin(size: 47.0, end: 6.0),
        Pin(size: 14.0, end: 197),
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
        Pin(size: 47.0, start: 39.0),
        Pin(size: 14.0, end: 77),
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
        Pin(size: 47.0, middle: 0.4164),
        Pin(size: 14.0, end: 77),
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
        Pin(size: 47.0, middle: 0.6975),
        Pin(size: 14.0, end: 77),
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
        Pin(size: 47.0, end: 6.0),
        Pin(size: 14.0, end: 77),
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
    ]),

    //------------------------ 2 --------------------

    Stack(children: <Widget>[
      Pinned.fromPins(
        Pin(size: 78.9, end: 0.0),
        Pin(size: 125.7, end: 29.5),
        child: SvgPicture.string(
          _svg_ct53v6,
          allowDrawingOutsideViewBox: true,
          fit: BoxFit.fill,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, end: 0.0),
        Pin(size: 122.4, end: 105),
        child: SvgPicture.string(
          _svg_f2vz4y,
          allowDrawingOutsideViewBox: true,
          fit: BoxFit.fill,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 78.9, middle: 0.6868),
        Pin(size: 125.7, end: 29.5),
        child: SvgPicture.string(
          _svg_fn5nh9,
          allowDrawingOutsideViewBox: true,
          fit: BoxFit.fill,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, middle: 0.6868),
        Pin(size: 122.4, end: 105),
        child: SvgPicture.string(
          _svg_nn2c3,
          allowDrawingOutsideViewBox: true,
          fit: BoxFit.fill,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 78.9, middle: 0.3696),
        Pin(size: 125.7, end: 29.5),
        child: SvgPicture.string(
          _svg_aongdj,
          allowDrawingOutsideViewBox: true,
          fit: BoxFit.fill,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, middle: 0.3695),
        Pin(size: 122.4, end: 105),
        child: SvgPicture.string(
          _svg_dida0n,
          allowDrawingOutsideViewBox: true,
          fit: BoxFit.fill,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 78.9, start: 14.1),
        Pin(size: 125.7, end: 29.5),
        child: SvgPicture.string(
          _svg_aa0bz,
          allowDrawingOutsideViewBox: true,
          fit: BoxFit.fill,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, start: 14.0),
        Pin(size: 122.4, end: 105),
        child: SvgPicture.string(
          _svg_gxlwbj,
          allowDrawingOutsideViewBox: true,
          fit: BoxFit.fill,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, start: 39.0),
        Pin(size: 14.0, end: 197),
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
        Pin(size: 47.0, middle: 0.4164),
        Pin(size: 14.0, end: 197),
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
        Pin(size: 47.0, middle: 0.6975),
        Pin(size: 14.0, end: 197),
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
        Pin(size: 47.0, end: 6.0),
        Pin(size: 14.0, end: 197),
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
        Pin(size: 47.0, start: 39.0),
        Pin(size: 14.0, end: 77),
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
        Pin(size: 47.0, middle: 0.4164),
        Pin(size: 14.0, end: 77),
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
        Pin(size: 47.0, middle: 0.6975),
        Pin(size: 14.0, end: 77),
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
        Pin(size: 47.0, end: 6.0),
        Pin(size: 14.0, end: 77),
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
    ]),

    // ------------------------ 3 ------------------------

    Stack(children: <Widget>[
      Pinned.fromPins(
        Pin(size: 78.9, end: 0.0),
        Pin(size: 125.7, end: 29.5),
        child: SvgPicture.string(
          _svg_ct53v6,
          allowDrawingOutsideViewBox: true,
          fit: BoxFit.fill,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, end: 0.0),
        Pin(size: 122.4, end: 105),
        child: SvgPicture.string(
          _svg_f2vz4y,
          allowDrawingOutsideViewBox: true,
          fit: BoxFit.fill,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 78.9, middle: 0.6868),
        Pin(size: 125.7, end: 29.5),
        child: SvgPicture.string(
          _svg_fn5nh9,
          allowDrawingOutsideViewBox: true,
          fit: BoxFit.fill,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, middle: 0.6868),
        Pin(size: 122.4, end: 105),
        child: SvgPicture.string(
          _svg_nn2c3,
          allowDrawingOutsideViewBox: true,
          fit: BoxFit.fill,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 78.9, middle: 0.3696),
        Pin(size: 125.7, end: 29.5),
        child: SvgPicture.string(
          _svg_aongdj,
          allowDrawingOutsideViewBox: true,
          fit: BoxFit.fill,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, middle: 0.3695),
        Pin(size: 122.4, end: 105),
        child: SvgPicture.string(
          _svg_dida0n,
          allowDrawingOutsideViewBox: true,
          fit: BoxFit.fill,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 78.9, start: 14.1),
        Pin(size: 125.7, end: 29.5),
        child: SvgPicture.string(
          _svg_aa0bz,
          allowDrawingOutsideViewBox: true,
          fit: BoxFit.fill,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, start: 14.0),
        Pin(size: 122.4, end: 105),
        child: SvgPicture.string(
          _svg_gxlwbj,
          allowDrawingOutsideViewBox: true,
          fit: BoxFit.fill,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, start: 39.0),
        Pin(size: 14.0, end: 197),
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
        Pin(size: 47.0, middle: 0.4164),
        Pin(size: 14.0, end: 197),
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
        Pin(size: 47.0, middle: 0.6975),
        Pin(size: 14.0, end: 197),
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
        Pin(size: 47.0, end: 6.0),
        Pin(size: 14.0, end: 197),
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
        Pin(size: 47.0, start: 39.0),
        Pin(size: 14.0, end: 77),
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
        Pin(size: 47.0, middle: 0.4164),
        Pin(size: 14.0, end: 77),
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
        Pin(size: 47.0, middle: 0.6975),
        Pin(size: 14.0, end: 77),
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
        Pin(size: 47.0, end: 6.0),
        Pin(size: 14.0, end: 77),
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
    ]),

    // ------------------------- 4 --------------------
    Stack(children: <Widget>[
      Pinned.fromPins(
        Pin(size: 78.9, end: 0.0),
        Pin(size: 125.7, end: 29.5),
        child: SvgPicture.string(
          _svg_ct53v6,
          allowDrawingOutsideViewBox: true,
          fit: BoxFit.fill,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, end: 0.0),
        Pin(size: 122.4, end: 105),
        child: SvgPicture.string(
          _svg_f2vz4y,
          allowDrawingOutsideViewBox: true,
          fit: BoxFit.fill,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 78.9, middle: 0.6868),
        Pin(size: 125.7, end: 29.5),
        child: SvgPicture.string(
          _svg_fn5nh9,
          allowDrawingOutsideViewBox: true,
          fit: BoxFit.fill,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, middle: 0.6868),
        Pin(size: 122.4, end: 105),
        child: SvgPicture.string(
          _svg_nn2c3,
          allowDrawingOutsideViewBox: true,
          fit: BoxFit.fill,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 78.9, middle: 0.3696),
        Pin(size: 125.7, end: 29.5),
        child: SvgPicture.string(
          _svg_aongdj,
          allowDrawingOutsideViewBox: true,
          fit: BoxFit.fill,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, middle: 0.3695),
        Pin(size: 122.4, end: 105),
        child: SvgPicture.string(
          _svg_dida0n,
          allowDrawingOutsideViewBox: true,
          fit: BoxFit.fill,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 78.9, start: 14.1),
        Pin(size: 125.7, end: 29.5),
        child: SvgPicture.string(
          _svg_aa0bz,
          allowDrawingOutsideViewBox: true,
          fit: BoxFit.fill,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, start: 14.0),
        Pin(size: 122.4, end: 105),
        child: SvgPicture.string(
          _svg_gxlwbj,
          allowDrawingOutsideViewBox: true,
          fit: BoxFit.fill,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, start: 39.0),
        Pin(size: 14.0, end: 197),
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
        Pin(size: 47.0, middle: 0.4164),
        Pin(size: 14.0, end: 197),
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
        Pin(size: 47.0, middle: 0.6975),
        Pin(size: 14.0, end: 197),
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
        Pin(size: 47.0, end: 6.0),
        Pin(size: 14.0, end: 197),
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
        Pin(size: 47.0, start: 39.0),
        Pin(size: 14.0, end: 77),
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
        Pin(size: 47.0, middle: 0.4164),
        Pin(size: 14.0, end: 77),
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
        Pin(size: 47.0, middle: 0.6975),
        Pin(size: 14.0, end: 77),
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
        Pin(size: 47.0, end: 6.0),
        Pin(size: 14.0, end: 77),
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
    ]),

    // ------------------ 5 -----------------------
    Stack(children: <Widget>[
      Pinned.fromPins(
        Pin(size: 78.9, end: 0.0),
        Pin(size: 125.7, end: 29.5),
        child: SvgPicture.string(
          _svg_ct53v6,
          allowDrawingOutsideViewBox: true,
          fit: BoxFit.fill,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, end: 0.0),
        Pin(size: 122.4, end: 105),
        child: SvgPicture.string(
          _svg_f2vz4y,
          allowDrawingOutsideViewBox: true,
          fit: BoxFit.fill,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 78.9, middle: 0.6868),
        Pin(size: 125.7, end: 29.5),
        child: SvgPicture.string(
          _svg_fn5nh9,
          allowDrawingOutsideViewBox: true,
          fit: BoxFit.fill,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, middle: 0.6868),
        Pin(size: 122.4, end: 105),
        child: SvgPicture.string(
          _svg_nn2c3,
          allowDrawingOutsideViewBox: true,
          fit: BoxFit.fill,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 78.9, middle: 0.3696),
        Pin(size: 125.7, end: 29.5),
        child: SvgPicture.string(
          _svg_aongdj,
          allowDrawingOutsideViewBox: true,
          fit: BoxFit.fill,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, middle: 0.3695),
        Pin(size: 122.4, end: 105),
        child: SvgPicture.string(
          _svg_dida0n,
          allowDrawingOutsideViewBox: true,
          fit: BoxFit.fill,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 78.9, start: 14.1),
        Pin(size: 125.7, end: 29.5),
        child: SvgPicture.string(
          _svg_aa0bz,
          allowDrawingOutsideViewBox: true,
          fit: BoxFit.fill,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 79.0, start: 14.0),
        Pin(size: 122.4, end: 105),
        child: SvgPicture.string(
          _svg_gxlwbj,
          allowDrawingOutsideViewBox: true,
          fit: BoxFit.fill,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 47.0, start: 39.0),
        Pin(size: 14.0, end: 197),
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
        Pin(size: 47.0, middle: 0.4164),
        Pin(size: 14.0, end: 197),
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
        Pin(size: 47.0, middle: 0.6975),
        Pin(size: 14.0, end: 197),
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
        Pin(size: 47.0, end: 6.0),
        Pin(size: 14.0, end: 197),
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
        Pin(size: 47.0, start: 39.0),
        Pin(size: 14.0, end: 77),
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
        Pin(size: 47.0, middle: 0.4164),
        Pin(size: 14.0, end: 77),
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
        Pin(size: 47.0, middle: 0.6975),
        Pin(size: 14.0, end: 77),
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
        Pin(size: 47.0, end: 6.0),
        Pin(size: 14.0, end: 77),
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
    ]),
  ];
}

const String _svg_jx3xp =
    '<svg viewBox="249.1 690.3 78.9 125.7" ><path transform="translate(-2194.24, 816.18)" d="M 2443.54541015625 -125.6716384887695 C 2443.5869140625 -123.7803497314453 2443.677490234375 -126.4785385131836 2443.54541015625 -125.6716384887695 C 2443.53173828125 -123.8471298217773 2443.54541015625 -124.5504608154297 2443.54541015625 -124.5504608154297 L 2443.980224609375 -0.175445556640625 C 2443.980224609375 -0.1754300594329834 2522.24072265625 -0.175445556640625 2522.24072265625 -0.175445556640625 L 2522.24072265625 -75.53519439697266 L 2483.88623046875 -75.53519439697266 L 2483.88623046875 -124.5504608154297 L 2443.29638671875 -124.5504608154297 L 2443.54541015625 -124.5504608154297 L 2443.54541015625 -125.6716384887695 Z" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_o73xbw =
    '<svg viewBox="249.0 618.1 79.0 122.4" ><path transform="translate(-2194.52, 743.73)" d="M 2522.52490234375 -3.299476623535156 C 2521.978515625 -27.48745727539062 2522.08837890625 -3.299476623535156 2522.08837890625 -3.299476623535156 L 2522.08837890625 -125.671630859375 C 2522.08837890625 -125.671630859375 2443.545166015625 -125.671630859375 2443.545166015625 -125.671630859375 L 2443.545166015625 -52.18785095214844 L 2484.196044921875 -52.18785095214844 L 2484.196044921875 -3.299476623535156 L 2522.52490234375 -3.299476623535156 Z" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ct53v6 =
    '<svg viewBox="249.1 690.3 78.9 125.7" ><path transform="translate(-2194.24, 816.18)" d="M 2443.54541015625 -125.6716384887695 C 2443.5869140625 -123.7803497314453 2443.677490234375 -126.4785385131836 2443.54541015625 -125.6716384887695 C 2443.53173828125 -123.8471298217773 2443.54541015625 -124.5504608154297 2443.54541015625 -124.5504608154297 L 2443.980224609375 -0.175445556640625 C 2443.980224609375 -0.1754300594329834 2522.24072265625 -0.175445556640625 2522.24072265625 -0.175445556640625 L 2522.24072265625 -75.53519439697266 L 2483.88623046875 -75.53519439697266 L 2483.88623046875 -124.5504608154297 L 2443.29638671875 -124.5504608154297 L 2443.54541015625 -124.5504608154297 L 2443.54541015625 -125.6716384887695 Z" fill="#d6fff0" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_f2vz4y =
    '<svg viewBox="249.0 618.1 79.0 122.4" ><path transform="translate(-2194.52, 743.73)" d="M 2522.52490234375 -3.299476623535156 C 2521.978515625 -27.48745727539062 2522.08837890625 -3.299476623535156 2522.08837890625 -3.299476623535156 L 2522.08837890625 -125.671630859375 C 2522.08837890625 -125.671630859375 2443.545166015625 -125.671630859375 2443.545166015625 -125.671630859375 L 2443.545166015625 -52.18785095214844 L 2484.196044921875 -52.18785095214844 L 2484.196044921875 -3.299476623535156 L 2522.52490234375 -3.299476623535156 Z" fill="#efecec" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ehjdeq =
    '<svg viewBox="171.1 690.3 78.9 125.7" ><path transform="translate(-2272.24, 816.18)" d="M 2443.54541015625 -125.6716384887695 C 2443.5869140625 -123.7803497314453 2443.677490234375 -126.4785385131836 2443.54541015625 -125.6716384887695 C 2443.53173828125 -123.8471298217773 2443.54541015625 -124.5504608154297 2443.54541015625 -124.5504608154297 L 2443.980224609375 -0.175445556640625 C 2443.980224609375 -0.1754300594329834 2522.24072265625 -0.175445556640625 2522.24072265625 -0.175445556640625 L 2522.24072265625 -75.53519439697266 L 2483.88623046875 -75.53519439697266 L 2483.88623046875 -124.5504608154297 L 2443.29638671875 -124.5504608154297 L 2443.54541015625 -124.5504608154297 L 2443.54541015625 -125.6716384887695 Z" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_i06p =
    '<svg viewBox="171.0 618.1 79.0 122.4" ><path transform="translate(-2272.52, 743.73)" d="M 2522.52490234375 -3.299476623535156 C 2521.978515625 -27.48745727539062 2522.08837890625 -3.299476623535156 2522.08837890625 -3.299476623535156 L 2522.08837890625 -125.671630859375 C 2522.08837890625 -125.671630859375 2443.545166015625 -125.671630859375 2443.545166015625 -125.671630859375 L 2443.545166015625 -52.18785095214844 L 2484.196044921875 -52.18785095214844 L 2484.196044921875 -3.299476623535156 L 2522.52490234375 -3.299476623535156 Z" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_fn5nh9 =
    '<svg viewBox="171.1 690.3 78.9 125.7" ><path transform="translate(-2272.24, 816.18)" d="M 2443.54541015625 -125.6716384887695 C 2443.5869140625 -123.7803497314453 2443.677490234375 -126.4785385131836 2443.54541015625 -125.6716384887695 C 2443.53173828125 -123.8471298217773 2443.54541015625 -124.5504608154297 2443.54541015625 -124.5504608154297 L 2443.980224609375 -0.175445556640625 C 2443.980224609375 -0.1754300594329834 2522.24072265625 -0.175445556640625 2522.24072265625 -0.175445556640625 L 2522.24072265625 -75.53519439697266 L 2483.88623046875 -75.53519439697266 L 2483.88623046875 -124.5504608154297 L 2443.29638671875 -124.5504608154297 L 2443.54541015625 -124.5504608154297 L 2443.54541015625 -125.6716384887695 Z" fill="#d6fff0" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_nn2c3 =
    '<svg viewBox="171.0 618.1 79.0 122.4" ><path transform="translate(-2272.52, 743.73)" d="M 2522.52490234375 -3.299476623535156 C 2521.978515625 -27.48745727539062 2522.08837890625 -3.299476623535156 2522.08837890625 -3.299476623535156 L 2522.08837890625 -125.671630859375 C 2522.08837890625 -125.671630859375 2443.545166015625 -125.671630859375 2443.545166015625 -125.671630859375 L 2443.545166015625 -52.18785095214844 L 2484.196044921875 -52.18785095214844 L 2484.196044921875 -3.299476623535156 L 2522.52490234375 -3.299476623535156 Z" fill="#efecec" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_iye8o =
    '<svg viewBox="92.1 690.3 78.9 125.7" ><path transform="translate(-2351.24, 816.18)" d="M 2443.54541015625 -125.6716384887695 C 2443.5869140625 -123.7803497314453 2443.677490234375 -126.4785385131836 2443.54541015625 -125.6716384887695 C 2443.53173828125 -123.8471298217773 2443.54541015625 -124.5504608154297 2443.54541015625 -124.5504608154297 L 2443.980224609375 -0.175445556640625 C 2443.980224609375 -0.1754300594329834 2522.24072265625 -0.175445556640625 2522.24072265625 -0.175445556640625 L 2522.24072265625 -75.53519439697266 L 2483.88623046875 -75.53519439697266 L 2483.88623046875 -124.5504608154297 L 2443.29638671875 -124.5504608154297 L 2443.54541015625 -124.5504608154297 L 2443.54541015625 -125.6716384887695 Z" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_lcdqx =
    '<svg viewBox="92.0 618.1 79.0 122.4" ><path transform="translate(-2351.52, 743.73)" d="M 2522.52490234375 -3.299476623535156 C 2521.978515625 -27.48745727539062 2522.08837890625 -3.299476623535156 2522.08837890625 -3.299476623535156 L 2522.08837890625 -125.671630859375 C 2522.08837890625 -125.671630859375 2443.545166015625 -125.671630859375 2443.545166015625 -125.671630859375 L 2443.545166015625 -52.18785095214844 L 2484.196044921875 -52.18785095214844 L 2484.196044921875 -3.299476623535156 L 2522.52490234375 -3.299476623535156 Z" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_aongdj =
    '<svg viewBox="92.1 690.3 78.9 125.7" ><path transform="translate(-2351.24, 816.18)" d="M 2443.54541015625 -125.6716384887695 C 2443.5869140625 -123.7803497314453 2443.677490234375 -126.4785385131836 2443.54541015625 -125.6716384887695 C 2443.53173828125 -123.8471298217773 2443.54541015625 -124.5504608154297 2443.54541015625 -124.5504608154297 L 2443.980224609375 -0.175445556640625 C 2443.980224609375 -0.1754300594329834 2522.24072265625 -0.175445556640625 2522.24072265625 -0.175445556640625 L 2522.24072265625 -75.53519439697266 L 2483.88623046875 -75.53519439697266 L 2483.88623046875 -124.5504608154297 L 2443.29638671875 -124.5504608154297 L 2443.54541015625 -124.5504608154297 L 2443.54541015625 -125.6716384887695 Z" fill="#d6fff0" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_dida0n =
    '<svg viewBox="92.0 618.1 79.0 122.4" ><path transform="translate(-2351.52, 743.73)" d="M 2522.52490234375 -3.299476623535156 C 2521.978515625 -27.48745727539062 2522.08837890625 -3.299476623535156 2522.08837890625 -3.299476623535156 L 2522.08837890625 -125.671630859375 C 2522.08837890625 -125.671630859375 2443.545166015625 -125.671630859375 2443.545166015625 -125.671630859375 L 2443.545166015625 -52.18785095214844 L 2484.196044921875 -52.18785095214844 L 2484.196044921875 -3.299476623535156 L 2522.52490234375 -3.299476623535156 Z" fill="#efecec" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_u8p0r6 =
    '<svg viewBox="14.1 690.3 78.9 125.7" ><path transform="translate(-2429.24, 816.18)" d="M 2443.54541015625 -125.6716384887695 C 2443.5869140625 -123.7803497314453 2443.677490234375 -126.4785385131836 2443.54541015625 -125.6716384887695 C 2443.53173828125 -123.8471298217773 2443.54541015625 -124.5504608154297 2443.54541015625 -124.5504608154297 L 2443.980224609375 -0.175445556640625 C 2443.980224609375 -0.1754300594329834 2522.24072265625 -0.175445556640625 2522.24072265625 -0.175445556640625 L 2522.24072265625 -75.53519439697266 L 2483.88623046875 -75.53519439697266 L 2483.88623046875 -124.5504608154297 L 2443.29638671875 -124.5504608154297 L 2443.54541015625 -124.5504608154297 L 2443.54541015625 -125.6716384887695 Z" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_plkc3n =
    '<svg viewBox="14.0 618.1 79.0 122.4" ><path transform="translate(-2429.52, 743.73)" d="M 2522.52490234375 -3.299476623535156 C 2521.978515625 -27.48745727539062 2522.08837890625 -3.299476623535156 2522.08837890625 -3.299476623535156 L 2522.08837890625 -125.671630859375 C 2522.08837890625 -125.671630859375 2443.545166015625 -125.671630859375 2443.545166015625 -125.671630859375 L 2443.545166015625 -52.18785095214844 L 2484.196044921875 -52.18785095214844 L 2484.196044921875 -3.299476623535156 L 2522.52490234375 -3.299476623535156 Z" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_aa0bz =
    '<svg viewBox="14.1 690.3 78.9 125.7" ><path transform="translate(-2429.24, 816.18)" d="M 2443.54541015625 -125.6716384887695 C 2443.5869140625 -123.7803497314453 2443.677490234375 -126.4785385131836 2443.54541015625 -125.6716384887695 C 2443.53173828125 -123.8471298217773 2443.54541015625 -124.5504608154297 2443.54541015625 -124.5504608154297 L 2443.980224609375 -0.175445556640625 C 2443.980224609375 -0.1754300594329834 2522.24072265625 -0.175445556640625 2522.24072265625 -0.175445556640625 L 2522.24072265625 -75.53519439697266 L 2483.88623046875 -75.53519439697266 L 2483.88623046875 -124.5504608154297 L 2443.29638671875 -124.5504608154297 L 2443.54541015625 -124.5504608154297 L 2443.54541015625 -125.6716384887695 Z" fill="#d6fff0" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_gxlwbj =
    '<svg viewBox="14.0 618.1 79.0 122.4" ><path transform="translate(-2429.52, 743.73)" d="M 2522.52490234375 -3.299476623535156 C 2521.978515625 -27.48745727539062 2522.08837890625 -3.299476623535156 2522.08837890625 -3.299476623535156 L 2522.08837890625 -125.671630859375 C 2522.08837890625 -125.671630859375 2443.545166015625 -125.671630859375 2443.545166015625 -125.671630859375 L 2443.545166015625 -52.18785095214844 L 2484.196044921875 -52.18785095214844 L 2484.196044921875 -3.299476623535156 L 2522.52490234375 -3.299476623535156 Z" fill="#efecec" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
