import 'dart:math';

import 'package:flutter/material.dart';
import 'package:relocker_sa/lockerset1_fp.dart';
import 'package:relocker_sa/lockerset1_gg.dart';
import 'package:relocker_sa/lockerset1_go.dart';
import 'package:relocker_sa/lockerset1_gp.dart';
import 'package:relocker_sa/lockerset1_gy.dart';
import 'package:relocker_sa/zonelist.dart';
import 'lockerset1_fg.dart';
import 'package:flutter_elegant_number_button/flutter_elegant_number_button.dart';

class recommendations extends StatefulWidget {
  final int? numberOfWeek;
  final String resId;
  final String floor;
  final String startDate;
  final String endDate;
  recommendations(
      {Key? key,
      this.numberOfWeek,
      this.resId = '',
      this.floor = '',
      this.startDate = '',
      this.endDate = ''})
      : super(key: key);

  @override
  State<recommendations> createState() => _recommendations();
}

int i = 1;
num g1 = 0;
num g2 = 0;
num g3 = 0;
num g4 = 0;
num f1 = 0;
num f2 = 0;
num f3 = 0;
num f4 = 0;
List<num> number = [];

class _recommendations extends State<recommendations> {
  GlobalKey<FormState> _resetFormKey = GlobalKey<FormState>();

