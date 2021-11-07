import 'package:flutter/material.dart';


class SupportView extends StatefulWidget {
  const SupportView({Key? key}) : super(key: key);

  @override
  _SupportViewState createState() => _SupportViewState();
}

class _SupportViewState extends State<SupportView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFd3f3e6),
      body: Center(
        child: Text('Support'),
      ),
    );
  }
}
