import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:relocker_sa/controller_admin.dart';

class Requests extends StatefulWidget {
  const Requests({Key? key}) : super(key: key);

  @override
  _Requests createState() => _Requests();
}

class _Requests extends State<Requests> {
  // List<dynamic> responseList = [];
  Map<String, dynamic>? state;

  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFd3f3e6),
        appBar: AppBar(
          backgroundColor: const Color(0xff88d8bb),
          title: const Text("Requests"),
          automaticallyImplyLeading: false,
          centerTitle: true,
          foregroundColor: Colors.black,
        ),
        body: //Center(
            //  child: Column(
            //  children: [

            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('support')
                    .orderBy('counter', descending: false)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView(
                    scrollDirection: Axis.vertical,
                    children: snapshot.data!.docs.map((document) {
                      return Column(children: <Widget>[
                        //  ListTile(
                        // selected: true,
                        // title: Text( document['email'] ),
//  trailing:
                        //  InkWell(
                        //     onTap: () { Navigator.push(context,MaterialPageRoute(
                        //         builder: (context) => controlleradmin()));}, // Handle your callback
                        if (document['state'] == 'inprogress') ...[
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
//         Container(
//         alignment: Alignment.topLeft,
//         width: 30,
//         height: 40,
//          child: Checkbox(
//         checkColor: Colors.white,
//         value: isChecked,
//         onChanged: (bool? value) {
//           setState(() {
//             isChecked = value!;
//           });
//         },
//    ),
//  ),
                                          Text(
                                            'Email: ' + document['email'],
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            'LockerNumber: ' +
                                                document['lockername'],
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            'Title: ' + document['title'],
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            'Messsage:\n' + document['message'],
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),

//             child:FittedBox(
//               fit: BoxFit.fill,
// child: Text( responseList['email'] ),
//             ),
                                          // margin: const EdgeInsets.all(4.0),
                                          //     width: MediaQuery.of(context).size.width * 0.8,
                                          //     height: MediaQuery.of(context).size.width * 0.13,
                                          //     alignment: Alignment.center,
                                          //     decoration:BoxDecoration(
                                          //           color: Colors.grey,
                                          //           border: Border.all(
                                          //   color: Colors.black,
                                          //   width: 1,
                                          // ),
                                          //           ),
                                        ]),
                                    IconButton(
                                      icon: Icon(
                                        Icons.check_box_outline_blank,
                                        size: 30.0,
                                      ),
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return Container(
                                                clipBehavior: Clip.hardEdge,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30)),
                                                child: AlertDialog(
                                                  title: Text(
                                                    "Are you sure you perform the request?",
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                  actions: [
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              5,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              9,
                                                      child: ElevatedButton(
                                                        child: const Text(
                                                          'Yes',
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 18,
                                                          ),
                                                        ),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          primary:
                                                              Color(0xFF9AD6BD),
                                                          shape:
                                                              const StadiumBorder(),
                                                        ),
                                                        onPressed: () {
                                                          FirebaseFirestore
                                                              .instance
                                                              .collection(
                                                                  "support")
                                                              .doc(document.id)
                                                              .set(
                                                                  {
                                                                "state": "done"
                                                              },
                                                                  SetOptions(
                                                                      merge:
                                                                          true)).then(
                                                                  (value) =>
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop());
                                                        },
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              5,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              9,
                                                      child: ElevatedButton(
                                                        child: const Text(
                                                          'No',
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 18,
                                                          ),
                                                        ),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          primary:
                                                              Color(0xFF9AD6BD),
                                                          shape:
                                                              const StadiumBorder(),
                                                        ),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            });
                                      },
                                    ),
                                  ]),
                            ),
                          ),

// ),
                        ]
                      ]);
                    }).toList(),
                  );
                })

        //  ],
        //  )
        // ),
        );
  }
}
