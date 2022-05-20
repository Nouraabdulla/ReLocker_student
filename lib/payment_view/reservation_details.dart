import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:intl/intl.dart';
import 'package:relocker_sa/bloc/cubit/payment_cubit.dart';
import 'package:relocker_sa/bloc/states/payment_states.dart';
import 'package:relocker_sa/paypal/payment/paypal/v/PaypalGenericPage.dart';
import 'package:relocker_sa/renewpage.dart';
import 'package:relocker_sa/widgets/custom_button.dart';
import 'package:relocker_sa/widgets/input_field.dart';
import 'package:relocker_sa/widgets/relocker_logo_widget.dart';
import '../controller_view_screen.dart';
import '../home_view.dart';

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
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.16,
            ),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.85,
              width: double.infinity,
              padding: const EdgeInsets.only(right: 30, left: 30, bottom: 30),
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
                  SizedBox(
                    height: 85,
                  ),
                  const Text(
                    'Locker Number',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 22,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '$lockerName',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: InputField(
                            title: 'Start Date',
                            hint: '${startDate}',
                            widget: Container()),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: InputField(
                          title: 'End Date',
                          hint: '${endDate}',
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
                      onPressed: () {
                        openPagePaymentWithListener();
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
        //  DateTime enddate = DateFormat("yyyy-MM-dd").parse("2022-05-04");
        DateTime startrenew = DateFormat("yyyy-MM-dd").parse("2022-05-04");
        DateTime todayDate = DateFormat("yyyy-MM-dd").parse("2022-05-04");
        int rendifference = 0;
        int rendifference2 = 0;
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

        if (from == "2") {
          await FirebaseFirestore.instance
              .collection("Reservation")
              .doc("${FirebaseAuth.instance.currentUser!.uid}")
              .update({
            //store reservation info in databas
            "End Date": endDate,
            "Price": totalPrice,
            // "priceOneWeek": priceOneWeek, //another way
            "semester": semester
          });
        } else {
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
        }

        canrenew() {
          startrenew = DateTime.parse(endDate).subtract(Duration(days: 3));
          rendifference =
              DateTime.parse(endDate).difference(startrenew).inMinutes;
          rendifference2 =
              DateTime.parse(endDate).difference(todayDate).inMinutes;
        }

        FutureBuilder(
          future: canrenew(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Text('');
            }
          },
        );

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
                .update({"available": false});
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
                .update({"maintanence": false});
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
          DateTime date = DateTime.parse(doc2['End Date']);

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
