import 'package:flutter/material.dart';


class RelockerLogoWidget extends StatelessWidget {
  const RelockerLogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: 80,
      padding: EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xFF50796b),
      ),
      child: Column(
        children: [
          const SizedBox(height: 4),
          componnat(),
          componnat(),
          componnat(),
          const SizedBox(height: 30),
          Row(
            children: [
              Padding(
              padding: const EdgeInsets.only( left: 7),
              child: Container(
                height: 20,
                width: 8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xFFe0e9e6),
                ),
              ),
        ),
              const Spacer(),
            ],
          ),
          const SizedBox(height: 58),
          componnat(),
        ],
      ),
    );
  }

  Widget componnat(){
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0, right: 2, left: 2),
      child: Container(
        height: 8,
        width: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color(0xFFe0e9e6),
        ),
      ),
    );
  }
}
