import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:relocker_sa/bloc/cubit/auth_cubit.dart';
import 'package:relocker_sa/bloc/states/auth_states.dart';
import 'package:relocker_sa/controller_admin.dart';
import 'package:relocker_sa/controller_view_screen.dart';
import 'package:relocker_sa/forget_password.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  User? user;
  //  Query? _ref;
  /*List list = [];
  var c;
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  getData() async {
    await users
        .where('user_id', isEqualTo: 'yZYn8R8F80fTm2uVdI8vCGFkwzC3')
        .get()
        .then((value) async {
      value.docs.forEach((element) {
        list.add(element.data());
      });
    });
    c = list[0];
  }
  @override
  void initState() {
    _ref = FirebaseFirestore.instance.collection('Users').orderBy('user_id');
    super.initState();
  }
*/
  @override
  Widget build(BuildContext context) {
    AuthCubit _cubit = AuthCubit.get(context);
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        // if (state is AuthSignInSuccessState) {
        if (state is AuthSignInSuccessState &&
            _cubit.email == "shoogalsaif1@gmail.com") {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => controlleradmin()));
        } else if (state is AuthSignInSuccessState) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => ControllerViewScreen()));
        } else if (state is AuthSignInErrorState) {
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
                      style: const TextStyle(
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
                          },
                        ),
                      ),
                    ],
                  ),
                );
              });
        }
      },
      builder: (context, state) {
        AuthCubit _cubit = AuthCubit.get(context);
        return Scaffold(
          // key: _scaffoldKey,
          body: SafeArea(
            child: Container(
              height: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/background2.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.width / 3.3),
                        const Text(
                          'Welcome\nBack',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 44,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 50),
                        TextFormField(
                          decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              hintText: 'user@email.com',
                              prefixIcon: Icon(Icons.email_outlined)),
                          autofocus: false,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'You must enter your email';
                            }
                            if (!value.contains('@')) {
                              return 'Please enter a valid email';
                            }
                            if (!value.endsWith('.com')) {
                              return 'Please enter a valid email';
                            }
                          },
                          onSaved: (val) {
                            _cubit.email = val;
                          },
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              hintText: 'Password',
                              prefixIcon: Icon(Icons.vpn_key_outlined)),
                          obscureText: true,
                          autofocus: false,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'You must enter password';
                            }
                            if (value.length < 8) {
                              return 'Password is too short!';
                            }
                          },
                          onSaved: (val) {
                            _cubit.password = val;
                          },
                        ),
                        // Row(
                        //   children: [
                        //     const Spacer(),
                        //     TextButton(
                        //       child: const Text(
                        //         'Forget Password?',
                        //         style: TextStyle(
                        //           fontSize: 18,
                        //           color: Colors.black,
                        //         ),
                        //       ),
                        //       onPressed: () {
                        //         Navigator.of(context).push(MaterialPageRoute(
                        //             builder: (context) => ForgetPassword()));
                        //       },
                        //     ),
                        //   ],
                        // ),
                        const SizedBox(height: 50),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Conditional.single(
                              context: context,
                              conditionBuilder: (BuildContext context) =>
                                  state is! AuthSignInLoadingState,
                              widgetBuilder: (BuildContext context) => SizedBox(
                                width: MediaQuery.of(context).size.width / 1.5,
                                height: MediaQuery.of(context).size.width / 8,
                                child: ElevatedButton(
                                  child: const Text(
                                    'LOG IN',
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 18,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.grey.shade300,
                                    shape: const StadiumBorder(),
                                  ),
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();
                                      await _cubit.logIn();
                                    }
                                  },
                                ),
                              ),
                              fallbackBuilder: (BuildContext context) =>
                                  const CircularProgressIndicator(),
                            ),
                           
                            const SizedBox(height: 5),
                            // SizedBox(
                            //   width: MediaQuery.of(context).size.width / 1.5,
                            //   height: MediaQuery.of(context).size.width / 8,
                            //   child: ElevatedButton(
                            //     child: const Text(
                            //       'SIGN UP',
                            //       style: TextStyle(
                            //         color: Colors.black87,
                            //         fontSize: 18,
                            //       ),
                            //     ),
                            //     style: ElevatedButton.styleFrom(
                            //       primary: Color(0xFF9AD6BD),
                            //       shape: const StadiumBorder(),
                            //     ),
                            //     onPressed: () {
                            //       Navigator.of(context).push(MaterialPageRoute(
                            //           builder: (context) => RegisterScreen()));
                            //     },
                            //   ),
                            // ),
                          ],
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
