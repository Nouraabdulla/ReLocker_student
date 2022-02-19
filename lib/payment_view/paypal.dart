import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_braintree/flutter_braintree.dart';
import 'package:relocker_sa/home_view.dart';

import '../controller_view_screen.dart';

class PayPal extends StatefulWidget {
  const PayPal({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<PayPal> createState() => _PayPalState();
}

class _PayPalState extends State<PayPal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff88d8bb),
        title: Text("Payment"),
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        foregroundColor: Colors.black,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(15),
          height: 100,
          width: 200,
          child: ElevatedButton(
            child: Text(
              'Checkout',
              style: TextStyle(fontSize: 22),
            ),
            onPressed: () async {
              var request = BraintreeDropInRequest(
                  tokenizationKey: 'sandbox_cs83fywp_zq4jnsck8wm585s9',
                  collectDeviceData: true,
                  paypalRequest: BraintreePayPalRequest(
                      amount: '10.00', displayName: 'paypal payment'),
                  cardEnabled: true);
              BraintreeDropInResult? result =
                  await BraintreeDropIn.start(request);
              if (result != null) {
                print(result.paymentMethodNonce.description);
                print(result.paymentMethodNonce.nonce);
                Random _rand = Random();
                int check = _rand.nextInt(6);
                if (check < 5) {
                  String lokerKey = getRandomString(12);
                  CollectionReference user =
                      FirebaseFirestore.instance.collection('Users');
                  await user
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .update({'loker_key': lokerKey});
                  showAlert("your payment is Success!");
                } else {
                  showAlert(
                      "Faild Paid, check your information please try again!");
                }
              }
            },
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Color.fromRGBO(137, 216, 187, 1)),
            ),
          ),
        ),
      ),
    );
  }

  String getRandomString(int length) {
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random _rnd = Random();
    return String.fromCharCodes(
      List.generate(
        length,
        (_) => _chars.codeUnitAt(
          _rnd.nextInt(_chars.length),
        ),
      ),
    );
  }

  Future showAlert(String title) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(title),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    if (title == "Success!") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const ControllerViewScreen()));
                    } else {
                      Navigator.pop(context);
                    }
                  },
                  child: Text("Ok!"),
                ),
              ],
            ));
  }
}
