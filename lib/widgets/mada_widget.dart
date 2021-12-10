import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class MadaWidget extends StatelessWidget {
  const MadaWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3,
      height: MediaQuery.of(context).size.width / 3,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color(0xFFe4e4e4)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [

              Container(
                height: 20,
                width: 47,
                color: const Color(0xFF438fc3),
              ),
              const SizedBox(width:10),
              const Text(
                'مدى',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
                textAlign: TextAlign.end,
              ),

            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Container(
                height: 20,
                width: 47,
                color: const Color(0xFF88b74d),
              ),
              const SizedBox(width:5),
              const Text(
                'Mada',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ],
      )
    );
  }
}
