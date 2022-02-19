import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:relocker_sa/Home_admin.dart';
import 'package:relocker_sa/Request.dart';
import 'package:relocker_sa/bloc/states/auth_states.dart';
import 'package:relocker_sa/login_screen.dart';
import 'package:relocker_sa/search_lockername.dart';
import 'package:relocker_sa/start_screen.dart';
import 'package:relocker_sa/support_view.dart';

import 'bloc/cubit/auth_cubit.dart';
import 'home_view.dart';

class controlleradmin extends StatefulWidget {
  const controlleradmin({Key? key}) : super(key: key);

  @override
  State<controlleradmin> createState() => _Controlleradmin();
}

class _Controlleradmin extends State<controlleradmin> {
  int currentIndex = 2;
  List _screen = [Requests(), Homeadmin()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFd3f3e6),
      body: currentIndex > 0 ? _screen[currentIndex - 1] : _screen[0],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(25),
          topLeft: Radius.circular(25),
        ),
        clipBehavior: Clip.hardEdge,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: IconButton(
                icon: Icon(
                  Icons.more_horiz_outlined,
                  size: 30,
                ),
                onPressed: () {
                  setState(() {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(height: 10),
                              Container(
                                height: 2,
                                width: 40,
                                color: Colors.grey[300],
                              ),
                              const SizedBox(height: 70),
                              const Divider(
                                color: Colors.grey,
                                height: 2,
                                thickness: 2,
                              ),
                              GestureDetector(
                                child: const ListTile(
                                  title: Text('Contatc occupier'),
                                  leading: Icon(Icons.person),
                                ),
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          search_lockername()));
                                },
                              ),
                              const Divider(
                                color: Colors.grey,
                                height: 2,
                                thickness: 2,
                              ),
                              const SizedBox(height: 40),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 1.5,
                                height: MediaQuery.of(context).size.width / 8,
                                child: BlocConsumer<AuthCubit, AuthStates>(
                                  listener: (context, state) {},
                                  builder: (context, state) => ElevatedButton(
                                    child: const Text(
                                      'LOG OUT',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.red,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        )),
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Container(
                                              clipBehavior: Clip.hardEdge,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)),
                                              child: AlertDialog(
                                                title: Text(
                                                  "Are you sure you want to logout?",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                                actions: [
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            5,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            9,
                                                    child: ElevatedButton(
                                                      child: const Text(
                                                        'Yes',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        primary:
                                                            Color(0xFF9AD6BD),
                                                        shape:
                                                            const StadiumBorder(),
                                                      ),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                        AuthCubit.get(context)
                                                            .signOut();

                                                        Navigator.of(context)
                                                            .pushReplacement(
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            StartScreen()));
                                                      },
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            5,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            9,
                                                    child: ElevatedButton(
                                                      child: const Text(
                                                        'No',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        primary:
                                                            Color(0xFF9AD6BD),
                                                        shape:
                                                            const StadiumBorder(),
                                                      ),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          });
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(height: 40),
                            ],
                          ),
                        );
                      },
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      ),
                      clipBehavior: Clip.hardEdge,
                    );
                  });
                },
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                height: 35,
                width: 35,
                child: Icon(
                  Icons.chat,
                  color: currentIndex == 1 ? Colors.blue : Colors.grey[800],
                ),
              ),
              label: '',
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
              ),
              label: '',
            ),
          ],
          selectedItemColor: Colors.blue,
          currentIndex: currentIndex,
          onTap: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
