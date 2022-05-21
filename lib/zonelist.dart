import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:relocker_sa/lockerset1_fg.dart';
import 'package:relocker_sa/lockerset1_fp.dart';
import 'package:relocker_sa/lockerset1_gg.dart';
import 'package:relocker_sa/lockerset1_go.dart';
import 'package:relocker_sa/lockerset1_gp.dart';
import 'package:relocker_sa/lockerset1_gy.dart';
import 'package:relocker_sa/recommendations.dart';

class zones_list extends StatefulWidget {
  final int? numberOfWeek;
  final String resId;
  final String startDate;
  final String endDate;
  final String floor;
  const zones_list(
      {Key? key,
      this.floor = '',
      this.numberOfWeek,
      this.resId = '',
      this.startDate = '',
      this.endDate = ''})
      : super(key: key);
  @override
  _zones_list createState() => _zones_list();
}

class _zones_list extends State<zones_list> {
  void sorting() {
    setState(() {
      number.sort((b, a) => a.compareTo(b));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color(0xff88d8bb),
          title: Text("Sorted zones"),
          centerTitle: true,
          foregroundColor: Colors.black,
          leading: IconButton(
              color: Colors.black,
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('recommendations')
                .orderBy('counter', descending: true)
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView(
                scrollDirection: Axis.vertical,
                children: snapshot.data!.docs.map((document) {
                  return Column(children: <Widget>[
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withAlpha(100),
                                blurRadius: 10.0),
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 15),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      '' + document['text'].toString(),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    if (widget.floor == 'F') ...[
                                      if (document['zone'] == 'f3') ...[
                                        IconButton(
                                            icon: Image.asset(
                                              'assets/images/green.jpeg',
                                              fit: BoxFit.cover,
                                              scale: 0.6,
                                            ),
                                            iconSize: 300,
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pushReplacement(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              lockerset1_fg(
                                                                numberOfWeek: widget
                                                                    .numberOfWeek!,
                                                                resId: widget
                                                                    .resId,
                                                                startDate: widget
                                                                    .startDate,
                                                                endDate: widget
                                                                    .endDate,
                                                              )));
                                            })
                                      ] else ...[
                                        if (document['zone'] == 'f4') ...[
                                          IconButton(
                                            icon: Image.asset(
                                              'assets/images/purple.jpeg',
                                              fit: BoxFit.cover,
                                              scale: 0.6,
                                            ),
                                            iconSize: 300,
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pushReplacement(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              lockerset1_fp(
                                                                numberOfWeek: widget
                                                                    .numberOfWeek!,
                                                                resId: widget
                                                                    .resId,
                                                                startDate: widget
                                                                    .startDate,
                                                                endDate: widget
                                                                    .endDate,
                                                              )));
                                            },
                                          )
                                        ] else ...[
                                          if (document['zone'] == 'f2') ...[
                                            IconButton(
                                              icon: Image.asset(
                                                'assets/images/orange.jpeg',
                                                fit: BoxFit.cover,
                                                scale: 0.6,
                                              ),
                                              iconSize: 300,
                                              onPressed: () {},
                                            )
                                          ] else ...[
                                            if (document['zone'] == 'f1') ...[
                                              IconButton(
                                                icon: Image.asset(
                                                  'assets/images/yellow.jpeg',
                                                  fit: BoxFit.cover,
                                                  scale: 0.6,
                                                ),
                                                iconSize: 300,
                                                onPressed: () {},
                                              )
                                            ]
                                          ]
                                        ]
                                      ]
                                    ],

                                    // Ground floor
                                    if (widget.floor == 'G') ...[
                                      if (document['zoneg'] == 'g1') ...[
                                        IconButton(
                                            icon: Image.asset(
                                              'assets/images/yellowG.jpeg',
                                              fit: BoxFit.cover,
                                              scale: 0.6,
                                            ),
                                            iconSize: 300,
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pushReplacement(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              lockerset1_gy(
                                                                numberOfWeek: widget
                                                                    .numberOfWeek!,
                                                                resId: widget
                                                                    .resId,
                                                                startDate: widget
                                                                    .startDate,
                                                                endDate: widget
                                                                    .endDate,
                                                              )));
                                            })
                                      ] else ...[
                                        if (document['zoneg'] == 'g2') ...[
                                          IconButton(
                                            icon: Image.asset(
                                              'assets/images/orangeG.jpeg',
                                              fit: BoxFit.cover,
                                              scale: 0.6,
                                            ),
                                            iconSize: 300,
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pushReplacement(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              lockerset1_go(
                                                                numberOfWeek: widget
                                                                    .numberOfWeek!,
                                                                resId: widget
                                                                    .resId,
                                                                startDate: widget
                                                                    .startDate,
                                                                endDate: widget
                                                                    .endDate,
                                                              )));
                                            },
                                          )
                                        ] else ...[
                                          if (document['zoneg'] == 'g3') ...[
                                            IconButton(
                                              icon: Image.asset(
                                                'assets/images/greenG.jpeg',
                                                fit: BoxFit.cover,
                                                scale: 0.6,
                                              ),
                                              iconSize: 300,
                                              onPressed: () {
                                                Navigator.of(context)
                                                    .pushReplacement(
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                lockerset1_gg(
                                                                  numberOfWeek:
                                                                      widget
                                                                          .numberOfWeek!,
                                                                  resId: widget
                                                                      .resId,
                                                                  startDate: widget
                                                                      .startDate,
                                                                  endDate: widget
                                                                      .endDate,
                                                                )));
                                              },
                                            )
                                          ] else ...[
                                            if (document['zoneg'] == 'g4') ...[
                                              IconButton(
                                                icon: Image.asset(
                                                  'assets/images/purpleG.jpeg',
                                                  fit: BoxFit.cover,
                                                  scale: 0.6,
                                                ),
                                                iconSize: 300,
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .pushReplacement(
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  lockerset1_gpl(
                                                                    numberOfWeek:
                                                                        widget
                                                                            .numberOfWeek!,
                                                                    resId: widget
                                                                        .resId,
                                                                    startDate:
                                                                        widget
                                                                            .startDate,
                                                                    endDate: widget
                                                                        .endDate,
                                                                  )));
                                                },
                                              )
                                            ]
                                          ]
                                        ]
                                      ]
                                    ],
                                  ]),
                            ]),
                      ),
                    ),

// ),
                  ]);
                }).toList(),
              );
            }));
  }
}
