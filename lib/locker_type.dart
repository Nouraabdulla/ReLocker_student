import 'package:adobe_xd/pinned.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:relocker_sa/calc_pay_page.dart';
import 'package:relocker_sa/editblocksoptions.dart';
import 'package:relocker_sa/first.dart';
import 'package:relocker_sa/ground.dart';
import 'package:relocker_sa/profile.dart';
import 'package:relocker_sa/recommendations.dart';
import 'package:relocker_sa/widgets/howtoreserve.dart';

class locker_type extends StatefulWidget {
  final String? from;
  final String? option;
  locker_type({Key? key, this.from = '1', this.option = ""}) : super(key: key);

  @override
  State<locker_type> createState() => _locker_typeState();
}

String startdate1 = '';
String endDate1 = '';
String startdate2 = '';
String endDate2 = '';
String flour = "";

class _locker_typeState extends State<locker_type> {
  String floor = 'G';
  DateTime todayDate = DateFormat("yyyy-MM-dd")
      .parse(DateFormat('yyyy-MM-dd').format(DateTime.now()));

  getdata() async {
    final DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('semester')
        .doc("semester1")
        .get();
    startdate1 = doc['start'];
    endDate1 = doc['end'];
    final DocumentSnapshot doc2 = await FirebaseFirestore.instance
        .collection('semester')
        .doc("semester2")
        .get();
    startdate2 = doc['start'];
    endDate2 = doc['end'];
  }

  @override
  void initState() {
    getdata();
    // getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        backgroundColor: const Color(0xff88d8bb),
        title: Text("Choose type"),
        centerTitle: true,
        foregroundColor: Colors.black,
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: (widget.from == "2")
            ? <Widget>[]
            : <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.help_outline_outlined,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => howtoreserve()));
                  },
                )
              ],
      ),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(start: 26.0, end: 20.0),
            Pin(size: 259.9, middle: 0.1013),
            child: IconButton(
              icon: widget.from == "2"
                  ? Image.asset('assets/images/regularadmin.png')
                  : Image.asset('assets/images/regularstudent.png'),
              iconSize: 50,
              onPressed: () async {
                print('before');

                print(startdate1);
                print(endDate1);
//if it's the admin just move to next page
                if (widget.from == "2") {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ground(
                            from: widget.from,
                            option: widget.option,
                          )));
                } else {
//to know which semester dates to send
                  if (todayDate.isAfter(DateTime.parse(startdate1)) &&
                      todayDate.isBefore(DateTime.parse(endDate1))) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ground(
                              numberOfWeek: 0,
                              resId: '',
                              startDate: startdate1,
                              endDate: endDate1,
                              from: widget.from,
                            )));
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Container(
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30)),
                              child: AlertDialog(
                                  title: Text(
                                    //  "Do you want to get recommendation ?",
                                    " would you like to get recommendations to find the suitbale lockers?",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  ),
                                  actions: [
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 5,
                                      height:
                                          MediaQuery.of(context).size.width / 9,
                                      child: ElevatedButton(
                                          child: const Text(
                                            'Yes',
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
                                                        recommendations(
                                                          numberOfWeek: 0,
                                                          resId: "",
                                                          startDate: startdate1,
                                                          endDate: endDate1,
                                                          floor: floor,
                                                        )));
                                          }),
                                    ),
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 5,
                                      height:
                                          MediaQuery.of(context).size.width / 9,
                                      child: ElevatedButton(
                                        child: const Text(
                                          'No',
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
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    )
                                  ]));
                        });
                  } else if (
                      // todayDate.isAtSameMomentAs(DateTime.parse(startdate1)) &&
                      //  todayDate.isAtSameMomentAs(DateTime.parse(endDate1))
                      todayDate.isAfter(DateTime.parse(startdate2)) &&
                          todayDate.isBefore(DateTime.parse(endDate2))) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ground(
                              numberOfWeek: 0,
                              resId: "",
                              startDate: startdate2,
                              endDate: endDate2,
                            )));
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Container(
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30)),
                              child: AlertDialog(
                                  title: Text(
                                    //  "Do you want to get recommendation ?",
                                    " would you like to get recommendations to find the suitbale lockers?",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  ),
                                  actions: [
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 5,
                                      height:
                                          MediaQuery.of(context).size.width / 9,
                                      child: ElevatedButton(
                                          child: const Text(
                                            'Yes',
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
                                                        recommendations(
                                                          numberOfWeek: 0,
                                                          resId: "",
                                                          startDate: startdate1,
                                                          endDate: endDate1,
                                                          floor: floor,
                                                        )));
                                          }),
                                    ),
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 5,
                                      height:
                                          MediaQuery.of(context).size.width / 9,
                                      child: ElevatedButton(
                                        child: const Text(
                                          'No',
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
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    )
                                  ]));
                        });
                  } else {
                    const snackBar = SnackBar(
                      content:
                          Text('you can reserve during semester days only'),
                    );
// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    // print("you can't reserve in the holiday days");
                  }
                }
              },
            ),
          ),
          Pinned.fromPins(
            Pin(start: 26.0, end: 20.0),
            Pin(size: 259.0, middle: 0.8194),
            child: IconButton(
              icon: widget.from == "2"
                  ? Image.asset('assets/images/flexibleadmin.png')
                  : Image.asset('assets/images/flexiblestudent.png'),
              iconSize: 50,
              onPressed: () {
                if (widget.from == "2") {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => first(
                            from: widget.from,
                            option: widget.option,
                          )));
                } else {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CalcPayPage()));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_m594vh =
    '<svg viewBox="26.0 474.6 360.0 202.4" ><path transform="translate(33.92, 475.57)" d="M 12.00196170806885 -1 L 338.177490234375 0 C 344.9851684570312 0 351.1236267089844 3.603014707565308 351.1236267089844 10.80634212493896 C 351.1236267089844 29.03702163696289 353.2195129394531 149.5723724365234 351.1709899902344 157.4482421875 C 349.1126098632812 165.3650817871094 341.8846740722656 163.1313018798828 339.7082214355469 167.9017791748047 C 333.5091552734375 181.4893035888672 301.0628967285156 195.3973693847656 301.0628967285156 195.3973693847656 C 301.0628967285156 195.3973693847656 283.1604614257812 196.84716796875 276.8845825195312 193.7494354248047 C 272.9526672363281 191.8074340820312 270.60595703125 189.7754058837891 266.2066040039062 189.4551849365234 C 263.1054992675781 189.2294769287109 251.8141479492188 181.8600311279297 251.8141479492188 181.8600311279297 C 251.8141479492188 181.8600311279297 247.651123046875 178.5450744628906 247.6493682861328 178.3977661132812 C 247.6507110595703 178.4992980957031 246.275146484375 165.1620941162109 241.3806304931641 164.7122802734375 C 214.9702453613281 162.2851715087891 199.8208465576172 163.2792816162109 163.6211700439453 153.8042907714844 C 159.9329223632812 152.8389434814453 89.00518798828125 193.5971221923828 85.13443756103516 192.4803924560547 C 80.16436004638672 191.0465698242188 71.35356140136719 202.9493103027344 66.24143218994141 201.266357421875 C 62.25278854370117 199.9532775878906 46.4661865234375 201.266357421875 46.4661865234375 201.266357421875 C 46.4661865234375 201.266357421875 25.23797035217285 201.4620056152344 20.7867374420166 197.1873779296875 C 14.13136959075928 190.7965240478516 7.132230281829834 190.4849853515625 3.316667318344116 181.1378326416016 C 1.868768930435181 177.5914154052734 -1.675714015960693 177.9519958496094 -4.008596897125244 175.4569549560547 C -5.452028274536133 173.9178314208984 -5.817523956298828 169.7219085693359 -6.430967330932617 166.2920074462891 C -9.57651424407959 148.7069091796875 -6.79194974899292 128.1819305419922 -6.430967330932617 105.9435501098633 C -5.881388664245605 72.08010864257812 -6.333296775817871 35.91444778442383 -6.430967330932617 13.10630989074707 C -6.430967330932617 5.902982711791992 5.194277763366699 -1 12.00196170806885 -1 Z" fill="#bff1e1" stroke="#bff1e1" stroke-width="1" stroke-miterlimit="4" stroke-linecap="round" /></svg>';
