import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:relocker_sa/bloc/cubit/auth_cubit.dart';
import 'package:relocker_sa/bloc/states/auth_states.dart';
import 'package:relocker_sa/login_screen.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({Key? key}) : super(key: key);

  GlobalKey<FormState> _resetFormKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is AuthResetPasswordSuccessState) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => LoginScreen()));
          showDialog(
              context: context,
              builder: (context) {
                return Container(
                  clipBehavior: Clip.hardEdge,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(30)),
                  child: AlertDialog(
                    title: Text(
                      "Check your email pleas to reset password",
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
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
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
          body: Container(
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
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.width / 5),
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      splashRadius: 24,
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width / 5),
                    const Text(
                      'Forgot\nPassword',
                      style: TextStyle(
                        color: Color(0xFF213569),
                        fontSize: 44,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width / 3),
                    Form(
                      key: _resetFormKey,
                      child: TextFormField(
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            hintText: 'user@email.com',
                            prefixIcon: Icon(Icons.email_outlined)),
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
                    ),
                    const SizedBox(height: 50),
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
                              if (state is AuthResetPasswordSuccessState) {}
                              _cubit.resetPassword();
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
