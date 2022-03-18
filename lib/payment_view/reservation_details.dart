import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:relocker_sa/bloc/cubit/payment_cubit.dart';
import 'package:relocker_sa/bloc/states/payment_states.dart';
import 'package:relocker_sa/payment_view/payment_method.dart';
import 'package:relocker_sa/paypal/payment/paypal/v/PaypalGenericPage.dart';
import 'package:relocker_sa/widgets/custom_button.dart';
import 'package:relocker_sa/widgets/input_field.dart';
import 'package:relocker_sa/widgets/relocker_logo_widget.dart';

import '../controller_view_screen.dart';

int Rendifference = 0;
int Resdifference = 0;

class ReservationDetails extends StatelessWidget {
  final int? totalPrice;
  final String? resId;
  final String? lockerName;
  final int? priceOneWeek;
  final String? typelocker;
  final String startDate;
  final String endDate;
  final String? lockerSize;
  final String? from;

  ReservationDetails(
      {Key? key,
      this.resId,
      this.totalPrice,
      this.lockerName,
      this.priceOneWeek,
      this.typelocker,
      this.startDate = "",
      this.endDate = "",
      this.lockerSize,
      this.from = '1'})
      : super(key: key) {
    // print("nda - totalPrice: " + totalPrice.toString()
    //     + " /resId: " + resId.toString() + " /lockerName: " + lockerName.toString() );
  }

  // String relockerName = '6-G-53';

  late BuildContext context;

