import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_auth/email_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:relocker_sa/bloc/cubit/auth_cubit.dart';
import 'package:relocker_sa/bloc/states/auth_states.dart';
import 'package:relocker_sa/new_paaword.dart';

class forget_passsword_2 extends StatefulWidget {
  forget_passsword_2({
    Key? key,
  }) : super(key: key);

  @override
  State<forget_passsword_2> createState() => _forget_passsword_2();
}

late EmailAuth emailAuth;

class _forget_passsword_2 extends State<forget_passsword_2> {
  @override
  void initState() {
    super.initState();
    emailAuth = new EmailAuth(sessionName: "ReLocker");
    //sendOtp();
  }

  TextEditingController emailCont = TextEditingController();
  TextEditingController otpCont = TextEditingController();
  GlobalKey<FormState> _resetFormKey = GlobalKey<FormState>();

  void sendOtp() async {
    emailAuth.sessionName = "ReLocker";
    var result = await emailAuth.sendOtp(
        recipientMail: emailCont.value.text, otpLength: 6);
    if (result) {
      print("otp send");
    } else {
      print("we could not send the otp");
    }
  }

  // User? user = FirebaseAuth.instance.currentUser;

  String verify() {
    var result = emailAuth.validateOtp(
        recipientMail: emailCont.text, userOtp: otpCont.text);

    if (result) {
      // Navigator.of(context).pushReplacement(
      //     MaterialPageRoute(builder: (context) => new_paaword(useremail1:useremail)));
      print("otp verified");
      return '';
    } else {
      return 'verification code is not correct';
    }
  }
 String useremail="";
  var id = FirebaseFirestore.instance.collection('Users');

  Future<bool> checkemail(String email) async {
    final list = await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
    if (list.isNotEmpty) {
      useremail=email;
      showDialog(
          context: context,
          builder: (context) {
            return Container(
              clipBehavior: Clip.hardEdge,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(30)),
              child: AlertDialog(
                title: Text(
                  "Verification code sent to your email",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 18,
                  ),
                ),
                actions: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 5,
                    height: MediaQuery.of(context).size.width / 9,
                    child: ElevatedButton(
                      child: const Text(
                        'Ok',
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
                        Navigator.of(context).pop();
          //                Navigator.of(context).pushReplacement(
          // MaterialPageRoute(builder: (context) => new_paaword(useremail1:useremail)));
                      },
                    ),
                  ),
                ],
              ),
            );
          });
      sendOtp();
      return true;
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return Container(
              clipBehavior: Clip.hardEdge,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(30)),
              child: AlertDialog(
                title: Text(
                  "user not found",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 18,
                  ),
                ),
                actions: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 5,
                    height: MediaQuery.of(context).size.width / 9,
                    child: ElevatedButton(
                      child: const Text(
                        'Ok',
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
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
            );
          });
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AuthCubit _cubit = AuthCubit.get(context);
          return Scaffold(
              backgroundColor: Colors.white,
              body: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/background2.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              height: MediaQuery.of(context).size.width / 5),
                          IconButton(
                            onPressed: () => Navigator.of(context).pop(),
                            splashRadius: 24,
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              size: 30,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.width / 5),
                          const Text(
                            'Forgot\nPassword',
                            style: TextStyle(
                              color: Color(0xFF213569),
                              fontSize: 44,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 90.0,
                          ),
                          Form(
                            key: _resetFormKey,
                             child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                             TextFormField(
                              controller: emailCont,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hintText: "Enter email",
                                labelText: "Email",
                                // suffixIcon: TextButton(
                                //   child: Text(
                                //     "Send code",
                                //     style: TextStyle(
                                //       color: Colors.black,
                                //       fontSize: 18,
                                //       decoration: TextDecoration.underline,
                                //     ),
                                //   ),
                                //   onPressed: () {
                                //     checkemail(emailCont.text);
                                //   },
                                // )
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'You must enter your email';
                                }
                              },
                              onSaved: (val) {
                                _cubit.email = val;
                              },
                            ),
                          
                          SizedBox(
                            height: 30.0,
                          ),
                          Center(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width / 1.4,
                              height: MediaQuery.of(context).size.width / 8,
                              child: ElevatedButton(
                                child: const Text(
                                  'Send',
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
                                  _resetFormKey.currentState!.save();
                                  if (_resetFormKey.currentState!.validate()) {
                                    checkemail(emailCont.text);
                                  }
                                },
                              ),
                            ),
                          ),
                           ])),
                          TextFormField(
                            controller: otpCont,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: "Enter the verification code",
                              labelText: "Verification code",
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'You must enter verification code';
                              }
                            }
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          Center(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width / 3.0,
                              height: MediaQuery.of(context).size.width / 8,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xFF9AD6BD),
                                  shape: const StadiumBorder(),
                                ),
                                onPressed: () {
                                   _resetFormKey.currentState!.save();
                                  if (_resetFormKey.currentState!.validate()) {
                                  verify();
                                  }
                                },
                                child: Text(
                                  "Verify otp",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          )
                          // ]))
                        ],
                      ),
                    )),
              ));
        });
  }
}// end class
