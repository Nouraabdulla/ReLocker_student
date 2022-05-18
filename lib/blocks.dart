import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:relocker_sa/addblock.dart';
import 'package:relocker_sa/lockerset1_gg.dart';
import 'package:relocker_sa/lockerset1_gg.dart' as globals;

class blocks extends StatefulWidget {
  final bool available;
  final String? block;
  final String? type;
  final String? from;
  const blocks({
    Key? key,
    this.available = true,
    this.block = "",
    this.type = '',
    this.from = '',
  }) : super(key: key);

  @override
  State<blocks> createState() => _blocksState();
}

class _blocksState extends State<blocks> {
  int zonesize = 0;
  List blocklist = [];
  //check the admin comes from any zone to craet the list
  checkzone() {
    if (widget.from == "gg") {
      zonesize = 24;
      blocklist = [
        'assets/images/gg1.png',
        'assets/images/gg2.png',
        'assets/images/gg3.png',
        'assets/images/gg4.png',
        'assets/images/gg5.png',
        'assets/images/gg6.png',
        'assets/images/gg7.png',
        'assets/images/gg8.png',
        'assets/images/gg9.png',
        'assets/images/gg10.png',
        'assets/images/gg11.png',
        'assets/images/gg12.png',
        'assets/images/gg13.png',
        'assets/images/gg14.png',
        'assets/images/gg15.png',
        'assets/images/gg16.png',
        'assets/images/gg17.png',
        'assets/images/gg18.png',
        'assets/images/gg19.png',
        'assets/images/gg20.png',
        'assets/images/gg21.png',
        'assets/images/gg22.png',
        'assets/images/gg23.png',
        'assets/images/gg24.png',
      ];
    }
  }

  @override
  void initState() {
    checkzone();
    // getUser();
    super.initState();
  }

  Future<Color> ckeckblock(String value) async {
    final DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection("Zones")
        .doc("${widget.from}Zone")
        .get();

    String s = doc['${value}size']; //block

    if (s == "") {
      return Color.fromARGB(255, 171, 174, 172);
    }
    return Color(0xFF9AD6BD);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(240, 255, 255, 255),
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: const Color(0xff88d8bb),
          title: Text("Blocks"),
          centerTitle: true,
          foregroundColor: Colors.black,
          leading: IconButton(
              color: Colors.black,
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ),
        body: GridView.count(
            // Create a grid with 2 columns. If you change the scrollDirection to
            // horizontal, this produces 2 rows.
            crossAxisCount: 1,
            // Generate 3 widgets that display their index in the List.
            children: List.generate(zonesize, (index) {
              return GridTile(
                child: SizedBox(
                  width: 200,
                  child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      color: Color.fromARGB(255, 231, 241, 239),
                      child: Center(
                        child: Column(children: <Widget>[
                          Text(
                            "${widget.from}" + "${index + 1}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                height: 2),
                          ),
                          Container(
                              child: SizedBox(
                                  width: 200,
                                  height: 300,
                                  child: Image.asset(
                                    blocklist[index],
                                    fit: BoxFit.fill,
                                  ))),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                child: const Text(
                                  'add',
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
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => addblock(
                                                from: "${widget.from}",
                                                available: true,
                                                block: "${widget.from}" +
                                                    "${index + 1}",
                                                type: widget.type,
                                              )));
                                },
                              ),
                              ElevatedButton(
                                child: const Text(
                                  'delete',
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
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          clipBehavior: Clip.hardEdge,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          child: AlertDialog(
                                            title: Text(
                                              "Are you sure you want to delete ${widget.from}${index + 1} block",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                              ),
                                            ),
                                            actions: [
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                                height: MediaQuery.of(context)
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
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Color(0xFF9AD6BD),
                                                    shape:
                                                        const StadiumBorder(),
                                                  ),
                                                  onPressed: () async {
                                                    //delete lockers
                                                    await FirebaseFirestore
                                                        .instance
                                                        .collection("lockers")
                                                        .where("block",
                                                            isEqualTo: "gg0")
                                                        .limit(16)
                                                        .get()
                                                        .then((v) {
                                                      v.docs.forEach((el) {
                                                        FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                "lockers")
                                                            .doc("${el.id}")
                                                            .delete();
                                                      });
                                                    });
                                                    //make block disappear in its zone
                                                    await FirebaseFirestore
                                                        .instance
                                                        .collection("zones")
                                                        .doc(
                                                            "${widget.from}zone")
                                                        .set({
                                                      "${widget.from}${index + 1}size":
                                                          "",
                                                    });
                                                  },
                                                ),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                                height: MediaQuery.of(context)
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
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Color(0xFF9AD6BD),
                                                    shape:
                                                        const StadiumBorder(),
                                                  ),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      });
                                },
                              ),
                            ],
                          )
                        ]),
                      )),
                ),
              );
            }))

        // Container(
        //   child: TextButton(
        //       onPressed: () async {
        //         await FirebaseFirestore.instance
        //             .collection("Zones")
        //             .doc("ggzone")
        //             .set({"gg0size": ""});
        //       },
        //       child: Text("add")),
        // )
        );
  }
}
