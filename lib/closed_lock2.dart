import 'dart:async';
import 'dart:math';
import 'package:adobe_xd/pinned.dart';
import 'package:adobe_xd/adobe_xd.dart';
import 'package:email_auth/email_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:relocker_sa/opened_lock.dart';
import 'package:shared_preferences/shared_preferences.dart';

class closed_lockc extends StatefulWidget {
  @override
  State<closed_lockc> createState() => _closed_lockcState();
}

final random = Random();
int randomNumber = random.nextInt(10) * 1000;

class _closed_lockcState extends State<closed_lockc> {
  bool click = true;

  TextEditingController emailCont = new TextEditingController();
  TextEditingController otpCont = new TextEditingController();

  getCode() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var today = DateTime.now();
    var spCode = sp.getString("code");
    String expDate2 = '2022-02-13';
    DateTime expDate = DateFormat("yyyy-MM-dd").parse(expDate2);
    // DateFormat("yyyy-MM-dd").parse("${sp.getString("date")}");

    var d = (today.difference(expDate).inHours / 24).round();

    if ((spCode == null || spCode == '') || d > 0) {
      await sp.setString("code", randomNumber.toString());
      await sp.setString("date", DateTime.now().toString().split(" ").first);
      Future.delayed(Duration(seconds: 1), () {
        getCode();
      });
    } else {
      setState(() {
        code = spCode;
        // code = "2567";
        genCodeList.clear();
        print('here');
        genCode(code);
      });
    }
  }

  void genCode(String code) {
    for (int i = 0; i < 4; i++) {
      if (i == 0) {
        genCodeList.add('${code.substring(0, 1)}***');
      } else if (i == 1) {
        genCodeList.add('*${code.substring(1, 2)}**');
      } else if (i == 2) {
        genCodeList.add('**${code.substring(2, 3)}*');
      } else if (i == 3) {
        genCodeList.add('***${code.substring(3)}');
      }
    }
    genCodeList.shuffle();
    print(genCodeList[0]);
    print(genCodeList[1]);
    print(genCodeList[2]);
    print(genCodeList[3]);
  }

  bool showCode = false;
  String code = "1234";
  List<String> genCodeList = ['****', '****', '****', '****'];
  String codeShowString = '****';

  late Timer timer;
  late Timer timer2;

  int start = 10;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    timer2 = new Timer.periodic(
      oneSec,
      (Timer timer) async {
        if (start == 0) {
          setState(() {
            codeShowString = '****';
            timer.cancel();
            start = 10;
          });
        } else if (start == 10) {
          codeShowString = '****';
          setState(() {
            start--;
          });
        } else if (start == 8) {
          codeShowString = genCodeList[0];
          setState(() {
            start--;
          });
        } else if (start == 6) {
          codeShowString = genCodeList[1];
          setState(() {
            start--;
          });
        } else if (start == 4) {
          codeShowString = genCodeList[2];
          setState(() {
            start--;
          });
        } else if (start == 2) {
          codeShowString = genCodeList[3];
          setState(() {
            start--;
          });
        } else {
          start--;
        }
      },
    );
  }

  late EmailAuth emailAuth;

  @override
  void initState() {
    getCode();
    emailAuth = new EmailAuth(sessionName: "ReLocker");
    //sendOtp();
    super.initState();
  }

  void sendOtp() async {
    Future.delayed(Duration.zero, () {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("loading ..."),
            );
          });
    });

    bool result = await emailAuth.sendOtp(
        recipientMail: "${FirebaseAuth.instance.currentUser!.email}",
        otpLength: 6);

    if (result) {
      Navigator.of(context).pop();
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
                title: Text("Enter code"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: otpCont,
                    ),
                  ],
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () async {
                      verify();
                      if (verify()) {
                        setState(() {
                          showCode = true;
                          otpCont.text = "";
                          startTimer();
                        });
                        Navigator.of(context).pop();

                        Future.delayed(Duration(seconds: 20), () {
                          setState(() {
                            showCode = false;
                          });
                        });
                      } else {
                        Navigator.of(context).pop();

                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("code not correct"),
                              );
                            });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff88d8bb),
                      shape: StadiumBorder(),
                    ),
                    child: Text(
                      "verify",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  )
                ]);
          });
    }
  }

  bool verify() {
    return emailAuth.validateOtp(
        recipientMail: "${FirebaseAuth.instance.currentUser!.email}",
        userOtp: otpCont.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * .6,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(40)),
                  color:
                      (click == false) ? Color(0xffff7272) : Color(0xff88d8bb),
                ),
              ),
              Positioned(
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.width / 2.8,
                      width: MediaQuery.of(context).size.width / 2.8,
                      child: SizedBox(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => opened_lock()));
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            shape: const StadiumBorder(),
                          ),
                          child: Icon(
                            (click == false)
                                ? Icons.lock_open_rounded
                                : Icons.lock_outline_rounded,
                            size: 70,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                right: 0,
                left: 0,
                bottom: MediaQuery.of(context).size.width / -6,
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  child: ListTile(
                    tileColor: Colors.grey.shade200,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    title: Text(
                      showCode ? codeShowString : "PIN code",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    trailing: TextButton(
                      onPressed: showCode
                          ? null
                          : () async {
                              sendOtp();
                            },
                      child: Text(
                        "show",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "code will showen withing 20 seconds",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                Text(
                  'Locker Key',
                  style: TextStyle(
                    fontFamily: 'Helvetica Neue',
                    fontSize: 28,
                    color: const Color(0xff000000),
                    height: -22,
                  ),
                  textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: true),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}