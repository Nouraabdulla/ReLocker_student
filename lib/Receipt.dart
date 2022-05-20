import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:relocker_sa/bloc/cubit/payment_cubit.dart';
import 'package:relocker_sa/bloc/states/payment_states.dart';
import 'package:relocker_sa/widgets/input_field.dart';
import 'package:relocker_sa/widgets/relocker_logo_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../closed_lock.dart';
import '../controller_view_screen.dart';

class Receipt extends StatefulWidget {
  Receipt({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  State<Receipt> createState() => _ReceiptState();
}

class _ReceiptState extends State<Receipt> {
  // String relockerName = '6-G-53';
  Map<String, dynamic> reseipt = {};
  User? user = FirebaseAuth.instance.currentUser;

  getData() {
    FirebaseFirestore.instance
        .collection("Reservation")
        .where("user_id",
            isEqualTo: "${FirebaseAuth.instance.currentUser!.uid}")
        .get()
        .then((value) {
      List<DocumentSnapshot<Map<String, dynamic>>> list = value.docs;
      list.forEach((element) async {
        setState(() {
          reseipt = element.data()!;
        });
      });
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final random = Random();

        return Scaffold(
          backgroundColor: const Color(0xFF89d8bb),
          appBar: AppBar(
            title: const Text(
              'Receipt',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
              ),
            ),
            centerTitle: true,
            elevation: 0.0,
            backgroundColor: const Color(0xFF89d8bb),
            leading: Container(),
          ),
          body: ListView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.16,
                    ),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.85,
                      width: double.infinity,
                      padding: const EdgeInsets.only(
                          right: 30, left: 30, bottom: 30),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                          ),
                          color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Locker Number',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 22,
                                fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            // '${_cubit.resserv['locker_name']}',
                            // '$lockerName',
                            '${reseipt['locker_name']}',
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2.5,
                                child: InputField(
                                    title: 'Start Date',
                                    hint: '${reseipt['Start Date']}',
                                    // '${_cubit.resserv['Start Date'].toString()}',
                                    widget: Container()),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2.5,
                                child: InputField(
                                  title: 'End Date',
                                  hint: '${reseipt['End Date']}',
                                  // '${_cubit.resserv['End Date'].toString()}',
                                  widget: Container(),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),

                          const SizedBox(height: 40),
                          //Confirm Button
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 2.0,
                              height: MediaQuery.of(context).size.width / 9,
                              child: ElevatedButton(
                                  child: const Text(
                                    'OK',
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
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ControllerViewScreen()));
                                  }))
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      top: MediaQuery.of(context).size.height * 0.06,
                      left: MediaQuery.of(context).size.width * 0.25,
                      child: RelockerLogoWidget()),
                  Positioned(
                      top: MediaQuery.of(context).size.height * 0.06,
                      right: MediaQuery.of(context).size.width * 0.25,
                      child: RelockerLogoWidget()),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
