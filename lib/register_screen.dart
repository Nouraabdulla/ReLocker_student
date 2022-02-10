import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:relocker_sa/bloc/cubit/auth_cubit.dart';
import 'package:relocker_sa/bloc/states/auth_states.dart';

import 'controller_view_screen.dart';
import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is AuthSignUpSuccessState) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => ControllerViewScreen()));
        } else if (state is AuthSignUpErrorState) {
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
                        width: MediaQuery.of(context).size.width / 6,
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
                padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.width / 3.3),
                        const Text(
                          'Create\nAccount',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 44,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 30),
                        TextFormField(
                          decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              hintText: 'student@gmail.com',
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
                        const SizedBox(height: 10),
                        TextFormField(
                          decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              hintText: 'Username',
                              prefixIcon: Icon(Icons.person)),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'You must enter username';
                            }
                            if (value.contains('\\')) {
                              return 'Please not enter a spacial Char';
                            }
                            if (value.contains('/')) {
                              return 'Please not enter a spacial Char';
                            }
                            if (value.contains('*')) {
                              return 'Please not enter a spacial Char';
                            }
                            if (value.contains('+')) {
                              return 'Please not enter a spacial Char';
                            }
                            if (value.contains('.')) {
                              return 'Please not enter a spacial Char';
                            }
                            if (value.contains('#')) {
                              return 'Please not enter a spacial Char';
                            }
                            if (value.contains('%')) {
                              return 'Please not enter a spacial Char';
                            }
                            if (value.contains('!')) {
                              return 'Please not enter a spacial Char';
                            }
                            if (value.contains('^')) {
                              return 'Please not enter a spacial Char';
                            }
                            if (value.contains('&')) {
                              return 'Please not enter a spacial Char';
                            }
                            if (value.contains('=')) {
                              return 'Please not enter a spacial Char';
                            }
                            if (value.contains('@')) {
                              return 'Please not enter a spacial Char';
                            }
                            if (value.contains('%')) {
                              return 'Please not enter a spacial Char';
                            }
                            if (value.contains('^')) {
                              return 'Please not enter a spacial Char';
                            }
                            if (value.contains('&')) {
                              return 'Please not enter a spacial Char';
                            }
                            if (value.contains('(')) {
                              return 'Please not enter a spacial Char';
                            }
                            if (value.contains(')')) {
                              return 'Please not enter a spacial Char';
                            }
                            if (value.contains('-')) {
                              return 'Please not enter a spacial Char';
                            }
                            if (value.contains('{')) {
                              return 'Please not enter a spacial Char';
                            }
                            if (value.contains('_')) {
                              return 'Please not enter a spacial Char';
                            }
                            if (value.contains('{')) {
                              return 'Please not enter a spacial Char';
                            }
                            if (value.contains('|')) {
                              return 'Please not enter a spacial Char';
                            }
                            if (value.contains('?')) {
                              return 'Please not enter a spacial Char';
                            }
                            if (value.contains(':')) {
                              return 'Please not enter a spacial Char';
                            }
                            if (value.contains(';')) {
                              return 'Please not enter a spacial Char';
                            }
                            if (value.contains('"')) {
                              return 'Please not enter a spacial Char';
                            }
                            if (value.contains('\'')) {
                              return 'Please not enter a spacial Char';
                            }
                            if (value.contains('>')) {
                              return 'Please not enter a spacial Char';
                            }
                            if (value.contains('<>')) {
                              return 'Please not enter a spacial Char';
                            }
                            if (value.contains('~')) {
                              return 'Please not enter a spacial Char';
                            }
                            if (value.contains('`')) {
                              return 'Please not enter a spacial Char';
                            }
                            if (value.contains('``')) {
                              return 'Please not enter a spacial Char';
                            }
                            if (value.contains(',')) {
                              return 'Please not enter a spacial Char';
                            }
                          },
                          onSaved: (val) {
                            _cubit.userName = val;
                          },
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              hintText: 'Phone Number (optional)',
                              prefixIcon: Icon(Icons.phone)),
                          keyboardType: TextInputType.phone,
                          onSaved: (val) {
                            _cubit.phone = val;
                            _cubit.reservedlocker = "";
                          },
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              hintText: 'Password',
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
                            if (value.length < 8) {
                              return 'Password is too short!';
                            }
                            if (value != _password.text) {
                              return 'Confirmed password do not match password';
                            }
                          },
                        ),
                        const SizedBox(height: 25),
                        Column(
                          children: [
                            Conditional.single(
                              context: context,
                              conditionBuilder: (BuildContext context) =>
                                  state is! AuthSignUpLoadingState,
                              widgetBuilder: (BuildContext context) => SizedBox(
                                width: MediaQuery.of(context).size.width / 1.5,
                                height: MediaQuery.of(context).size.width / 8,
                                child: ElevatedButton(
                                  child: const Text(
                                    'SIGN UP',
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
                                    _formKey.currentState!.save();
                                    if (_formKey.currentState!.validate()) {
                                      await _cubit.signUp();
                                    }
                                  },
                                ),
                              ),
                              fallbackBuilder: (BuildContext context) =>
                                  const CircularProgressIndicator(
                                color: Color(0xFF9AD6BD),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                Expanded(
                                    child: Container(
                                  height: 2,
                                  color: Colors.black54,
                                )),
                                const Text('  OR  '),
                                Expanded(
                                    child: Container(
                                  height: 2,
                                  color: Colors.black54,
                                )),
                              ],
                            ),
                            const SizedBox(height: 5),
                            SizedBox(
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
                                  primary: Color(0xFF9AD6BD),
                                  shape: const StadiumBorder(),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) => LoginScreen()));
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
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

  validateMobile(String? value) {
    String patttern = r'(^(?:[+0966])?[0-9]{9,12})';
    RegExp regExp = new RegExp(patttern);
    if (value!.length == 0 || value.length > 10) {
      return 'Please enter valid mobile number';
    }
    if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
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
        return 'password should contain at least one upper and lower case, one digit, Special character';
      else
        return null;
    }
  }
}
