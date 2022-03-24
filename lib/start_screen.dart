import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:relocker_sa/bloc/cubit/auth_cubit.dart';
import 'package:relocker_sa/bloc/states/auth_states.dart';
import 'package:relocker_sa/register_screen.dart';

import 'login_screen.dart';

class StartScreen extends StatefulWidget {
  StartScreen({Key? key}) : super(key: key);



  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state){},
      builder: (context, state) => Scaffold(
        key: _scaffoldKey,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/backgraound.png',),
              fit: BoxFit.cover
            ),
          ),
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 300),
                child: Column(
                  mainAxisSize: MainAxisSize.min,

                  children: [
                    const Text(
                      'ReLocker',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 44,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width / 3),
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
                          primary: Colors.grey.shade300,
                          shape: const StadiumBorder(),
                        ),
                        onPressed: (){
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
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
                    //     onPressed: (){
                    //       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => RegisterScreen()));
                    //     },
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
