import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:adobe_xd/blend_mask.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:relocker_sa/payment_view/reservation_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class lockerset1_gy extends StatefulWidget {
  final int numberOfWeek;
  lockerset1_gy({Key? key, required this.numberOfWeek}) : super(key: key);

  @override
  State<lockerset1_gy> createState() => _lockerset1_gyState();
}

class _lockerset1_gyState extends State<lockerset1_gy> {
  String mySvg1(color) {
    return '<svg viewBox="249.0 618.1 79.0 122.4" ><path transform="translate(-2194.52, 743.73)" d="M 2522.52490234375 -3.299476623535156 C 2521.978515625 -27.48745727539062 2522.08837890625 -3.299476623535156 2522.08837890625 -3.299476623535156 L 2522.08837890625 -125.671630859375 C 2522.08837890625 -125.671630859375 2443.545166015625 -125.671630859375 2443.545166015625 -125.671630859375 L 2443.545166015625 -52.18785095214844 L 2484.196044921875 -52.18785095214844 L 2484.196044921875 -3.299476623535156 L 2522.52490234375 -3.299476623535156 Z" fill="#$color" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
  }

  String mySvg2(color) {
    return '<svg viewBox="249.1 690.3 78.9 125.7" ><path transform="translate(-2194.24, 816.18)" d="M 2443.54541015625 -125.6716384887695 C 2443.5869140625 -123.7803497314453 2443.677490234375 -126.4785385131836 2443.54541015625 -125.6716384887695 C 2443.53173828125 -123.8471298217773 2443.54541015625 -124.5504608154297 2443.54541015625 -124.5504608154297 L 2443.980224609375 -0.175445556640625 C 2443.980224609375 -0.1754300594329834 2522.24072265625 -0.175445556640625 2522.24072265625 -0.175445556640625 L 2522.24072265625 -75.53519439697266 L 2483.88623046875 -75.53519439697266 L 2483.88623046875 -124.5504608154297 L 2443.29638671875 -124.5504608154297 L 2443.54541015625 -124.5504608154297 L 2443.54541015625 -125.6716384887695 Z" fill="#$color" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
  }