const String _svg_gg2hjs =
    '<svg viewBox="26.0 637.2 115.8 43.8" ><path transform="translate(28.92, 603.29)" d="M 51.65446853637695 73.06098175048828 C 81.41605377197266 73.06098175048828 112.8790969848633 18.29922103881836 112.8790969848633 38.32383346557617 C 112.8790969848633 58.34846115112305 81.41605377197266 77.76737213134766 51.65446853637695 77.76737213134766 C 21.89287567138672 77.76737213134766 -2.915710687637329 60.56713485717773 -2.915710687637329 40.54252243041992 C -2.915710687637329 20.51791000366211 21.89287567138672 73.06098175048828 51.65446853637695 73.06098175048828 Z" fill="#bff1e1" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_e6hexj =
    '<svg viewBox="100.6 620.9 184.9 56.1" ><path transform="matrix(-0.999848, 0.017452, -0.017452, -0.999848, 285.52, 673.79)" d="M 84.23089599609375 38.79569625854492 C 119.9197616577148 38.79569625854492 171.8404083251953 -1.132480621337891 183.7767639160156 0.02466011047363281 C 185.880615234375 0.2180709838867188 172.0393524169922 12.4169807434082 172.0393524169922 15.84323120117188 C 172.0393524169922 35.64815902709961 122.2819366455078 52.85075759887695 79.12733459472656 52.85075759887695 C 35.97270202636719 52.85075759887695 -4.973693292378118e-16 35.83922958374023 -2.225209021391842e-16 16.0343132019043 C 5.232755142922294e-17 -3.770605087280273 41.07626342773438 38.79569625854492 84.23089599609375 38.79569625854492 Z" fill="#bff1e1" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_oerk2s =
    '<svg viewBox="254.0 628.3 132.0 45.4" ><path transform="translate(256.92, 594.37)" d="M 59.28295516967773 74.41484832763672 C 93.20497894287109 74.41484832763672 129.0662994384766 17.75890159606934 129.0662994384766 38.47615814208984 C 129.0662994384766 59.19342803955078 93.20497894287109 79.28403472900391 59.28295516967773 79.28403472900391 C 25.36091995239258 79.28403472900391 -2.915709972381592 61.48884963989258 -2.915709972381592 40.77159118652344 C -2.915709972381592 20.05433464050293 25.36091995239258 74.41484832763672 59.28295516967773 74.41484832763672 Z" fill="#bff1e1" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