  String? zone = "";
  String dropdownValue = 'First';
  bool Atdoor = false;
  bool classname = false;
  int selectedValue = 0;
  int selection = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffffffff),
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
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Container(
                    height: 580,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withAlpha(100),
                              blurRadius: 10.0),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20),
                      child: Column(
                        children: <Widget>[
                          if (widget.floor == 'F') ...[
                            SizedBox(
                              height: 50,
                              child: Text(
                                "Choose your preferences:",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            //  Row(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            // children: <Widget>[

                            // width: MediaQuery.of(context).size.width * 0.7,
                            //   //  width: 280,
                            //   padding: const EdgeInsets.symmetric(
                            // horizontal: 12.0, vertical: 4),
                            // decoration: BoxDecoration(
                            //   borderRadius: BorderRadius.circular(5),
                            //   border: Border.all(color: Colors.grey.shade500, width: 1)
                            // ),
                            //          child:DropdownButtonHideUnderline(
                            //            child: DropdownButton<String>(
                            //   value: dropdownValue,
                            //   isExpanded: true,
                            //   // elevation: 16,
                            //   style: const TextStyle(color: Colors.black),
                            //   // underline: Container(
                            //   //   height: 2,
                            //   //   color: Colors.deepPurpleAccent,
                            //   // ),
                            //   onChanged: (String? newValue) {
                            //     setState(() {
                            //       dropdownValue = newValue!;
                            //     });
                            //   },
                            //   items: <String>['First', 'Ground']
                            //       .map<DropdownMenuItem<String>>((String value) {
                            //     return DropdownMenuItem<String>(

                            //       value: value,
                            //       child: Text(value),
                            //     );
                            //   }).toList(),
                            // ),
                            //                           )   ),
                            SizedBox(
                                child: RadioListTile<int>(
                                    value: 0,
                                    groupValue: selection,
                                    title: Text('Near to exit'),
                                    onChanged: (value) =>
                                        setState(() => selection = 0))),
                            // secondary: const Icon(Icons.door_sliding_outlined),

                            // ]
                            // ),

                            //   SizedBox(
                            //   height: 20,
                            // ),

                            SizedBox(
                                child: RadioListTile<int>(
                                    value: 1,
                                    groupValue: selection,
                                    title: Text('Near to my class'),
                                    onChanged: (value) => setState(
                                          () => selection = 1,
                                        ))),

                            // SizedBox(
                            //   child: TextField(
                            //     key: _resetFormKey,
                            //     decoration: InputDecoration(
                            //         filled: true,
                            //         enabledBorder: OutlineInputBorder(
                            //           borderRadius: BorderRadius.circular(5),
                            //           borderSide: BorderSide(
                            //               width: 1, color: Colors.grey),
                            //         ),
                            //         hintText: 'Floor'),
                            //     onChanged: (value) => floor = value,
                            //   ),
                            //   width: MediaQuery.of(context).size.width * 0.7,
                            // ),
                            // ],

                            if (selection == 1) ...[
                              SizedBox(
                                child: Text(
                                    'choose one of the set that contain your classnumber'),
                              ),
                              //     SizedBox(
                              // child: RadioListTile<int>(
                              //   value: 0, groupValue: selectedValue,
                              //   title:Text('6-F-1-6-F-11'),
                              //   onChanged: (value) => setState(()=>
                              //   selectedValue=0)
                              //   )
                              //     ),
                              SizedBox(
                                height: 20,
                              ),

                              SizedBox(
                                child: ElegantNumberButton(
                                  initialValue: f1,
                                  minValue: 0,
                                  maxValue: 10,
                                  step: 1,
                                  decimalPlaces: 0,
                                  color: Colors.grey,
                                  onChanged: (value) {
                                    // get the latest value from here
                                    setState(() {
                                      f1 = value;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(
                                child: Text("6-F-1 to 6-F-11"),
                              ),

                              //    SizedBox(
                              // child: RadioListTile<int>(
                              //   value: 1, groupValue: selectedValue,
                              //   title:Text('6-F-12-6-F-21'),
                              //   onChanged: (value) => setState(()=>
                              //   selectedValue=1)
                              //   )
                              //     ),
                              SizedBox(
                                child: ElegantNumberButton(
                                  initialValue: f2,
                                  minValue: 0,
                                  maxValue: 10,
                                  step: 1,
                                  decimalPlaces: 0,
                                  color: Colors.grey,
                                  onChanged: (value) {
                                    // get the latest value from here
                                    setState(() {
                                      f2 = value;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(
                                child: Text("6-F-12 to 6-F-21"),
                              ),

                              //     SizedBox(
                              // child: RadioListTile<int>(
                              //   value: 2, groupValue: selectedValue,
                              //   title:Text('6-F-25-6-F-49'),
                              //   onChanged: (value) => setState(()=>
                              //   selectedValue=2)
                              //   )
                              //     ),
                              SizedBox(
                                child: ElegantNumberButton(
                                  initialValue: f3,
                                  minValue: 0,
                                  maxValue: 10,
                                  step: 1,
                                  decimalPlaces: 0,
                                  color: Colors.grey,
                                  onChanged: (value) {
                                    // get the latest value from here
                                    setState(() {
                                      f3 = value;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(
                                child: Text("6-F-25 to 6-F-49"),
                              ),

                              //     SizedBox(
                              // child: RadioListTile<int>(
                              //   value: 3, groupValue: selectedValue,
                              //   title:Text('6-F-50-6-F-56'),
                              //   onChanged: (value) => setState(()=>
                              //   selectedValue=3)
                              //   )
                              //     ),

                              SizedBox(
                                child: ElegantNumberButton(
                                  initialValue: f4,
                                  minValue: 0,
                                  maxValue: 10,
                                  step: 1,
                                  decimalPlaces: 0,
                                  color: Colors.grey,
                                  onChanged: (value) {
                                    // get the latest value from here
                                    setState(() {
                                      f4 = value;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(
                                child: Text("6-F-50 to 6-F-56"),
                              ),
                            ],
                            SizedBox(
                              height: 70,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2.0,
                              height: MediaQuery.of(context).size.width / 9,
                              child: ElevatedButton(
                                child: const Text(
                                  'Confirm',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 18,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xFF9AD6BD),
                                  shape: const StadiumBorder(),
                                ),
                                onPressed: () {
                                  // green zone
                                  // if(selectedValue==2 && selection==1){
                                  //    Navigator.of(context)
                                  // .pushReplacement(MaterialPageRoute(
                                  //     builder: (context) => lockerset1_fg(
                                  //           numberOfWeek: widget.numberOfWeek!,
                                  //           resId: widget.resId,
                                  //           startDate:  widget.startDate,
                                  //           endDate:widget.endDate,
                                  //         )));
                                  // }
                                  // purpole zone
                                  // if (selectedValue==3 && selection==1){
                                  //    Navigator.of(context)
                                  // .pushReplacement(MaterialPageRoute(
                                  //     builder: (context) => lockerset1_fp(
                                  //           numberOfWeek: widget.numberOfWeek!,
                                  //           resId: widget.resId,
                                  //           startDate:  widget.startDate,
                                  //           endDate:widget.endDate,
                                  //         )));
                                  // }
                                  //  if (selection==0){
                                  //    Navigator.of(context)
                                  // .pushReplacement(MaterialPageRoute(
                                  //     builder: (context) => lockerset1_fp(
                                  //           numberOfWeek: widget.numberOfWeek!,
                                  //           resId: widget.resId,
                                  //           startDate:  widget.startDate,
                                  //           endDate:widget.endDate,
                                  //         )));
                                  // }
                                  //  number.sort();
                                  number = [f1, f2, f3, f4];

                                  print(number);

//send to data zones with numbers fg>f1

                                  if (selection == 1) {
                                    setState(() {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  zones_list(number: number)));
                                    });
                                  } else {
                                    Navigator.of(context)
                                        .pushReplacement(MaterialPageRoute(
                                            builder: (context) => lockerset1_fg(
                                                  numberOfWeek:
                                                      widget.numberOfWeek!,
                                                  resId: widget.resId,
                                                  startDate: widget.startDate,
                                                  endDate: widget.endDate,
                                                )));
                                  }
                                },
                              ),
                            ),
                          ],

                          // recommendations for Ground floor
                          if (widget.floor == 'G') ...[
                            SizedBox(
                              height: 50,
                              child: Text(
                                "Choose your preferences:",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            SizedBox(
                                child: RadioListTile<int>(
                                    value: 0,
                                    groupValue: selection,
                                    title: Text('Near to exit'),
                                    onChanged: (value) =>
                                        setState(() => selection = 0))),
                            SizedBox(
                                child: RadioListTile<int>(
                                    value: 1,
                                    groupValue: selection,
                                    title: Text('Near to my class'),
                                    onChanged: (value) => setState(
                                          () => selection = 1,
                                        ))),
                            if (selection == 1) ...[
                              SizedBox(
                                child: Text(
                                    'choose one of the set that contain your classnumber'),
                              ),
                              SizedBox(
                                  child: RadioListTile<int>(
                                      value: 0,
                                      groupValue: selectedValue,
                                      title: Text('1-11'),
                                      onChanged: (value) =>
                                          setState(() => selectedValue = 0))),
                              SizedBox(
                                  child: RadioListTile<int>(
                                      value: 1,
                                      groupValue: selectedValue,
                                      title: Text('12-21'),
                                      onChanged: (value) =>
                                          setState(() => selectedValue = 1))),
                              SizedBox(
                                  child: RadioListTile<int>(
                                      value: 2,
                                      groupValue: selectedValue,
                                      title: Text('30-42'),
                                      onChanged: (value) =>
                                          setState(() => selectedValue = 2))),
                              SizedBox(
                                  child: RadioListTile<int>(
                                      value: 3,
                                      groupValue: selectedValue,
                                      title: Text('44-53'),
                                      onChanged: (value) =>
                                          setState(() => selectedValue = 3))),
                            ],
                            SizedBox(
                              height: 40,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2.0,
                              height: MediaQuery.of(context).size.width / 9,
                              child: ElevatedButton(
                                child: const Text(
                                  'Confirm',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 18,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xFF9AD6BD),
                                  shape: const StadiumBorder(),
                                ),
                                onPressed: () {
                                  // green zone
                                  if (selectedValue == 2 && selection == 1) {
                                    Navigator.of(context)
                                        .pushReplacement(MaterialPageRoute(
                                            builder: (context) => lockerset1_gg(
                                                  numberOfWeek:
                                                      widget.numberOfWeek!,
                                                  resId: widget.resId,
                                                  startDate: widget.startDate,
                                                  endDate: widget.endDate,
                                                )));
                                  }
                                  // purpele zone
                                  if (selectedValue == 3 && selection == 1) {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                lockerset1_gpl(
                                                  numberOfWeek:
                                                      widget.numberOfWeek!,
                                                  resId: widget.resId,
                                                  startDate: widget.startDate,
                                                  endDate: widget.endDate,
                                                )));
                                  }
                                  // orange zone
                                  if (selectedValue == 1 && selection == 1) {
                                    Navigator.of(context)
                                        .pushReplacement(MaterialPageRoute(
                                            builder: (context) => lockerset1_go(
                                                  numberOfWeek:
                                                      widget.numberOfWeek!,
                                                  resId: widget.resId,
                                                  startDate: widget.startDate,
                                                  endDate: widget.endDate,
                                                )));
                                  }
                                  // yellow zone
                                  if (selectedValue == 0 && selection == 1) {
                                    Navigator.of(context)
                                        .pushReplacement(MaterialPageRoute(
                                            builder: (context) => lockerset1_gy(
                                                  numberOfWeek:
                                                      widget.numberOfWeek!,
                                                  resId: widget.resId,
                                                  startDate: widget.startDate,
                                                  endDate: widget.endDate,
                                                )));
                                  }
                                  // near to exit which zone yellow or pureple
                                  if (selection == 0) {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                lockerset1_gpl(
                                                  numberOfWeek:
                                                      widget.numberOfWeek!,
                                                  resId: widget.resId,
                                                  startDate: widget.startDate,
                                                  endDate: widget.endDate,
                                                )));
                                  }
                                },
                              ),
                            ),
                          ]
                        ],
                      ),
                    )))));
  }
}