  showLocker(context, text, size) {
    //display lockers
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
                  // Container(
                  //   width: 80.0,
                  //   height: 200,
                  //   child: Stack(
                  //     children: [
                  //       Positioned(
                  //         top: 0,
                  //         child: Container(
                  //           child: SvgPicture.string(
                  //             _svg_f2vz4y,
                  //             allowDrawingOutsideViewBox: true,
                  //             fit: BoxFit.fill,
                  //           ),
                  //         ),
                  //       ),
                  //       Positioned(
                  //         bottom: 0,
                  //         child: Container(
                  //             child: SvgPicture.string(
                  //           _svg_ct53v6,
                  //           allowDrawingOutsideViewBox: true,
                  //           fit: BoxFit.fill,
                  //         )),
                  //       )
                  //     ],
                  //   ),
                  // ),

                  Expanded(
                    //display lockers
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('lockers')
                          .where("block", isEqualTo: text)
                          .orderBy("name")
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
                          child: size == "s"
                              ? GridView.builder(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.all(16.0),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 4,
                                          childAspectRatio: 3 / 4),
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
                                                    print(fslp *
                                                        widget.numberOfWeek);
                                                  } else {
                                                    print(fllp *
                                                        widget.numberOfWeek);
                                                  }
                                                }
                                              }
                                            : () {},
                                        child: GestureDetector(
                                            onTap: () {
                                              //print('hi');
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ReservationDetails()));
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                  color: data['available']
                                                      ? Colors.green.shade300
                                                      : Colors.grey,
                                                  border: Border.all(
                                                      width: 1,
                                                      color: Colors.grey)),
                                              child: Text("${data['name']}"),
                                            )));
                                  },
                                )
                              : GridView.builder(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.all(16.0),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 4,
                                          childAspectRatio: 1 / 2.20),
                                  itemCount:
                                      (snapshot.data!.docs.length ~/ 2).toInt(),
                                  itemBuilder: (context, index) {
                                    Map<String, dynamic> data1 =
                                        snapshot.data!.docs[index * 2].data()!
                                            as Map<String, dynamic>;
                                    Map<String, dynamic> data2 = snapshot
                                        .data!.docs[index * 2 + 1]
                                        .data()! as Map<String, dynamic>;
                                    return Container(
                                      width: 80.0,
                                      height: 200,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            top: 0,
                                            child: GestureDetector(
                                              onTap: data1['available']
                                                  ? () {
                                                      var rslp = 125;
                                                      var rllp = 150;
                                                      var fslp = 15;
                                                      var fllp = 25;
                                                      print(data1);

                                                      var locker_type =
                                                          data1['type'];
                                                      var locker_size =
                                                          data1['size'];

                                                      if (locker_type == "r") {
                                                        if (locker_size ==
                                                            "s") {
                                                          print(rslp);
                                                        } else {
                                                          print(rllp);
                                                        }
                                                      } else {
                                                        if (locker_size ==
                                                            "s") {
                                                          print(fslp *
                                                              widget
                                                                  .numberOfWeek);
                                                        } else {
                                                          print(fllp *
                                                              widget
                                                                  .numberOfWeek);
                                                        }
                                                      }
                                                    }
                                                  : () {},
                                              child: GestureDetector(
                                                  onTap: () {
                                                    //print('hi');
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                ReservationDetails()));
                                                  },
                                                  child: Container(
                                                    child: Stack(
                                                      children: [
                                                        SvgPicture.string(
                                                          mySvg1(
                                                              data1["available"]
                                                                  ? "ff0000"
                                                                  : "fafafa"),
                                                          allowDrawingOutsideViewBox:
                                                              true,
                                                          fit: BoxFit.fill,
                                                        ),
                                                        Text(
                                                          "${data1['name']}",
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              color:
                                                                  Colors.black),
                                                        )
                                                      ],
                                                    ),
                                                  )),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 0,
                                            child: GestureDetector(
                                              onTap: data2['available']
                                                  ? () {
                                                      var rslp = 125;
                                                      var rllp = 150;
                                                      var fslp = 15;
                                                      var fllp = 25;
                                                      print(data2);

                                                      var locker_type =
                                                          data2['type'];
                                                      var locker_size =
                                                          data2['size'];

                                                      if (locker_type == "r") {
                                                        if (locker_size ==
                                                            "s") {
                                                          print(rslp);
                                                        } else {
                                                          print(rllp);
                                                        }
                                                      } else {
                                                        if (locker_size ==
                                                            "s") {
                                                          print(fslp *
                                                              widget
                                                                  .numberOfWeek);
                                                        } else {
                                                          print(fllp *
                                                              widget
                                                                  .numberOfWeek);
                                                        }
                                                      }
                                                    }
                                                  : () {},
                                              child: GestureDetector(
                                                  onTap: () {
                                                    //print('hi');
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                ReservationDetails()));
                                                  },
                                                  child: Container(
                                                      child: Stack(
                                                    children: [
                                                      SvgPicture.string(
                                                        mySvg2(
                                                            data2["available"]
                                                                ? 'ff0000'
                                                                : "fafafa"),
                                                        allowDrawingOutsideViewBox:
                                                            true,
                                                        fit: BoxFit.fill,
                                                      ),
                                                      Positioned(
                                                        bottom: 50,
                                                        child: Text(
                                                          "${data2['name']}",
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      )
                                                    ],
                                                  ))),
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  }),
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
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(size: 125.0, middle: 0.5261),
            Pin(size: 21.0, start: 35.0),
            child: Text(
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
          ),
          Pinned.fromPins(
            Pin(start: 0.0, end: -16.0),
            Pin(size: 80.0, start: 0.0),
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
                      // ------------------- map -------------------------
                      Pinned.fromPins(
                        Pin(size: 18.0, middle: 0.5794),
                        Pin(size: 24.0, start: 123), // lockr12

                        child: GestureDetector(
                          onTap: () {
                            showLocker(context, "gy12", "s");
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
                        Pin(size: 18.0, start: 61),
                        Pin(size: 24.0, start: 301), // lockr 7
                        child: Transform.rotate(
                          angle: 1.5708,
                          child: GestureDetector(
                            onTap: () {
                              showLocker(context, "gy7", "s");
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
                        Pin(size: 18.0, start: 37.1),
                        Pin(size: 24.0, start: 301), // lockr6
                        child: Transform.rotate(
                          angle: 1.5708,
                          child: GestureDetector(
                            onTap: () {
                              showLocker(context, "gy6", "s");
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
                        Pin(size: 18.0, middle: 0.5794),
                        Pin(size: 24.0, start: 100), // lockr13

                        child: GestureDetector(
                          onTap: () {
                            showLocker(context, "gy13", "s");
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
                        Pin(size: 152.7, start: 24.1),
                        Pin(size: 218.1, start: 86), // middle area
                        child: Transform.rotate(
                          angle: 3.1416,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xfffcc425),
                              border: Border.all(
                                  width: 0.5, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 53.0, start: 44.3),
                        Pin(size: 16.0, start: 150), // 6G02
                        child: Text(
                          '6G02',
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
                        Pin(size: 53.0, start: 39.9),
                        Pin(size: 16.0, start: 100), // 6G01
                        child: Text(
                          '6G01',
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
                        Pin(size: 96.8, start: 24.1),
                        Pin(size: 74.9, start: 328), // 6G03 class
                        child: Transform.rotate(
                          angle: 3.1416,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xfffcc51f),
                              border: Border.all(
                                  width: 0.5, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 53.0, start: 43.1),
                        Pin(size: 16.0, start: 360), // 6G03
                        child: Text(
                          '6G03',
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
                        Pin(size: 47.1, start: 24.3),
                        Pin(size: 27.4, start: 186), // stairs base
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffe4e4e4),
                            border: Border.all(
                                width: 0.3, color: const Color(0xff1c0000)),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, start: 49.0),
                        Pin(size: 27.1, start: 186), // stairs line
                        child: SvgPicture.string(
                          _svg_keikg,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, start: 44.3),
                        Pin(size: 27.1, start: 186), // stairs line
                        child: SvgPicture.string(
                          _svg_xhp1c,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, start: 39.6),
                        Pin(size: 27.1, start: 186), // stairs line
                        child: SvgPicture.string(
                          _svg_bj8reo,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, start: 34.9),
                        Pin(size: 27.1, start: 186), // stairs line
                        child: SvgPicture.string(
                          _svg_dwbxvk,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 1.0, start: 26.8),
                        Pin(size: 27.1, start: 186), // stairs line
                        child: SvgPicture.string(
                          _svg_dw3n40,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 68.1, end: 39.4),
                        Pin(size: 59.5, start: 222), // 6g06 class
                        child: Transform.rotate(
                          angle: 3.1416,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xfffcc425),
                              border: Border.all(
                                  width: 0.5, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 68.1, end: 39.4),
                        Pin(size: 63.0, start: 160), // 6g07 class
                        child: Transform.rotate(
                          angle: 3.1416,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xfffcc425),
                              border: Border.all(
                                  width: 0.5, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 68.1, end: 39.4),
                        Pin(size: 24.7, start: 136), // exit
                        child: Transform.rotate(
                          angle: 3.1416,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xff7dd871),
                              border: Border.all(
                                  width: 0.5, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 68.1, end: 39.4),
                        Pin(size: 64.7, start: 72), // 6g09 class
                        child: Transform.rotate(
                          angle: 3.1416,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xfffcc425),
                              border: Border.all(
                                  width: 0.5, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 68.1, end: 39.4),
                        Pin(size: 64.3, start: 8.3), // 6g11 class
                        child: Transform.rotate(
                          angle: 3.1416,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xfffcc425),
                              border: Border.all(
                                  width: 0.5, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 65.0, end: 39.1),
                        Pin(size: 16.0, start: 32.5), // 6G11
                        child: Text(
                          '6G11',
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
                        Pin(size: 65.0, end: 41.0),
                        Pin(size: 16.0, start: 100), // 6G09
                        child: Text(
                          '6G09',
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
                        Pin(size: 65.0, end: 39.9),
                        Pin(size: 16.0, start: 185), // 6G07
                        child: Text(
                          '6G07',
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
                        Pin(size: 65.0, end: 39.9),
                        Pin(size: 16.0, start: 245), // 6G06
                        child: Text(
                          '6G06',
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
                        Pin(size: 42.0, middle: 0.817),
                        Pin(size: 14.0, start: 142), // Exit
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
                        Pin(size: 68.1, end: 39.4),
                        Pin(size: 29.3, start: 281), // empty class
                        child: Transform.rotate(
                          angle: 3.1416,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xfffcc425),
                              border: Border.all(
                                  width: 0.5, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 68.1, end: 39.4),
                        Pin(size: 93.1, start: 310), //6G05 class
                        child: Transform.rotate(
                          angle: 3.1416,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xfffcc425),
                              border: Border.all(
                                  width: 0.5, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 65.0, end: 39.1),
                        Pin(size: 16.0, start: 350), //6G05
                        child: Text(
                          '6G05',
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
                        Pin(size: 55.4, middle: 0.4515),
                        Pin(size: 78.6, start: 8.3), //6G10 class
                        child: Transform.rotate(
                          angle: 3.1416,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xfffcc425),
                              border: Border.all(
                                  width: 0.5, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 53.0, middle: 0.4582),
                        Pin(size: 16.0, start: 45.0), //6G10
                        child: Text(
                          '6G10',
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
                        Pin(size: 94.7, middle: 0.5291),
                        Pin(size: 75.1, start: 328), // 6G04 calss
                        child: Transform.rotate(
                          angle: 3.1416,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xfffcc51f),
                              border: Border.all(
                                  width: 0.5, color: const Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 62.6, middle: 0.4364),
                        Pin(size: 57.7, start: 87), //grey box
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
                        Pin(size: 53.0, middle: 0.5195),
                        Pin(size: 16.0, start: 360), //6G04
                        child: Text(
                          '6G04',
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
                        Pin(size: 18.0, middle: 0.2764),
                        Pin(size: 24.0, start: 301), // locker8
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
                        Pin(size: 18.0, middle: 0.3747),
                        Pin(size: 24.0, start: 301), // locker9
                        child: Transform.rotate(
                          angle: 1.5708,
                          child: GestureDetector(
                            onTap: () {
                              showLocker(context, "gy9", "s");
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
                        Pin(size: 18.0, middle: 0.1729),
                        Pin(size: 24.0, start: 256), // locker4

                        child: GestureDetector(
                          onTap: () {
                            showLocker(context, "gy4", "s");
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
                        Pin(size: 18.0, middle: 0.1729),
                        Pin(size: 24.0, start: 232), // locker3
                        child: GestureDetector(
                          onTap: () {
                            showLocker(context, "gy3", "s");
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
                        Pin(size: 18.0, start: 50.4),
                        Pin(size: 24.0, start: 210), //locker2
                        child: Transform.rotate(
                          angle: 1.5708,
                          child: GestureDetector(
                            onTap: () {
                              showLocker(context, "gy2", "s");
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
                        Pin(size: 18.0, start: 27.3),
                        Pin(size: 24.0, start: 210), // locker1
                        child: Transform.rotate(
                          angle: 1.5708,
                          child: GestureDetector(
                            onTap: () {
                              showLocker(context, "gy1", "s");
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
                        Pin(size: 18.0, middle: 0.5794),
                        Pin(size: 24.0, start: 177), // locker 10

                        child: GestureDetector(
                          onTap: () {
                            showLocker(context, "gy10", "s");
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
                        Pin(size: 18.0, middle: 0.5794),
                        Pin(size: 24.0, start: 155), // locker11

                        child: GestureDetector(
                          onTap: () {
                            showLocker(context, "gy11", "s");
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
                        Pin(size: 18.0, middle: 0.1732),
                        Pin(size: 24.0, start: 280), // locker under stairs 5

                        child: GestureDetector(
                          onTap: () {
                            showLocker(context, "gy5", "s");
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
                        Pin(size: 1.0, start: 30.9),
                        Pin(size: 27.1, start: 186), // stairs line
                        child: SvgPicture.string(
                          _svg_j0qngg,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 0.5, middle: 0.2202),
                        Pin(size: 119.0, start: 186), // behind lockers line
                        child: SvgPicture.string(
                          _svg_xekqzk,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),

                      // -------------------------- lockers set -------------------
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

    //--------------------- 5 -------------------------

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

    //------------------------ 6 --------------------

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

    // ------------------------ 7 ------------------------

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

    // ------------------------- 8 --------------------
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

    // ------------------ 9 -----------------------
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

    // ----------------------- 10 -------------------------
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

    // ----------------------- 11 ---------------------
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

    // ---------------------- 12 --------------------
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

    //------------------------------ 13 -------------------------
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

const String _svg_keikg =
    '<svg viewBox="49.0 266.8 1.0 27.1" ><path transform="translate(49.0, 266.84)" d="M 0 0 L 0 27.1439208984375" fill="none" stroke="#1c0000" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_xhp1c =
    '<svg viewBox="44.3 266.8 1.0 27.1" ><path transform="translate(44.3, 266.84)" d="M 0 0 L 0 27.1439208984375" fill="none" stroke="#1c0000" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_bj8reo =
    '<svg viewBox="39.6 266.8 1.0 27.1" ><path transform="translate(39.6, 266.84)" d="M 0 0 L 0 27.1439208984375" fill="none" stroke="#1c0000" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_dwbxvk =
    '<svg viewBox="34.9 266.8 1.0 27.1" ><path transform="translate(34.9, 266.84)" d="M 0 0 L 0 27.1439208984375" fill="none" stroke="#1c0000" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_dw3n40 =
    '<svg viewBox="26.8 266.8 1.0 27.1" ><path transform="translate(26.8, 266.84)" d="M 0 0 L 0 27.1439208984375" fill="none" stroke="#1c0000" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_j0qngg =
    '<svg viewBox="30.9 266.8 1.0 27.1" ><path transform="translate(30.9, 266.84)" d="M 0 0 L 0 27.1439208984375" fill="none" stroke="#1c0000" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_xekqzk =
    '<svg viewBox="70.9 266.5 1.0 119.0" ><path transform="translate(70.91, 266.5)" d="M 0 0 L 0 119" fill="none" stroke="#1c0000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';

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
const String _svg_co67m9 =
    '<svg viewBox="241.0 277.5 26.7 1.0" ><path transform="translate(241.0, 277.55)" d="M 0 0 L 26.705078125 0" fill="none" stroke="#000000" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_zan6zu =
    '<svg viewBox="241.0 279.1 26.7 1.0" ><path transform="translate(241.0, 279.09)" d="M 0 0 L 26.705078125 0" fill="none" stroke="#000000" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_so97s =
    '<svg viewBox="241.0 276.0 27.0 1.0" ><path transform="translate(241.0, 276.0)" d="M 0 0 L 27 0" fill="none" stroke="#000000" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_qs7urw =
    '<svg viewBox="271.4 253.6 1.0 20.3" ><path transform="translate(271.4, 253.62)" d="M 0 0 L 0 20.299560546875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_g77jpq =
    '<svg viewBox="275.2 253.6 1.0 20.3" ><path transform="translate(275.17, 253.62)" d="M 0 0 L 0 20.299560546875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_o0dmv =
    '<svg viewBox="279.6 253.6 1.0 20.3" ><path transform="translate(279.63, 253.62)" d="M 0 0 L 0 20.299560546875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_y4j9qf =
    '<svg viewBox="283.7 253.6 1.0 20.3" ><path transform="translate(283.75, 253.62)" d="M 0 0 L 0 20.299560546875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_vj2m0f =
    '<svg viewBox="291.3 253.6 1.0 20.3" ><path transform="translate(291.31, 253.62)" d="M 0 0 L 0 20.299560546875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_m9naz7 =
    '<svg viewBox="294.3 253.6 1.0 20.3" ><path transform="translate(294.28, 253.62)" d="M 0 0 L 0 20.299560546875" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ecu =
    '<svg viewBox="271.4 254.3 1.0 20.2" ><path transform="translate(271.4, 254.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ea22zy =
    '<svg viewBox="275.2 254.3 1.0 20.2" ><path transform="translate(275.17, 254.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_xp5 =
    '<svg viewBox="279.6 254.3 1.0 20.2" ><path transform="translate(279.63, 254.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_rm3jvr =
    '<svg viewBox="283.7 254.3 1.0 20.2" ><path transform="translate(283.75, 254.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_fjj2mn =
    '<svg viewBox="291.3 254.3 1.0 20.2" ><path transform="translate(291.31, 254.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_g90z =
    '<svg viewBox="294.3 254.3 1.0 20.2" ><path transform="translate(294.28, 254.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_haivz2 =
    '<svg viewBox="298.3 254.7 1.0 20.2" ><path transform="translate(298.28, 254.68)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_nb5hd2 =
    '<svg viewBox="301.0 254.7 1.0 20.2" ><path transform="translate(300.99, 254.68)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_h9pi =
    '<svg viewBox="288.1 254.3 1.0 20.2" ><path transform="translate(288.12, 254.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_vn1f2 =
    '<svg viewBox="271.4 280.3 1.0 20.2" ><path transform="translate(271.4, 280.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_aemh0 =
    '<svg viewBox="275.2 280.3 1.0 20.2" ><path transform="translate(275.17, 280.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_gerrt =
    '<svg viewBox="279.6 280.3 1.0 20.2" ><path transform="translate(279.63, 280.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_c1muet =
    '<svg viewBox="283.7 280.3 1.0 20.2" ><path transform="translate(283.75, 280.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_v3zs3l =
    '<svg viewBox="291.3 280.3 1.0 20.2" ><path transform="translate(291.31, 280.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_d0gfz =
    '<svg viewBox="294.3 280.3 1.0 20.2" ><path transform="translate(294.28, 280.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_wuzlg0 =
    '<svg viewBox="298.3 280.7 1.0 20.2" ><path transform="translate(298.28, 280.68)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_w5hv54 =
    '<svg viewBox="301.0 280.7 1.0 20.2" ><path transform="translate(300.99, 280.68)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ezfrg =
    '<svg viewBox="288.1 280.3 1.0 20.2" ><path transform="translate(288.12, 280.29)" d="M 0 0 L 0 20.24072265625" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ndxdyq =
    '<svg viewBox="186.5 445.0 1.0 26.7" ><path transform="matrix(0.0, 1.0, -1.0, 0.0, 186.45, 445.0)" d="M 0 0 L 26.705078125 0" fill="none" stroke="#000000" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_inin3v =
    '<svg viewBox="184.9 445.0 1.0 26.7" ><path transform="matrix(0.0, 1.0, -1.0, 0.0, 184.91, 445.0)" d="M 0 0 L 26.705078125 0" fill="none" stroke="#000000" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_if9bag =
    '<svg viewBox="188.0 445.0 1.0 27.0" ><path transform="matrix(0.0, 1.0, -1.0, 0.0, 188.0, 445.0)" d="M 0 0 L 27 0" fill="none" stroke="#000000" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_pa14i =
    '<svg viewBox="190.6 477.2 22.4 1.0" ><path transform="translate(190.61, 477.17)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_e9l6 =
    '<svg viewBox="190.6 473.0 22.4 1.0" ><path transform="translate(190.61, 472.98)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_feiliz =
    '<svg viewBox="190.6 481.4 22.4 1.0" ><path transform="translate(190.61, 481.36)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_sohgwp =
    '<svg viewBox="190.6 489.5 22.4 1.0" ><path transform="translate(190.61, 489.55)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_yxplo =
    '<svg viewBox="190.6 468.8 22.4 1.0" ><path transform="translate(190.61, 468.79)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_x33p3l =
    '<svg viewBox="190.6 493.7 22.4 1.0" ><path transform="translate(190.61, 493.73)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_b2nwt4 =
    '<svg viewBox="190.6 500.5 22.4 1.0" ><path transform="translate(190.61, 500.45)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_unqi3 =
    '<svg viewBox="190.6 503.9 22.4 1.0" ><path transform="translate(190.61, 503.91)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_fdv8qi =
    '<svg viewBox="190.3 497.0 22.4 1.0" ><path transform="translate(190.32, 496.99)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_n6gj =
    '<svg viewBox="190.6 485.4 22.4 1.0" ><path transform="translate(190.61, 485.36)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_o6swbu =
    '<svg viewBox="161.6 477.2 22.4 1.0" ><path transform="translate(161.61, 477.17)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_jg4lm6 =
    '<svg viewBox="161.6 473.0 22.4 1.0" ><path transform="translate(161.61, 472.98)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_z52l8t =
    '<svg viewBox="161.6 481.4 22.4 1.0" ><path transform="translate(161.61, 481.36)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_ylpd =
    '<svg viewBox="161.6 489.5 22.4 1.0" ><path transform="translate(161.61, 489.55)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_cil5lo =
    '<svg viewBox="161.6 468.8 22.4 1.0" ><path transform="translate(161.61, 468.79)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_clktw9 =
    '<svg viewBox="161.6 493.7 22.4 1.0" ><path transform="translate(161.61, 493.73)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_euye8 =
    '<svg viewBox="161.6 500.5 22.4 1.0" ><path transform="translate(161.61, 500.45)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_bmv4p9 =
    '<svg viewBox="161.6 503.9 22.4 1.0" ><path transform="translate(161.61, 503.91)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_z5py1a =
    '<svg viewBox="161.3 497.0 22.4 1.0" ><path transform="translate(161.32, 496.99)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_kp61nv =
    '<svg viewBox="161.6 485.4 22.4 1.0" ><path transform="translate(161.61, 485.36)" d="M 0 0 L 22.3857421875 0" fill="none" stroke="#000000" stroke-width="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
