import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CalcPayPage extends StatefulWidget {
  const CalcPayPage({Key? key}) : super(key: key);

  @override
  _CalcPayPageState createState() => _CalcPayPageState();
}

class _CalcPayPageState extends State<CalcPayPage> {
  TextEditingController weeksNumberCont = new TextEditingController();
  TextEditingController startDateCont = new TextEditingController();
  TextEditingController endDateCont = new TextEditingController();

  DateTime selectedDate = DateTime.now();

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2050));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        startDateCont.text = picked.toString().split(" ").first;
        endDateCont.text = "${selectedDate.add(Duration(days:weeksNumberCont.text==""?0: 7*int.parse(weeksNumberCont.text)))}".split(" ").first;


      });
  }

  @override
  void initState() {
startDateCont.text = "$selectedDate".split(" ").first;
super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title:Text("Set Duration")),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Text("Number of weeks"),
          Card(
            elevation: 0.0,
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Colors.grey.shade200,
            child: TextField(
              keyboardType: TextInputType.phone,
              onChanged: (v){
                endDateCont.text = "${selectedDate.add(Duration(days:v==""?0: 7*int.parse(v)))}".split(" ").first;
              },
              controller: weeksNumberCont,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
          Text("Start Date"),
          Card(
            elevation: 0.0,
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Colors.grey.shade200,
            child: TextField(
              controller: startDateCont,
              readOnly: true,
              onTap: (){
                _selectStartDate(context);
              },
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
          Text("End Date"),
          Card(
            elevation: 0.0,
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Colors.grey.shade200,
            child: TextField(
              controller: endDateCont,
              readOnly: true,

              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: ()async{
             await FirebaseFirestore.instance.collection("reservation").add({
                "End Date":"${endDateCont.text}",
                "Start Date":"${startDateCont.text}",
                "Owner":"${FirebaseAuth.instance.currentUser!.email}",
                "userr_id":"${FirebaseAuth.instance.currentUser!.uid}",
                "locker_name":"",
                "Price":""
              });
            },
            child:Text("Save duration")
          )
        ],
      )
    );
  }
}
