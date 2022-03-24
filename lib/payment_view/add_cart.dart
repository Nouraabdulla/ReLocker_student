import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:relocker_sa/bloc/cubit/payment_cubit.dart';
import 'package:relocker_sa/bloc/states/payment_states.dart';
import 'package:relocker_sa/payment_view/checkout.dart';
import 'package:relocker_sa/widgets/custom_button.dart';
import 'package:relocker_sa/widgets/input_field.dart';
import 'package:relocker_sa/widgets/mada_widget.dart';
import 'package:relocker_sa/widgets/mastercard_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddCard extends StatefulWidget {
  final String? resId;
  final String? lockerName;

  const AddCard({Key? key, this.resId, this.lockerName}) : super(key: key);

  @override
  State<AddCard> createState() => _AddCardState();
}

final random = Random();
int randomNumber = random.nextInt(10) * 1000;

class _AddCardState extends State<AddCard> {
  var _selectedDate = DateTime.now().toString();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  getCode() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    DateTime expDate =
        DateFormat("yyyy-MM-dd").parse("${sp.getString("date")}");
    await sp.setString("code", randomNumber.toString());
    await sp.setString("date", DateTime.now().toString().split(" ").first);
  }

  void _datepicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2023),
    ).then((value) {
      if (value == null) return DateTime.now();
      setState(() {
        _selectedDate = DateFormat().add_yMd().format(value).toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF89d8bb),
      appBar: AppBar(
        title: const Text(
          'Add Card',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: const Color(0xff89d8bb),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 24,
          ),
          splashRadius: 24,
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          BlocConsumer<PaymentCubit, PaymentStates>(
            listener: (context, state) {},
            builder: (context, state) {
              PaymentCubit _cubit = PaymentCubit.get(context);
              return Stack(
                children: [
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.15,
                      ),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.85,
                        width: double.infinity,
                        padding: const EdgeInsets.only(
                            top: 90, right: 30, left: 30, bottom: 24),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50),
                            ),
                            color: Colors.white),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InputFieldNum(
                              title: 'Card Number',
                              hint: '',
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: InputFieldWithoutValidate(
                                    title: 'Expiry Date',
                                    hint: _selectedDate.toString(),
                                    widget: IconButton(
                                      icon: Icon(Icons.date_range),
                                      splashColor:
                                          Colors.white.withOpacity(0.2),
                                      splashRadius: 24,
                                      onPressed: () => _datepicker(),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 3,
                                  child: const InputFieldNum(
                                    title: 'Cvv',
                                    hint: '',
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            InputField(
                              title: 'Name',
                              hint: '',
                            ),
                            const SizedBox(height: 50),
                            CustomButton(
                                text: 'Add card',
                                color: const Color(0xFF89d8bb),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return Container(
                                            clipBehavior: Clip.hardEdge,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            //Show Success Message To User
                                            child: AlertDialog(
                                              title: const Text(
                                                'Success!',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                ),
                                              ),
                                              actions: [
                                                // Button To Delete Alert Dialog  And Move To Another Screen
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      6,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      9,
                                                  child: ElevatedButton(
                                                    child: const Text(
                                                      'Ok',
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
                                                      // FirebaseFirestore.instance
                                                      //     .collection(
                                                      //         "Reservation")
                                                      //     .doc(widget.resId)
                                                      //     .update({
                                                      //   "locker_name":
                                                      //       widget.lockerName
                                                      // });
                                                      // FirebaseFirestore.instance
                                                      //     .collection("lockers")
                                                      //     .where("name",
                                                      //         isEqualTo: widget
                                                      //             .lockerName)
                                                      //     .limit(1)
                                                      //     .get()
                                                      //     .then((value) {
                                                      //   value.docs
                                                      //       .forEach((element) {
                                                      //     FirebaseFirestore
                                                      //         .instance
                                                      //         .collection(
                                                      //             "lockers")
                                                      //         .doc(element.id)
                                                      //         .update({
                                                      //       "available": false
                                                      //     });
                                                      //   });
                                                      // });
                                                      Navigator.of(context)
                                                          .pop();
                                                      //Go To Checkout Screen
                                                      Navigator.of(context)
                                                          .pushReplacement(
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          Checkout(
                                                                            resId:
                                                                                widget.resId,
                                                                            lockerName:
                                                                                widget.lockerName,
                                                                          )));
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        });
                                  }
                                })
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (_cubit.index == 1)
                    Positioned(
                        top: MediaQuery.of(context).size.height * 0.06,
                        left: MediaQuery.of(context).size.width * 0.333,
                        child: MadaWidget()),
                  if (_cubit.index == 2)
                    Positioned(
                        top: MediaQuery.of(context).size.height * 0.06,
                        right: MediaQuery.of(context).size.width * 0.333,
                        child: MastercardWidget()),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