  @override
  Widget build(BuildContext context) {
    print("nda - ReservationDetails - build() ");

    this.context = context;

    return BlocConsumer<PaymentCubit, PaymentStates>(
      listener: (context, state) {},
      builder: (context, state) {
        PaymentCubit _cubit = PaymentCubit.get(context);
        return Scaffold(
          backgroundColor: const Color(0xFF89d8bb),
          appBar: AppBar(
            backgroundColor: const Color(0xff88d8bb),
            elevation: 0.0,
            title: Text("Reservation Details"),
            centerTitle: true,
            foregroundColor: Colors.black,
            leading: IconButton(
              color: Colors.black,
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.of(context).pop(),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ControllerViewScreen()));
                  },
                  child: Text("Cancle", style: TextStyle(color: Colors.black)))
            ], /* textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontSize: 20,
                  color: Colors.black,
                ))*/
          ),
          body: Conditional.single(
            context: context,
            conditionBuilder: (BuildContext context) =>
                state is! GetReservationDataLoadingState,
            widgetBuilder: (BuildContext context) => ListView(
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
                            const Text(
                              'Locker Number',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              //'${_cubit.resserv['locker_name']}',
                              '$lockerName',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 40),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 2.5,
                                  child: InputField(
                                      title: 'Start Date',
                                      hint:
                                          '${_cubit.resserv['Start Date'].toString()}',
                                      widget: Container()),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 2.5,
                                  child: InputField(
                                    title: 'End Date',
                                    hint:
                                        '${_cubit.resserv['End Date'].toString()}',
                                    widget: Container(),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            InputField(
                              title: 'Price',
                              hint: '${totalPrice!} \SR',
                              widget: Container(),
                            ),
                            const SizedBox(height: 40),
                            CustomButton(
                                text: 'Confirm',
                                color: const Color(0xFF89d8bb),
                                onPressed: () async {
                                  if (from == '2') {
                                    final DocumentSnapshot doc =
                                        await FirebaseFirestore.instance
                                            .collection('semester')
                                            .doc("semester1")
                                            .get();
                                    String startdate1 = doc['start'];
                                    String endDate1 = doc['end'];
                                    final DocumentSnapshot doc2 =
                                        await FirebaseFirestore.instance
                                            .collection('semester')
                                            .doc("semester2")
                                            .get();
                                    String startdate2 = doc['start'];
                                    String endDate2 = doc['end'];
//to know which semester dates to send
                                    if (DateTime.parse(startDate).isAfter(
                                            DateTime.parse(startdate1)) &&
                                        DateTime.parse(endDate).isBefore(
                                            DateTime.parse(endDate1))) {
                                      openPagePaymentWithListener();
                                    } else if (DateTime.parse(startDate)
                                            .isAfter(
                                                DateTime.parse(startdate2)) &&
                                        DateTime.parse(endDate).isBefore(
                                            DateTime.parse(endDate2))) {
                                      final DocumentSnapshot doc2 =
                                          await FirebaseFirestore.instance
                                              .collection('Reservation')
                                              .doc(
                                                  "${FirebaseAuth.instance.currentUser!.uid}")
                                              .get();
                                      String type = doc2['typeLocker'];
                                      if (type == "f") {
                                        openPagePaymentWithListener();
                                      } else {
                                        print(
                                            "make a new reservation in the next semester");
                                      }
                                    } else {
                                      print(
                                          "you can't reserve in holidays days");
                                    }
                                  }
// openPagePaymentWithListener();
                                  // Navigator.of(context).push(MaterialPageRoute(
                                  //     builder: (context) => PaymentMethod(
                                  //       resId: resId,
                                  //       lockerName: lockerName,
                                  //     ))),
                                  //
                                })
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
            fallbackBuilder: (BuildContext context) => const Center(
              child: CircularProgressIndicator(
                color: Color(0xFFffffff),
              ),
            ),
          ),
        );
      },
    );
  }

  //------------------------------------------------------------------------ payment

  Future openPagePaymentWithListener() async {
    var price_double = totalPrice!.toDouble();

    var widget = PaypalGenericPage(price_double,
        payPalCallBack: (status, msg, transactionId) async {
      //log listener to payment
      print("nda - PaypalGenericPage - callback - status: " +
          status.toString() +
          " /msg: " +
          msg +
          " /transactionId: " +
          transactionId);

      if (status) {
        print("User success payment ");
        //#TODO : Create Reserervation Data
        User? user = FirebaseAuth.instance.currentUser;
        var rng = new Random();
        var code = rng.nextInt(9000) + 1000;
        int semester = 0;
        // to get semester
        final DocumentSnapshot doc = await FirebaseFirestore.instance
            .collection('semester')
            .doc("semester1")
            .get();
        String startdate1 = doc['start'];
        String endDate1 = doc['end'];
        final DocumentSnapshot doc2 = await FirebaseFirestore.instance
            .collection('semester')
            .doc("semester2")
            .get();
        String startdate2 = doc['start'];
        String endDate2 = doc['end'];
//to know which semester dates to send
        if (DateTime.now().isAfter(DateTime.parse(startdate1)) &&
            DateTime.now().isBefore(DateTime.parse(endDate1))) {
          semester = 1;
        } else if (DateTime.now().isAfter(DateTime.parse(startdate2)) &&
            DateTime.now().isBefore(DateTime.parse(endDate2))) {
          semester = 2;
        }

        await FirebaseFirestore.instance
            .collection("Reservation")
            .doc("${FirebaseAuth.instance.currentUser!.uid}")
            .set({
          //store reservation info in database
          "Owner": "${user!.email}",
          "End Date": endDate,
          "Start Date": startDate,
          "user_id": "${FirebaseAuth.instance.currentUser!.uid}",
          "locker_name": lockerName,
          "Price": totalPrice,
          "typeLocker": typelocker,
          // "priceOneWeek": priceOneWeek, //another way
          "priceOneWeek": (typelocker == 'f' && lockerSize == 's')
              ? 15
              : (typelocker == 'f' && lockerSize == 'l')
                  ? 25
                  : '',
          "semester": semester
        });
        await FirebaseFirestore.instance
            .collection("Users")
            .where("user_id",
                isEqualTo: "${FirebaseAuth.instance.currentUser!.uid}")
            .limit(1)
            .get()
            .then((v) {
          v.docs.forEach((el) {
            FirebaseFirestore.instance
                .collection("Users")
                .doc("${el.id}")
                .update({"reservedlocker": "${lockerName}"});
          });
        });
        await FirebaseFirestore.instance
            .collection("lockers")
            .where("name", isEqualTo: "${lockerName}")
            .limit(1)
            .get()
            .then((v) {
          v.docs.forEach((el) {
            FirebaseFirestore.instance
                .collection("lockers")
                .doc("${el.id}")
                .update({"pin": "${code}"});
          });
        });
      }
      // change availablity

      Resdifference = DateTime.parse(endDate)
          .difference(DateTime.parse(startDate))
          .inSeconds;

      Rendifference = DateTime.parse(endDate)
              .difference(DateTime.parse(startDate))
              .inSeconds +
          1;

      Future.delayed(Duration(seconds: Resdifference), () async {
        final DocumentSnapshot doc = await FirebaseFirestore.instance
            .collection('Users')
            .doc("${FirebaseAuth.instance.currentUser!.uid}")
            .get();
        String locker = doc['reservedlocker'];

        print(locker);
        if (locker != "") {
          final DocumentSnapshot doc = await FirebaseFirestore.instance
              .collection('Users')
              .doc("${FirebaseAuth.instance.currentUser!.uid}")
              .get();
          String locker = doc['reservedlocker'];
          print(locker);

          final DocumentSnapshot doc2 = await FirebaseFirestore.instance
              .collection('Reservation')
              .doc("${FirebaseAuth.instance.currentUser!.uid}")
              .get();
          // DateTime date = doc2['End Date'].toDate();
          DateTime date = DateTime.parse(doc2['End Date']);
          // print(date);

//
          if (true) {
            var rng = new Random();
            var code = rng.nextInt(9000) + 1000;
            final DocumentSnapshot doc = await FirebaseFirestore.instance
                .collection("Reservation")
                .doc("${FirebaseAuth.instance.currentUser!.uid}")
                .get();
            String lname = doc['locker_name'];
            print(lname);

            await FirebaseFirestore.instance
                .collection("lockers")
                .where("name", isEqualTo: "${lname}")
                .limit(1)
                .get()
                .then((v) {
              v.docs.forEach((el) {
                FirebaseFirestore.instance
                    .collection("lockers")
                    .doc("${lname}")
                    .update({
                  "available": true,
                });
              });
            });

            await FirebaseFirestore.instance
                .collection("Users")
                .where("user_id",
                    isEqualTo: "${FirebaseAuth.instance.currentUser!.uid}")
                .limit(1)
                .get()
                .then((v) {
              v.docs.forEach((el) {
                FirebaseFirestore.instance
                    .collection("Users")
                    .doc("${lname}")
                    .update({
                  "reservedlocker": "",
                });
              });
            });
            await FirebaseFirestore.instance
                .collection("lockers")
                .where("name", isEqualTo: "${lockerName}")
                .limit(1)
                .get()
                .then((v) {
              v.docs.forEach((el) {
                FirebaseFirestore.instance
                    .collection("lockers")
                    .doc("${el.id}")
                    .update({"pin": "${code}"});
              });
            });
          }

//Now use If/Else statement to know, if the current time is same as/or after the
//time set for trigger, then trigger the event,

        }
      });
    });

    var materialPageRoute = MaterialPageRoute(builder: (context) => widget);
    Navigator.push(context, materialPageRoute);
  }
}
