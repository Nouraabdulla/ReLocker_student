import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';
import 'package:relocker_sa/login_screen.dart';
import 'package:relocker_sa/forget_password_2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:relocker_sa/bloc/cubit/auth_cubit.dart';
import 'package:relocker_sa/bloc/states/auth_states.dart';
import 'package:relocker_sa/models/user_model.dart';

class new_paaword extends StatefulWidget {
  new_paaword({
    Key? key,
  }) : super(key: key);

  @override
  State<new_paaword> createState() => _new_paaword();
}

late EmailAuth emailAuth;

class _new_paaword extends State<new_paaword> {
  @override
  void initState() {
    super.initState();
    // emailAuth = new EmailAuth(sessionName: "ReLocker");
    //sendOtp();
  }

  TextEditingController _password = TextEditingController();
  GlobalKey<FormState> _resetFormKey = GlobalKey<FormState>();

// final cred=EmailAuthProvider.credential(email: useremail, password: _password.text);
// @override

  // User? user = FirebaseAuth.instance.currentUser;


  @override
  Widget build(BuildContext context) {
    AuthCubit _cubit = AuthCubit.get(context);
    return BlocConsumer<AuthCubit, AuthStates>(listener: (context, state) {
      if (state is AuthResetPasswordSuccessState) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => LoginScreen()));
        showDialog(
            context: context,
            builder: (context) {
              return Container(
                clipBehavior: Clip.hardEdge,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(30)),
                child: AlertDialog(
                  title: Text(
                    "password save",
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
      } else if (state is AuthResetPasswordErrorState) {
        showDialog(
            context: context,
            builder: (context) {
              return Container(
                clipBehavior: Clip.hardEdge,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(30)),
                child: AlertDialog(
                  title: Text(
                    state.error.toString(),
                    style: TextStyle(
                      color: Colors.red,
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
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                        },
                      ),
                    ),
                  ],
                ),
              );
            });
      }
    }, builder: (context, state) {
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
                      SizedBox(height: MediaQuery.of(context).size.width / 5),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        splashRadius: 24,
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.width / 5),
                      const Text(
                        'Reset\nPassword',
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
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            hintText: 'Enter new Password',
                            prefixIcon: Icon(Icons.vpn_key_outlined)),
                        obscureText: true,
                        validator: (value) {
                          return validatePassword(value);
                        },
                        controller: _password,
                        onSaved: (val) {
                          _cubit.password = val;

                        },
                      ),
                      
                      SizedBox(
                        height: 30.0,
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            hintText: 'Confirm Password',
                            prefixIcon: Icon(Icons.vpn_key_outlined)),
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'You must enter password';
                          }
                          if (value != _password.text) {
                            return 'Confirmed password do not match password';
                          }
                        },
                        
                      ),
                      
                      const SizedBox(height: 30),
                      Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 3.0,
                          height: MediaQuery.of(context).size.width / 8,
                          child: ElevatedButton(
                            child: const Text(
                              'Confirm',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 18,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: const Color(0xFF9AD6BD),
                              shape: const StadiumBorder(),
                            ),
                            onPressed: () {
                              _resetFormKey.currentState!.save();
                              if (_resetFormKey.currentState!.validate()) {
                              //   if (state is AuthResetPasswordSuccessState) {}
                              //   _cubit.resetPassword();
                            // UserModel1(email:widget.useremail1,pass:_password.text);
                          
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                              }
                            },
                          ),
                        ),
                      ),
                      ]
                        )
                      ),
                    ],
                  ),
                )),
          ));
    });
  }

  String? validatePassword(String? value) {
    var pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = new RegExp(pattern);
    print(value);
    if (value!.length < 7) {
      return 'password is too short';
    } else if (value.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value))
        return 'password should contain at least one upper\n and lower case, one digit, \nSpecial character';
      else
        return null;
    }
  }
}
// class UserModel1 {
//   final String? email;
//   final String? pass;
 
//   UserModel1({this.email, this.pass});
 
//   factory UserModel1.fromJson(Map<String, dynamic> json) {
//     return UserModel1(
//       email: json['email'],
//       pass: json['password'],
//     );
//   }
//    toJson(){
//     return {
//       "email": email,
//       "password": pass,
//     };
//   }
// }

// Future<UserModel1> updateAlbum(String pass,String email) async {
//   final response = await http.put(
//     Uri.parse('https://console.firebase.google.com/u/1/project/relocker-a1bd0/database/relocker-a1bd0-default-rtdb/data'),
   
//     body: jsonEncode(<String, String>{
//       'email':email,
//       'password': pass,
//     }),
//   );
//   // Dispatch action depending upon
//   // the server response
//   if (response.statusCode == 200) {
//     return UserModel1.fromJson(json.decode(response.body));
//   } else {
//     throw Exception('Failed to load album');
//   }
// }